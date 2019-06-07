#ギアのモデル切り替え
#入力 entity:機体
execute as @s[tag=!stall] if score @s speed >= @s gear-pullout-min if score @s speed <= @s gear-pullout-max store result entity @e[tag=plane-move-parts,tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm
execute as @s if score @s speed >= @s gear-retract-min if score @s speed <= @s gear-retract-max store result entity @e[tag=plane-move-parts,tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm
