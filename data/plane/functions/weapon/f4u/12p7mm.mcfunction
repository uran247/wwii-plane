#12.7mm機銃を使用 f4u
#実行者：機体

#召喚
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,12p7mm,gun-init,right1,gun-nohit,tracer-lightblue],Duration:200}
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,12p7mm,gun-init,left1,gun-nohit,tracer-lightblue],Duration:200}
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,12p7mm,gun-init,right2,gun-nohit,tracer-lightblue],Duration:200}
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,12p7mm,gun-init,left2,gun-nohit,tracer-lightblue],Duration:200}
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,12p7mm,gun-init,right3,gun-nohit,tracer-lightblue],Duration:200}
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,12p7mm,gun-init,left3,gun-nohit,tracer-lightblue],Duration:200}

#スコア付与
scoreboard players set @e[tag=gun-init,distance=..5] age 60
scoreboard players set @e[tag=gun-init,distance=..5] speed 111
scoreboard players set @e[tag=gun-init,distance=..5] damage 13
scoreboard players operation @e[tag=gun-init,distance=..5] plane-id = @s plane-id
scoreboard players set @e[tag=gun-init,tag=left1,distance=..5] offsetX 3000
scoreboard players set @e[tag=gun-init,tag=left1,distance=..5] offsetY -870
scoreboard players set @e[tag=gun-init,tag=left1,distance=..5] offsetZ 0
scoreboard players set @e[tag=gun-init,tag=right1,distance=..5] offsetX -2300
scoreboard players set @e[tag=gun-init,tag=right1,distance=..5] offsetY -870
scoreboard players set @e[tag=gun-init,tag=right1,distance=..5] offsetZ 0
scoreboard players set @e[tag=gun-init,tag=left2,distance=..5] offsetX 3200
scoreboard players set @e[tag=gun-init,tag=left2,distance=..5] offsetY -920
scoreboard players set @e[tag=gun-init,tag=left2,distance=..5] offsetZ 0
scoreboard players set @e[tag=gun-init,tag=right2,distance=..5] offsetX -2500
scoreboard players set @e[tag=gun-init,tag=right2,distance=..5] offsetY -920
scoreboard players set @e[tag=gun-init,tag=right2,distance=..5] offsetZ 0
scoreboard players set @e[tag=gun-init,tag=left3,distance=..5] offsetX 3400
scoreboard players set @e[tag=gun-init,tag=left3,distance=..5] offsetY -970
scoreboard players set @e[tag=gun-init,tag=left3,distance=..5] offsetZ 0
scoreboard players set @e[tag=gun-init,tag=right3,distance=..5] offsetX -2700
scoreboard players set @e[tag=gun-init,tag=right3,distance=..5] offsetY -970
scoreboard players set @e[tag=gun-init,tag=right3,distance=..5] offsetZ 0

#5発目の弾なら曳光弾化
scoreboard players operation @s reg1 = @s ammunition1
scoreboard players operation @s reg1 %= #20 Num
execute if score @s reg1 matches 19 run tag @e[tag=gun-init,distance=..5] add tracer

#発射位置に移動
execute at @s positioned ~ ~ ~ as @e[tag=gun-init,distance=..5] run function plane:position/calc-offset

#向きを機体方向に向けて翼の辺りまで移動してちょっと角度変更
#execute rotated as @s as @e[tag=gun-init,limit=1,distance=..20,tag=left] positioned as @s run tp @s ~ ~ ~ ~ ~
#execute rotated as @s as @e[tag=gun-init,limit=1,distance=..20,tag=right] positioned as @s run tp @s ~ ~ ~ ~ ~
execute rotated as @s as @e[tag=gun-init,distance=..20] positioned as @s run tp @s ~ ~ ~ ~ ~
execute as @e[tag=gun-init,distance=..20] at @s run tp @s ^ ^ ^7
execute rotated as @s as @e[tag=gun-init,distance=..20,tag=left1] positioned as @s run tp @s ~ ~ ~ ~0.5 ~
execute rotated as @s as @e[tag=gun-init,distance=..20,tag=left3] positioned as @s run tp @s ~ ~ ~ ~-0.5 ~
execute rotated as @s as @e[tag=gun-init,distance=..20,tag=right1] positioned as @s run tp @s ~ ~ ~ ~-0.5 ~
execute rotated as @s as @e[tag=gun-init,distance=..20,tag=right3] positioned as @s run tp @s ~ ~ ~ ~0.5 ~

#発射したならreload時間設定
#execute if entity @e[tag=gun-init,distance=..20] run scoreboard players set @s w1-reload 1

#音
playsound minecraft:weapon.light-muchingun.fire master @a ~ ~ ~ 0.8 0 0.8

#発射炎
#execute as @e[tag=gun-init,distance=..10] at @s run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0.1 1 force

#終了処理
tag @e[tag=gun-init,distance=..20] remove gun-init
#scoreboard players set @p rightClick 0


