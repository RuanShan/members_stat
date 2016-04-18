
#enum ename: { bonus_per_share: 0, kick_out_until: 1, pending_days_after_sale: 2 }

EffectiveConfig.create( ename: 0, effect_value: '11', effect_at: DateTime.current )
EffectiveConfig.create( ename: 1, effect_value: '2890',effect_at: DateTime.current )
EffectiveConfig.create( ename: 2, effect_value: '5',effect_at: DateTime.current )
