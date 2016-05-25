class CreateDailySettingService
  def call
    DailySetting.create( ename: 0, effect_value: 7, effect_at: DateTime.current)
    DailySetting.create( ename: 1, effect_value: 2890, effect_at: DateTime.current)
    DailySetting.create( ename: 2, effect_value: 5, effect_at: DateTime.current)
  end
end
