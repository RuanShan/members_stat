class Day
  # supposed every day is bonus day  bonus_per_share /day,sale
  class_attribute :bonus_per_share, :kick_out_until, :pending_days_after_sale

  self.bonus_per_share = 11.12
  self.kick_out_until = 2890
  self.pending_days_after_sale = 5

  attr_accessor :customer, :datetime
  delegate :name, to: :customer, prefix: true


  def initialize( customer, datetime=DateTime.current )
    self.customer = customer
    self.datetime = datetime.in_time_zone #suport +-
  end

  def bonus
    sale_days.sum( &:bonus )
  end


  def daily_bonus
    sale_days.sum( &:daily_bonus )
  end

  # total_bonus_days==bonus_days, if kickout.
  def total_bonus_days

  end

  def sale_days
    @sale_days ||=  self.customer.sales.map{|sale|  sale.day( self.datetime )  }
  end
end
