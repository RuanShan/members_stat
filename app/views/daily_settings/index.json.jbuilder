json.array!(@daily_settings) do |daily_setting|
  json.extract! daily_setting, :id, :ename, :effect_value, :effect_at
  json.url daily_setting_url(daily_setting, format: :json)
end
