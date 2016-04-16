class DaysController < ApplicationController

  def index
    @attributes= [:customer_name, :customer_created_at]
    @customers = Customer.bonus.paginate(:page => params[:page])
  end
end
