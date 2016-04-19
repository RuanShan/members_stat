FactoryGirl.define do
  factory :effective_config_bonus_per_share, class: EffectiveConfig do
    ename 0 #bonus_per_share
    effect_value 7.7
    effect_at "2015-014-01"
  end

  factory :effective_config_kick_out_until, class: EffectiveConfig do
    ename 1 #kick_out_until
    effect_value 1900
    effect_at "2015-014-01"
  end

end
