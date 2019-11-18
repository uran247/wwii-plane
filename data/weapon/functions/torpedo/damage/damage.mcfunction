#hitした周囲のエンティティにダメージを与える
#撃墜メッセージやダメージエフェクトも出す
#使えるタグ　torpedo-move-executer：弾体  torpedoer:発射母体
#実行者：弾体

#爆弾のplane-id記憶
scoreboard players operation #torpedo-id reg1 = @s plane-id
#爆弾の投下主判定
execute as @a if score @s plane-id = #torpedo-id reg1 run tag @s add torpedo-owner

#### ダメージ判定 ####
#hpからダメージを引く]
execute as @e[tag=!entity-nohit,distance=..16] run function weapon:util/set-entity-hp
scoreboard players operation #damage reg1 = @s damage
execute as @e[tag=base,distance=..50] run function weapon:torpedo/damage/base-damage
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..1] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..2] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..3] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..4] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..5] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..6] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..7] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..8] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..9] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..10] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..11] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..12] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..13] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..14] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..15] reg1 -= #damage reg1
scoreboard players operation #damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..16] reg1 -= #damage reg1
execute as @e[tag=!entity-nohit,distance=..16,scores={reg1=..-1}] run scoreboard players set @s reg1 0

### メッセージ処理 ###
#メッセージを表示(title)
title @p[tag=torpedo-owner] times 0 20 20
execute as @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=!enemy-target,sort=nearest,limit=1] run function weapon:torpedo/damage/set-kill-mob-message
execute as @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-target,sort=nearest,limit=1] run function weapon:torpedo/damage/set-kill-target-message
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0}] run title @p[tag=torpedo-owner] title {"text":""}
#メッセージを表示(tellraw)
execute if entity @e[tag=!entity-nohit,distance=..16] run function weapon:torpedo/damage/hit-message
execute as @e[tag=plane-hitbox,distance=..16,scores={reg1=0}] run function weapon:util/destroy-hitbox-message

#撃墜者/クリアスコアをプラス
execute as @p[tag=torpedo-owner] run function weapon:torpedo/damage/set-shotdown-score

#ダメージ処理、破壊されたスポナーをキル
execute as @e[tag=!entity-nohit,distance=..16,type=spawner_minecart] store result entity @s MaxNearbyEntities short 1 run scoreboard players get @s reg1
execute as @e[tag=!entity-nohit,distance=..16,type=!spawner_minecart,type=!player] store result entity @s Health short 1 run scoreboard players get @s reg1
execute as @a[tag=!entity-nohit,distance=..16] run scoreboard players operation @s taken-damage -= @s reg1
execute as @a[tag=!entity-nohit,distance=..16] run function weapon:util/damage


kill @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-target,type=spawner_minecart]

#### ダメージ時エフェクト ####
#命中地点にパーティクル
#execute at @s[tag=sailing] run particle minecraft:explosion ^ ^ ^ 3 3 3 0 500 force
execute at @s[tag=sailing] run particle minecraft:block minecraft:water ^ ^9 ^-5 3 8 3 1 50000 force
execute at @s[tag=!sailing] run particle minecraft:explosion ^ ^ ^ 3 3 3 0 500 force
execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 10 0 0
execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 10 0.5 0

#タグ除去
tag @a remove torpedo-owner
