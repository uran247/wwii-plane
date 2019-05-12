#エンジン始動音を鳴らす
#入力 entity:機体エンティティ
#帰り 無し
execute if score @s[tag=!engine-started] speed > #1 Num run playsound minecraft:plane.engine.recipro-start ambient @a ~ ~ ~ 1 1 1
execute if score @s speed > #1 Num run tag @s add engine-started
execute if score @s[tag=engine-started] speed <= #0 Num run tag @s remove engine-started
