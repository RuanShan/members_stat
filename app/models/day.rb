class Day
  # supposed every day is bonus day  bonus_per_unit /day,sale
  class_attribute :bonus_per_unit, :kick_out_until, :pending_days_after_sale

  self.bonus_per_unit = 11.12
  self.kick_out_until = 2890
  self.pending_days_after_sale = 5

  attr_accessor :customer
  delegate :name, to: :customer, prefix: true


  def initialize( customer )
    self.customer = customer
  end

  def bonus
    EffectiveConfig.current_bonus_per_unit
  end

end
