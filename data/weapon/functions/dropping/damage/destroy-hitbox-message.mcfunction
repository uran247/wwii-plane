#入力：entity [tag=plane-hitbox,scores={reg1=0}]
#処理：パーツが破壊されたことを持ち主に表示
#戻り：
scoreboard players operation #parts-id reg1 = @s plane-id
execute if entity @s[tag=engine] as @a if score @s plane-id = #parts-id reg1 run tellraw @s [{"text":"エンジンが破壊されました","color":"dark_red"}]
execute if entity @s[tag=aileron] as @a if score @s plane-id = #parts-id reg1 run tellraw @s [{"text":"主翼が破壊されました","color":"dark_red"}]
execute if entity @s[tag=radder] as @a if score @s plane-id = #parts-id reg1 run tellraw @s [{"text":"ラダーが破壊されました","color":"dark_red"}]
execute if entity @s[tag=elevetor] as @a if score @s plane-id = #parts-id reg1 run tellraw @s [{"text":"エレベータが破壊されました","color":"dark_red"}]
execute if entity @s[tag=body] as @a if score @s plane-id = #parts-id reg1 run tellraw @s [{"text":"機体が破壊されました","color":"dark_red"}]
