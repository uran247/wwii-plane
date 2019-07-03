#7.7mm機銃を使用 a5m
#実行者：機体

#曳光弾判定
scoreboard players operation #tracer reg1 = @s ammunition1
scoreboard players operation #tracer reg1 %= #10 Num

#召喚
execute if score #tracer reg1 matches 0 run summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,7p7mm,gun-init,right,tracer-lightblue,entity-nohit,offset-base,tracer],Duration:50}
execute if score #tracer reg1 matches 0 run summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,7p7mm,gun-init,left,tracer-lightblue,entity-nohit,offset-base,tracer],Duration:50}
execute unless score #tracer reg1 matches 0 run summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,7p7mm,gun-init,right,tracer-lightblue,entity-nohit,offset-base],Duration:50}
execute unless score #tracer reg1 matches 0 run summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,7p7mm,gun-init,left,tracer-lightblue,entity-nohit,offset-base],Duration:50}

#スコア付与
scoreboard players set @e[tag=gun-init,distance=..5] speed 95
scoreboard players set @e[tag=gun-init,distance=..5] damage 3
scoreboard players operation @e[tag=gun-init,distance=..5] plane-id = @s plane-id
scoreboard players set @e[tag=gun-init,tag=left,distance=..5] offsetX 120
scoreboard players set @e[tag=gun-init,tag=left,distance=..5] offsetY -220
scoreboard players set @e[tag=gun-init,tag=left,distance=..5] offsetZ -3120
scoreboard players set @e[tag=gun-init,tag=right,distance=..5] offsetX -188
scoreboard players set @e[tag=gun-init,tag=right,distance=..5] offsetY -220
scoreboard players set @e[tag=gun-init,tag=right,distance=..5] offsetZ -3120

#5発目の弾なら曳光弾化
#scoreboard players operation @s reg1 = @s ammunition1
#scoreboard players operation @s reg1 %= #5 Num
#execute if score @s reg1 matches 0 run tag @e[tag=gun-init,distance=..10] add tracer

#発射位置に移動
execute at @s positioned ~ ~ ~ as @e[tag=gun-init,distance=..5] run function plane:position/calc-offset

#向きを機体方向に向ける
tp 0-0-4-0-0 ^ ^ ^200
execute as @e[tag=gun-init,limit=2,distance=..20] at @s run tp @s ~ ~ ~ facing entity 0-0-4-0-0

#発射したならreload時間設定
#execute if entity @e[tag=gun-init,distance=..20] run scoreboard players set @s w1-reload 1


#音
scoreboard players operation #sound reg1 = @s ammunition1
scoreboard players operation #sound reg1 %= #2 Num
execute if score #sound reg1 matches 0 run playsound minecraft:weapon.gun-7p7m.fire master @a ~ ~ ~ 1 1 1

#発射炎
#execute as @e[tag=gun-init,distance=..10] at @s run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0.1 1 force

#残弾数減算
scoreboard players remove @s ammunition1 1

#エンティティ返却
tp 0-0-4-0-0 0 1 0

#終了処理
tag @e[tag=gun-init,distance=..20] remove gun-init
#scoreboard players set @p rightClick 0