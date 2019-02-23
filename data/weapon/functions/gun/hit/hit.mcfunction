#機銃の命中判定
#なんブロック先で命中するか判定、その値をreg1に入れる
#命中したらダメージを与える
#gun/moveから呼び出される
#実行前提条件：reg1に移動距離の値が入ってる　単位：block/tick　スケール：1倍
#使えるタグ　gun-move-executer：弾体  gunner:発射母体
#実行者：弾体

#衝突判定フラグを0に
scoreboard players set @s reg2 0

#ブロック衝突判定、衝突判定が出たら衝突判定フラグが1に
function weapon:gun/hit/hit-block

#エンティティ衝突判定
#機銃口径に応じて衝突判定幅が変わる
execute at @s[tag=7p7mm] run function weapon:gun/hit/hit-entity-7p7mm
execute at @s[tag=20mm] run function weapon:gun/hit/hit-entity-20mm

#命中エンティティがいたらhitフラグを立てる
execute if entity @e[tag=hit-gun,distance=..20] run scoreboard players set @s reg2 1

#命中エンティティにパーティクル
execute at @e[tag=hit-gun,distance=..20] run particle minecraft:explosion ^ ^ ^ 0.1 0.1 0.1 0 1 force

#ダメージ判定
function weapon:gun/hit/damage
#execute as @e[tag=hit-gun,distance=..20] store result score @s reg1 run data get entity @s Health
#scoreboard players operation @e[tag=hit-gun,distance=..20] reg1 -= @s damage
#execute as @e[tag=hit-gun,distance=..20] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0
#execute as @e[tag=hit-gun,distance=..20,scores={reg1=0},type=!minecraft:spawner_minecart,type=!minecraft:player] run say destroyed
#execute at @s[scores={reg2=1}] if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=!minecraft:spawner_minecart] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run scoreboard players add @s shootdown 1
#execute as @e[tag=hit-gun,distance=..20] store result entity @s Health float 1 run scoreboard players get @s reg1
##execute at @s[tag=hit-executer] run effect give @e[tag=hit-gun,distance=..2] minecraft:instant_damage 1 31
##execute at @s[tag=hit-executer] run kill @e[tag=hit-gun,distance=..2]
#
##スポナー破壊判定
#execute as @e[tag=hit-gun,distance=..20,type=minecraft:spawner_minecart] store result score @s reg1 run data get entity @s MaxNearbyEntities
#scoreboard players operation @e[tag=hit-gun,distance=..20,type=minecraft:spawner_minecart] reg1 -= @s damage
#execute as @e[tag=hit-gun,distance=..20,type=minecraft:spawner_minecart] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0
#execute as @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart] run say destroyed
#execute as @e[tag=hit-gun,distance=..20] store result entity @s MaxNearbyEntities short 1 run scoreboard players get @s reg1
#execute at @s[scores={reg2=1}] if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run scoreboard players add @s shootdown 5
#execute at @s[scores={reg2=1}] if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart] run scoreboard players add #global shootdown 5
#execute store result bossbar minecraft:game-progress value run scoreboard players get #global shootdown
#kill @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart]
#
##プレイヤーダメージ判定
#execute as @e[tag=hit-gun,distance=..20,type=minecraft:player] run effect give @s minecraft:instant_damage 1 1

#hit-gunタグ除去
tag @e[tag=hit-gun] remove hit-gun

