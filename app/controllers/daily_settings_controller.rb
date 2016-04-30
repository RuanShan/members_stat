class DailySettingsController < ApplicationController
  before_action :set_daily_setting, only: [:show, :edit, :update, :destroy]

  # GET /daily_settings
  # GET /daily_settings.json
  def index
    @daily_settings = DailySetting.all
  end

  # GET /daily_settings/1
  # GET /daily_settings/1.json
  def show
  end

  # GET /daily_settings/new
  def new
    @daily_setting = DailySetting.new
  end

  # GET /daily_settings/1/edit
  def edit
  end

  # POST /daily_settings
  # POST /daily_settings.json
  def create
    @daily_setting = DailySetting.new(daily_setting_params)

    respond_to do |format|
      if @daily_setting.save
        format.html { redirect_to @daily_setting, notice: 'Daily setting was successfully created.' }
        format.json { render :show, status: :created, location: @daily_setting }
      else
        format.html { render :new }
        format.json { render json: @daily_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_settings/1
  # PATCH/PUT /daily_settings/1.json
  def update
    respond_to do |format|
      if @daily_setting.update(daily_setting_params)
        format.html { redirect_to @daily_setting, notice: 'Daily setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_setting }
      else
        format.html { render :edit }
        format.json { render json: @daily_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_settings/1
  # DELETE /daily_settings/1.json
  def destroy
    @daily_setting.destroy
    respond_to do |format|
      format.html { redirect_to daily_settings_url, notice: 'Daily setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_setting
      @daily_setting = DailySetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_setting_params
      params.require(:daily_setting).permit(:ename, :effect_value, :effect_at)
    end
end
