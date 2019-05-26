#7.7mm前部機銃を使用 ki21
#実行者：機体

#召喚
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,7p7mm,gun-init,tracer-lightblue,entity-nohit,offset-base],Duration:25}

#スコア付与
scoreboard players set @e[tag=gun-init,distance=..5] speed 95
scoreboard players set @e[tag=gun-init,distance=..5] damage 2
scoreboard players operation @e[tag=gun-init,distance=..5] plane-id = @s plane-id
scoreboard players set @e[tag=gun-init,distance=..5] offsetX 0
scoreboard players set @e[tag=gun-init,distance=..5] offsetY 600
scoreboard players set @e[tag=gun-init,distance=..5] offsetZ 0

#5発目の弾なら曳光弾化
scoreboard players operation @s reg1 = @s ammunition2
scoreboard players operation @s reg1 %= #5 Num
execute if score @s reg1 matches 0 run tag @e[tag=gun-init,distance=..10] add tracer

#発射位置に移動
execute at @s positioned ~ ~ ~ as @e[tag=gun-init,distance=..5] run function plane:position/calc-offset
execute rotated as @s as @e[tag=gun-init,distance=..20] positioned as @s run tp @s ^ ^ ^10
execute at @e[tag=gun-init,distance=..20] run particle minecraft:dust 1 0 0 0.2 ~ ~ ~ 0 0 0 1 30 force

#向きをターゲット方向に向ける
summon minecraft:area_effect_cloud ^ ^ ^200  {Duration:0,Tags:[gun-indicator,entity-nohit],CustomName:"{\"text\":\"gun-indicator\",\"color\":\"aqua\"}"}
execute as @e[tag=gun-init,limit=2,distance=..20] at @s run tp @s ~ ~ ~ facing entity @e[tag=rear-gun-target,distance=..32,limit=1]


####ランダムに角度変更####
###Y軸###
#現在の角度取得(3600 - -3600)
execute as @e[tag=gun-init,distance=..20] store result score #angle-Y reg1 run data get entity @s Rotation[0] 10
#-50 - 50の乱数生成
execute as @e[tag=gun-init,distance=..20] run scoreboard players operation #random reg1 += #rand rand
execute as @e[tag=gun-init,distance=..20] run scoreboard players operation #random reg1 %= #300 Num
execute as @e[tag=gun-init,distance=..20] run scoreboard players remove #random reg1 150

#元々の角度に乱数を足す
execute as @e[tag=gun-init,distance=..20] run scoreboard players operation #angle-Y reg1 += #random reg1
#-3600 - 3600に補正
execute as @e[tag=gun-init,distance=..20,scores={reg1=..-3600}] run scoreboard players add #angle-Y reg1 3600
execute as @e[tag=gun-init,distance=..20,scores={reg1=3600..}] run scoreboard players remove #angle-Y reg1 3600
#代入
execute as @e[tag=gun-init,distance=..20] store result entity @s Rotation[0] float 0.1 run scoreboard players get #angle-Y reg1

###X軸###
#乱数再生性
function math:rand
#現在の角度取得(3600 - -3600)
execute as @e[tag=gun-init,distance=..20] store result score #angle-X reg1 run data get entity @s Rotation[1] 10
#-100 - 100の乱数生成
execute as @e[tag=gun-init,distance=..20] run scoreboard players operation #random reg1 += #rand rand
execute as @e[tag=gun-init,distance=..20] run scoreboard players operation #random reg1 %= #300 Num
execute as @e[tag=gun-init,distance=..20] run scoreboard players remove #random reg1 150

#元々の角度に乱数を足す
execute as @e[tag=gun-init,distance=..20] run scoreboard players operation #angle-X reg1 += #random reg1
#-3600 - 3600に補正
execute as @e[tag=gun-init,distance=..20,scores={reg1=..-3600}] run scoreboard players add #angle-X reg1 3600
execute as @e[tag=gun-init,distance=..20,scores={reg1=3600..}] run scoreboard players remove #angle-X reg1 3600
#代入
execute as @e[tag=gun-init,distance=..20] store result entity @s Rotation[1] float 0.1 run scoreboard players get #angle-X reg1


#発射したならreload時間設定
#execute if entity @e[tag=gun-init,distance=..20] run scoreboard players set @s w1-reload 1

#音
playsound minecraft:weapon.muchingun.fire master @a ~ ~ ~ 16 1 1

#残弾数減算
scoreboard players remove @s ammunition2 1

#終了処理
tag @e[tag=gun-init,distance=..20] remove gun-init
tag @e[tag=rear-gun-target,distance=..40] remove rear-gun-target
#scoreboard players set @p rightClick 0

