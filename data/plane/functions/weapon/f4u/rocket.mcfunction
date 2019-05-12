#ロケットを使用 f4u
#実行者：機体

#自分が持ってるロケットにタグ付け
execute as @e[tag=f4u-rocket] if score @s plane-id = @e[tag=controll-target,distance=..15,limit=1] plane-id run tag @s add launchable

#launchタグを付ける
tag @e[tag=launchable,distance=..15,limit=1] add launch
tag @e[tag=launch,distance=..15,limit=1] add launch-init

#タグを外す
tag @e[tag=launch,distance=..15,limit=1] remove f4u-rocket
tag @e[tag=launch,distance=..15,limit=1] remove f4u
tag @e[tag=launch,distance=..15,limit=1] remove plane-parts
tag @e[tag=launch,distance=..15,limit=1] remove plane

#スコア付与
scoreboard players set @e[tag=launch-init,distance=..15] age 300
scoreboard players set @e[tag=launch-init,distance=..15] speed 20
scoreboard players set @e[tag=launch-init,distance=..15] damage 0
scoreboard players operation @s reg1 = @s speed
scoreboard players operation @s reg1 /= #1000 Num
scoreboard players operation @e[tag=launch-init,distance=..20] speed += @s reg1
scoreboard players operation @e[tag=launch-init,distance=..20] reg1 = #rand rand
scoreboard players operation @e[tag=launch-init,distance=..20] reg1 %= #7 Num


#ちょっと角度変更
execute as @e[tag=launch-init,distance=..20,scores={reg1=6}] at @s run tp @s ~ ~ ~ ~3 ~
execute as @e[tag=launch-init,distance=..20,scores={reg1=5}] at @s run tp @s ~ ~ ~ ~2 ~
execute as @e[tag=launch-init,distance=..20,scores={reg1=4}] at @s run tp @s ~ ~ ~ ~1 ~
execute as @e[tag=launch-init,distance=..20,scores={reg1=3}] at @s run tp @s ~ ~ ~ ~-1 ~
execute as @e[tag=launch-init,distance=..20,scores={reg1=2}] at @s run tp @s ~ ~ ~ ~-2 ~
execute as @e[tag=launch-init,distance=..20,scores={reg1=1}] at @s run tp @s ~ ~ ~ ~-3 ~

#発射したならreload時間設定
#execute if entity @e[tag=launch-init,distance=..20] run scoreboard players set @s w1-reload 1
execute if entity @e[tag=launch-init,distance=..20] run scoreboard players set @s w2-reload 5

#音
#playsound minecraft:weapon.light-muchingun.fire master @a ~ ~ ~ 0.8 0 0.8
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 0

#武器使用スコアを0に
scoreboard players set @p[tag=controller] rightClick 0

#発射炎
#execute as @e[tag=launch-init,distance=..10] at @s run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0.1 1 force

#終了処理
tag @e[tag=launch-init,distance=..20] remove launch-init
tag @e[tag=launchable,distance=..15] remove launchable

#scoreboard players set @p rightClick 0


