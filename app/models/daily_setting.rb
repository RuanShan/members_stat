class DailySetting < ActiveRecord::Base

  DEFAULT_BONUS_PER_SHARE = 7.0
  DEFAULT_KICK_OUT_UNTIL = 2890
  DEFAULT_PENDING_DAYS_AFTER_SALE = 5

  enum ename: { bonus_per_share: 0, kick_out_until: 1, pending_days_after_sale: 2 }

  default_scope { order('effect_at desc') }

  def casted_value
    effect_value.to_i
  end

  # 每一單，每天反利
  def self.current_bonus_per_share
    ( bonus_per_share.first.try(:casted_value) || DEFAULT_BONUS_PER_SHARE)
  end

  # 每一單，反利退出值
  def self.current_kick_out_until
    (kick_out_until.first.try(:casted_value) ||  DEFAULT_KICK_OUT_UNTIL)
  end

  # 每一單，成交多久後反利
  def self.current_pending_days_after_sale
    (pending_days_after_sale.first.try(:casted_value) || DEFAULT_PENDING_DAYS_AFTER_SALE)
  end
end
