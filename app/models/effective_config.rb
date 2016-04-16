class EffectiveConfig < ActiveRecord::Base

  enum ename: { bonus_per_unit: 0, kick_out_until: 1, pending_days_after_sale: 2 }

  default_scope { order('effect_at desc') }

  def casted_value
    effect_value.to_i
  end

  def self.current_bonus_per_unit
    self.class.bonus_per_unit.first.casted_value
  end

  def self.current_kick_out_until
    self.class.kick_out_until.first.casted_value
  end

  def self.current_pending_days_after_sale
    self.class.pending_days_after_sale.first.casted_value    
  end
end
