class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  #
  def create

    free_date = day_params[:free_date].to_datetime
    #do not use Day.find_or_initialize_by day_params
    #SELECT  "days".* FROM "days" WHERE "days"."free_date" = ? LIMIT 1  [["free_date", "Tue Apr 12 2016 00:00:00 GMT+0800 (CST)"]]


    if Day.exists?( free_date: free_date )
      @day = Day.where( free_date: free_date ).first
      @day.destroy
    else
      @day = Day.new( day_params )
      @day.save
    end
    render json: @day
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    if @day.update( day_params )
      redirect_to @day, notice: "Day was successfully updated."
    else
      render :edit
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_day
    @day = Day.find(class_name, params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def day_params
    params.require(:day).permit( ['free_date'] )
  end

end
