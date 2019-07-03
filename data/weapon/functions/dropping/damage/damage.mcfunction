#hitした周囲のエンティティにダメージを与える
#撃墜メッセージやダメージエフェクトも出す
#使えるタグ　bomb-move-executer：弾体  bomber:発射母体
#実行者：弾体

#爆弾のplane-id記憶
scoreboard players operation #bomb-id reg1 = @s plane-id
#爆弾の投下主判定
execute as @a if score @s plane-id = #bomb-id reg1 run tag @s add bomb-owner

#### ダメージ判定 ####
#hpからダメージを引く]
execute as @e[tag=!entity-nohit,distance=..16] run function weapon:util/set-entity-hp
scoreboard players operation #damage reg1 = @s damage
execute as @e[tag=enemy-base,distance=..50] run function weapon:dropping/damage/base-damage
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..1,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..2,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..3,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..4,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..5,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..6,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..7,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..8,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..9,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..10,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..11,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..12,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..13,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..14,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..15,type=!minecraft:player] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..16,type=!minecraft:player] reg1 -= #damage reg1
execute as @e[tag=!entity-nohit,distance=..16,type=!minecraft:player] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0

### メッセージ処理 ###
#メッセージを表示(title)
title @p[tag=bomb-owner] times 0 20 20
execute as @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=!enemy-target,sort=nearest,limit=1] run function weapon:dropping/damage/set-kill-mob-message
execute as @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-target,sort=nearest,limit=1] run function weapon:dropping/damage/set-kill-target-message
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0}] run title @p[tag=bomb-owner] title {"text":""}
#メッセージを表示(tellraw)
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=1}] run function weapon:dropping/damage/hit-message
execute as @e[tag=plane-hitbox,distance=..16,scores={reg1=0}] run function weapon:util/destroy-hitbox-message

#撃墜者/クリアスコアをプラス
execute as @p[tag=bomb-owner] run function weapon:dropping/damage/set-shotdown-score

#ダメージ処理、破壊されたスポナーをキル
execute as @e[tag=!entity-nohit,distance=..16,type=spawner_minecart] store result entity @s MaxNearbyEntities short 1 run scoreboard players get @s reg1
execute as @e[tag=!entity-nohit,distance=..16,type=!spawner_minecart] store result entity @s Health short 1 run scoreboard players get @s reg1
kill @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-target,type=spawner_minecart]

#### ダメージ時エフェクト ####
#命中地点にパーティクル
execute at @s[tag=50kg] run particle minecraft:explosion ^ ^ ^ 1 1 1 0 100 force
execute at @s[tag=60kg] run particle minecraft:explosion ^ ^ ^ 1 1 1 0 120 force
execute at @s[tag=250kg] run particle minecraft:explosion ^ ^ ^ 3 3 3 0 500 force
execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 1.2 0

#タグ除去
tag @a remove bomb-owner
