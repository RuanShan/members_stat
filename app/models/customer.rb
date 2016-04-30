class Customer < ActiveRecord::Base
  has_many :sales, dependent: :delete_all

  scope :bonus_stage, ->{
    where( "payback < #{ DailySetting.current_kick_out_until} * hold_shares " )
  }

  def day( datetime = nil )
    datetime ||= DateTime.current
    CustomerDay.new( self, datetime )
  end

  private
end
