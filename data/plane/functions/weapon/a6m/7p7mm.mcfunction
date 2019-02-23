#7.7mm機銃を使用 a6m
#実行者：機体

#召喚
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,7p7mm,gun-init,right,gun-nohit,tracer-lightblue,entity-nohit],Duration:200}
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,7p7mm,gun-init,left,gun-nohit,tracer-lightblue,entity-nohit],Invisible:1,Marker:1,Glowing:0}

#スコア付与
scoreboard players set @e[tag=gun-init,distance=..5] age 65
scoreboard players set @e[tag=gun-init,distance=..5] speed 93
scoreboard players set @e[tag=gun-init,distance=..5] damage 7
scoreboard players operation @e[tag=gun-init,distance=..5] plane-id = @s plane-id
scoreboard players set @e[tag=gun-init,tag=left,distance=..5] offsetX 400
scoreboard players set @e[tag=gun-init,tag=left,distance=..5] offsetY -1000
scoreboard players set @e[tag=gun-init,tag=left,distance=..5] offsetZ 0
scoreboard players set @e[tag=gun-init,tag=right,distance=..5] offsetX -400
scoreboard players set @e[tag=gun-init,tag=right,distance=..5] offsetY -1000
scoreboard players set @e[tag=gun-init,tag=right,distance=..5] offsetZ 0

#5発目の弾なら曳光弾化
scoreboard players operation @s reg1 = @s ammunition2
scoreboard players operation @s reg1 %= #5 Num
execute if score @s reg1 matches 0 run tag @e[tag=gun-init,distance=..10] add tracer

#発射位置に移動
execute at @s positioned ~ ~ ~ as @e[tag=gun-init,distance=..5] run function plane:position/calc-offset

#向きを機体方向に向ける
#execute rotated as @s as @e[tag=gun-init,limit=2,distance=..20] positioned as @s run tp @s ~ ~ ~ ~ ~
summon minecraft:area_effect_cloud ^ ^ ^200  {Duration:0,Tags:[gun-indicator,entity-nohit],CustomName:"{\"text\":\"gun-indicator\",\"color\":\"aqua\"}"}
execute as @e[tag=gun-init,limit=2,distance=..20] at @s run tp @s ~ ~ ~ facing entity @e[tag=gun-indicator,distance=..220,limit=1]

#発射したならreload時間設定
#execute if entity @e[tag=gun-init,distance=..20] run scoreboard players set @s w1-reload 1

#音
playsound minecraft:weapon.muchingun.fire master @a ~ ~ ~ 16 1 1

#発射炎
#execute as @e[tag=gun-init,distance=..10] at @s run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0.1 1 force

#終了処理
tag @e[tag=gun-init,distance=..20] remove gun-init
#scoreboard players set @p rightClick 0


