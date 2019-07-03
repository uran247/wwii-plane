#hitした周囲のエンティティにダメージを与える
#撃墜メッセージやダメージエフェクトも出す
#使えるタグ　aagun-move-executer：弾体  aaguner:発射母体
#実行者：砲弾


#### ダメージ判定 ####
#hp取得
execute as @e[tag=!entity-nohit,distance=..3,type=!minecraft:spawner_minecart,type=!minecraft:player] store result score @s reg1 run data get entity @s Health
execute as @e[tag=!entity-nohit,distance=..3,type=minecraft:spawner_minecart] store result score @s reg1 run data get entity @s MaxNearbyEntities

#hpからダメージを引く
scoreboard players operation @e[distance=..3,type=!minecraft:player] reg1 -= @s damage
execute as @e[distance=..3,type=!minecraft:player] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0


#### 射手取得 ####
#砲弾のplane-id取得
scoreboard players operation #bullet-id reg1 = @s plane-id

#射手判定
execute as @a if score @s plane-id = #bullet-id reg1 run tag @s add bullet-owner


#### 破壊メッセージ ####
#HPが0になったら破壊メッセージ
execute if entity @e[tag=!entity-nohit,distance=..3,scores={reg1=0},tag=enemy-plane,tag=!enemy-target,type=!minecraft:player] run title @p[tag=bullet-owner] times 0 20 20
execute as @e[tag=!entity-nohit,distance=..3,scores={reg1=0},tag=!enemy-target,sort=nearest,limit=1] run function weapon:aagun/damage/set-kill-mob-message
execute as @e[tag=!entity-nohit,distance=..3,scores={reg1=0},tag=!enemy-target,sort=nearest,limit=1] run function weapon:aagun/damage/set-kill-target-message
execute if entity @e[tag=!entity-nohit,distance=..3,scores={reg1=0},tag=enemy-plane,tag=!enemy-target,type=!minecraft:player] run title @p[tag=bullet-owner] title {"text":""}

#機体パーツが破壊されたら登場者にtellraw
execute as @e[tag=plane-hitbox,distance=..3,scores={reg1=0}] run function weapon:util/destroy-hitbox-message


#### ダメージ処理 ####
#撃墜者/クリアスコアをプラス
execute as @p[tag=bullet-owner] run function weapon:aagun/damage/set-shotdown-score

#スコアをHPに反映
execute as @e[tag=!entity-nohit,distance=..3,type=!minecraft:spawner_minecart,type=!minecraft:player] store result entity @s Health float 1 run scoreboard players get @s reg1
execute as @e[tag=!entity-nohit,distance=..3,type=minecraft:spawner_minecart] store result entity @s MaxNearbyEntities short 1 run scoreboard players get @s reg1

#破壊されたスポナーをキル
kill @e[tag=!entity-nohit,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart]


#### ダメージ時エフェクト ####
#命中地点にパーティクル
execute at @s[tag=88mm] run particle minecraft:large_smoke ^ ^ ^ 1.3 2 1.3 0 1000 force
execute at @s[tag=250kg] run particle minecraft:explosion ^ ^ ^ 2.5 2.5 2.5 0 125 force
execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 1.2 0


#タグ除去
tag @a remove bullet-owner
