#plane:controll/rolling経由で実行　実行者/座標はplane-root
#実行者の現在座標取得
execute store result score @s reg1 run data get entity @s Pos[0] 100
execute store result score @s reg2 run data get entity @s Pos[1] 100
execute store result score @s reg3 run data get entity @s Pos[2] 100

#向いてる方向にAEC召喚
summon area_effect_cloud ^ ^ ^1 {Particle:"ambient_entity_effect",Duration:1,Tags:[move-indicator1,entity-nohit],CustomName:"{\"text\":\"ind1\",\"color\":\"aqua\"}"}
summon area_effect_cloud ^1 ^ ^ {Particle:"ambient_entity_effect",Duration:1,Tags:[move-indicator2,entity-nohit],CustomName:"{\"text\":\"ind2\",\"color\":\"aqua\"}"}

#AECの現在座標取得
execute store result score @s travelX run data get entity @e[tag=move-indicator1,limit=1,distance=..1.5] Pos[0] 100
execute store result score @s travelY run data get entity @e[tag=move-indicator1,limit=1,distance=..1.5] Pos[1] 100
execute store result score @s travelZ run data get entity @e[tag=move-indicator1,limit=1,distance=..1.5] Pos[2] 100
execute store result score @s reg4 run data get entity @e[tag=move-indicator2,limit=1,distance=..1.5] Pos[0] 100
execute store result score @s reg5 run data get entity @e[tag=move-indicator2,limit=1,distance=..1.5] Pos[1] 100
execute store result score @s reg6 run data get entity @e[tag=move-indicator2,limit=1,distance=..1.5] Pos[2] 100

#単位ベクトル算出
scoreboard players operation @s travelX -= @s reg1
scoreboard players operation @s travelY -= @s reg2
scoreboard players operation @s travelZ -= @s reg3
scoreboard players operation @s reg4 -= @s reg1
scoreboard players operation @s reg5 -= @s reg2
scoreboard players operation @s reg6 -= @s reg3

#移動量を出す
scoreboard players operation @s speedX = @s travelX
scoreboard players operation @s speedY = @s travelY
scoreboard players operation @s speedZ = @s travelZ

