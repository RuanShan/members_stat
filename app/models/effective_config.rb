class EffectiveConfig < ActiveRecord::Base

  DEFAULT_BONUS_PER_SHARE = 7.0
  DEFAULT_KICK_OUT_UNTIL = 2890
  DEFAULT_PENDING_DAYS_AFTER_SALE = 5

  enum ename: { bonus_per_share: 0, kick_out_until: 1, pending_days_after_sale: 2, no_bonus_date: 3 }

  default_scope { order('effect_at desc') }

  def casted_value
    effect_value.to_i
  end

  # 每一單，每天反利
  def self.current_bonus_per_share
    self.class.bonus_per_share.first.casted_value rescue DEFAULT_BONUS_PER_SHARE
  end

  # 每一單，反利退出值
  def self.current_kick_out_until
    self.class.kick_out_until.first.casted_value rescue  DEFAULT_KICK_OUT_UNTIL
  end

  # 每一單，成交多久後反利
  def self.current_pending_days_after_sale
    self.class.pending_days_after_sale.first.casted_value rescue DEFAULT_PENDING_DAYS_AFTER_SALE
  end
end
