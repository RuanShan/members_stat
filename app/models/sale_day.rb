class SaleDay
  attr_accessor :sale, :datetime


  def initialize( sale, datetime=DateTime.current )
    self.sale = sale
    self.datetime = datetime.in_time_zone
  end

  # bonus so far
  def bonus
    return EffectiveConfig.current_kick_out_until * sale.unit  if kickout?
    bonus_days * daily_bonus
  end

  # how many bounus days for this sale since now,
  def bonus_days
    #TODO exclude no bonus day
    seconds = (self.datetime - sale.buy_at.since( EffectiveConfig.current_pending_days_after_sale.days ))
    seconds -= free_day_count_from_start_to_selected_date*3600*24
    #handle negtive value
    seconds >0 ? (seconds/3600/24).ceil : 0
  end

  def daily_bonus(  )
    return 0 if pending? || kickout?
    EffectiveConfig.current_bonus_per_share * sale.unit
  end

  # total_bonus_days==bonus_days, if kickout.
  def total_bonus_days

  end

  def kickout?
    bonus_days * EffectiveConfig.current_bonus_per_share >= EffectiveConfig.current_kick_out_until
  end

  def pending?
    bonus_days == 0
  end

  def free_day_count_from_start_to_selected_date
    Day.during_dates( sale.buy_at, self.datetime ).count
  end
end
