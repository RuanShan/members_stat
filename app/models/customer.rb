class Customer < ActiveRecord::Base
  has_many :sales, dependent: :delete_all

  scope :bonus_stage, ->{
    where( "payback < #{ EffectiveConfig.current_kick_out_until} * hold_shares " )
  }

  def day( datetime = DateTime.current)
    Day.new( self, datetime )
  end

  private
end
