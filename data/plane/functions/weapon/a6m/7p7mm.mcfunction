#7.7mm機銃を使用 a6m
#実行者：機体

#召喚
summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,7p7mm,gun-init,right,gun-nohit],Invisible:1,Marker:1,Glowing:0}
summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,7p7mm,gun-init,left,gun-nohit],Invisible:1,Marker:1,Glowing:0}

#スコア付与
scoreboard players set @e[tag=gun-init,distance=..5] age 100
scoreboard players set @e[tag=gun-init,distance=..5] speed 93
scoreboard players set @e[tag=gun-init,distance=..5] damage 7
scoreboard players operation @e[tag=gun-init,distance=..5] plane-id = @s plane-id
scoreboard players set @e[tag=gun-init,tag=left,distance=..5] offsetX 500
scoreboard players set @e[tag=gun-init,tag=left,distance=..5] offsetY -1000
scoreboard players set @e[tag=gun-init,tag=left,distance=..5] offsetZ 0
scoreboard players set @e[tag=gun-init,tag=right,distance=..5] offsetX 100
scoreboard players set @e[tag=gun-init,tag=right,distance=..5] offsetY -1000
scoreboard players set @e[tag=gun-init,tag=right,distance=..5] offsetZ 0

#5発目の弾なら曳光弾化
scoreboard players operation @s reg1 = @s ammunition2
scoreboard players operation @s reg1 %= #5 Num
execute if score @s reg1 matches 4 run tag @e[tag=gun-init,distance=..5] add tracer

#発射位置に移動
execute at @s positioned ~ ~ ~ as @e[tag=gun-init,distance=..5] run function plane:position/calc-offset

#向きを機体方向に向ける
execute rotated as @s as @e[tag=gun-init,limit=1,distance=..20,tag=left] positioned as @s run tp @s ~ ~ ~ ~ ~
execute rotated as @s as @e[tag=gun-init,limit=1,distance=..20,tag=right] positioned as @s run tp @s ~ ~ ~ ~ ~

#発射したならreload時間設定
#execute if entity @e[tag=gun-init,distance=..20] run scoreboard players set @s w1-reload 1

#音
playsound minecraft:weapon.light-muchingun.fire master @a ~ ~ ~ 0.8 0.8 0.8

#発射炎
#execute as @e[tag=gun-init,distance=..10] at @s run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0.1 1 force

#終了処理
tag @e[tag=gun-init,distance=..20] remove gun-init
#scoreboard players set @p rightClick 0


