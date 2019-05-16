#20mm機銃を使用 spitfire
#実行者：機体

#発射位置計算
scoreboard players set @s input2 19
scoreboard players set @s input3 10
scoreboard players set @s input4 30
function math:vector-3input
scoreboard players operation @s plane-w1-posX = @s output2
scoreboard players operation @s plane-w1-posY = @s output3
scoreboard players operation @s plane-w1-posZ = @s output4

scoreboard players set @s input2 -19
scoreboard players set @s input3 10
scoreboard players set @s input4 30
function math:vector-3input
scoreboard players operation @s plane-w2-posX = @s output2
scoreboard players operation @s plane-w2-posY = @s output3
scoreboard players operation @s plane-w2-posZ = @s output4


#召喚
summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,20mm,gun-init,right],Invisible:1,Marker:1}
summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,20mm,gun-init,left],Invisible:1,Marker:1}

#スコア付与
scoreboard players set @e[tag=gun-init,distance=..5] age 200
scoreboard players set @e[tag=gun-init,distance=..5] speed 94
scoreboard players set @e[tag=gun-init,distance=..5] damage 10
scoreboard players operation @e[tag=gun-init,distance=..5] plane-id = @s plane-id


#発射位置に移動
execute as @e[tag=gun-init,distance=..5] store result score @s reg1 run data get entity @s Pos[0] 10000
execute as @e[tag=gun-init,distance=..5] store result score @s reg2 run data get entity @s Pos[1] 10000
execute as @e[tag=gun-init,distance=..5] store result score @s reg3 run data get entity @s Pos[2] 10000

scoreboard players operation @e[tag=gun-init,tag=left,limit=1,distance=..5] reg1 += @s plane-w1-posX
scoreboard players operation @e[tag=gun-init,tag=left,limit=1,distance=..5] reg2 += @s plane-w1-posY
scoreboard players operation @e[tag=gun-init,tag=left,limit=1,distance=..5] reg3 += @s plane-w1-posZ
#tellraw @p [{"score" : {"name":"@e[tag=gun-init,tag=left,limit=1,distance=..5]", "objective":"reg1"}}, {"text":" "}, {"score" : {"name":"@e[tag=gun-init,tag=left,limit=1,distance=..5]", "objective":"reg2"}}, {"text":" "}, {"score" : {"name":"@e[tag=gun-init,tag=left,limit=1,distance=..5]", "objective":"reg3"}}]
execute as @e[tag=gun-init,tag=left,limit=1,distance=..5] store result entity @s Pos[0] double 0.0001 run scoreboard players get @s reg1
execute as @e[tag=gun-init,tag=left,limit=1,distance=..5] store result entity @s Pos[1] double 0.0001 run scoreboard players get @s reg2
execute as @e[tag=gun-init,tag=left,limit=1,distance=..5] store result entity @s Pos[2] double 0.0001 run scoreboard players get @s reg3

scoreboard players operation @e[tag=gun-init,tag=right,limit=1,distance=..5] reg1 += @s plane-w2-posX
scoreboard players operation @e[tag=gun-init,tag=right,limit=1,distance=..5] reg2 += @s plane-w2-posY
scoreboard players operation @e[tag=gun-init,tag=right,limit=1,distance=..5] reg3 += @s plane-w2-posZ
#tellraw @p [{"score" : {"name":"@e[tag=gun-init,tag=right,limit=1,distance=..5]", "objective":"reg1"}}, {"text":" "}, {"score" : {"name":"@e[tag=gun-init,tag=right,limit=1,distance=..5]", "objective":"reg2"}}, {"text":" "}, {"score" : {"name":"@e[tag=gun-init,tag=right,limit=1,distance=..5]", "objective":"reg3"}}]
execute as @e[tag=gun-init,tag=right,limit=1,distance=..5] store result entity @s Pos[0] double 0.0001 run scoreboard players get @s reg1
execute as @e[tag=gun-init,tag=right,limit=1,distance=..5] store result entity @s Pos[1] double 0.0001 run scoreboard players get @s reg2
execute as @e[tag=gun-init,tag=right,limit=1,distance=..5] store result entity @s Pos[2] double 0.0001 run scoreboard players get @s reg3

#向きを機体方向に向ける
execute rotated as @s as @e[tag=gun-init,limit=1,distance=..10,tag=left] positioned as @s run tp @s ~ ~ ~ ~ ~
execute rotated as @s as @e[tag=gun-init,limit=1,distance=..10,tag=right] positioned as @s run tp @s ~ ~ ~ ~ ~

#tellraw @p [{"score" : {"name":"@e[tag=gun-init,tag=right,limit=1,distance=..5]", "objective":"reg1"}}, {"text":" "}, {"score" : {"name":"@e[tag=gun-init,tag=right,limit=1,distance=..5]", "objective":"reg2"}}]


#発射したならreload時間設定
execute if entity @e[tag=gun-init,distance=..20] run scoreboard players set @s w1-reload 2

#音
playsound minecraft:weapon.heavy-muchingun.fire master @a ~ ~ ~ 1 1

#終了処理
tag @e[tag=gun-init,distance=..20] remove gun-init
#scoreboard players set @p rightClick 0


