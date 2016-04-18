class DaysController < ApplicationController

  def index
    @selected_datetime = DateTime.current
    @attributes= [:customer_name, :bonus, :daily_bonus]
    @customers = Customer.bonus_stage.paginate(:page => params[:page])
  end
end
