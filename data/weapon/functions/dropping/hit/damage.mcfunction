#hitした周囲のエンティティにダメージを与える
#撃墜メッセージやダメージエフェクトも出す
#使えるタグ　bomb-move-executer：弾体  bomber:発射母体
#実行者：弾体

#### ダメージ判定 ####
#hpからダメージを引く
execute as @e[tag=!entity-nohit,distance=..16,type=spawner_minecart] store result score @s reg1 run data get entity @s MaxNearbyEntities
execute as @e[tag=!entity-nohit,distance=..16,type=!spawner_minecart,type=!player] store result score @s reg1 run data get entity @s Health
scoreboard players operation #modified-damage reg1 = @s damage
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..1,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..2,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..3,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..4,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..5,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..6,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..7,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..8,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..9,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..10,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..11,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..12,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..13,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..14,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..15,type=!minecraft:player] reg1 -= #modified-damage reg1
scoreboard players operation #modified-damage reg1 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..16,type=!minecraft:player] reg1 -= #modified-damage reg1
execute as @e[tag=!entity-nohit,distance=..16,type=!minecraft:player] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0

#爆弾のplane-id記憶
scoreboard players operation #bomb-id reg1 = @s plane-id
#爆弾の投下主判定
execute as @a if score @s plane-id = #bomb-id reg1 run tag @s add bomb-owner

### mobダメージ処理 ###
#HPが0になったら破壊メッセージ、HP0がいなくて命中がいたら命中メッセージ
execute if entity @e[tag=!entity-nohit,distance=..16,type=!minecraft:player] as @p[tag=bomb-owner] run title @s times 0 20 20
execute if entity @e[tag=!entity-nohit,distance=..16,tag=!enemy-target,type=!minecraft:player] as @p[tag=bomb-owner] run title @s subtitle {"text":"命中","color":"white","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-plane,tag=!enemy-target,type=!minecraft:player] as @p[tag=bomb-owner] run title @s subtitle {"text":"敵機撃墜","color":"gold","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-artillery,tag=!enemy-target,type=!minecraft:player] as @p[tag=bomb-owner] run title @s subtitle {"text":"砲台破壊","color":"gold","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,tag=!enemy-target,type=!minecraft:player] as @p[tag=bomb-owner] run title @s title {"text":""}
#倒したのが敵航空機だった場合撃墜者のスコアをプラス
execute store result score #kill-num reg1 if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=!enemy-target,type=!minecraft:player,tag=enemy-plane]
execute as @p[tag=bomb-owner] run scoreboard players operation @s shootdown += #kill-num reg1
#機体パーツが破壊されたら登場者にtellraw
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=engine] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=engine,limit=1] plane-id run tellraw @s [{"text":"エンジンが破壊されました","color":"dark_red"}]
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=aileron] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=aileron,limit=1] plane-id run tellraw @s [{"text":"主翼が破壊されました","color":"dark_red"}]
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=radder] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=radder,limit=1] plane-id run tellraw @s [{"text":"ラダーが破壊されました","color":"dark_red"}]
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=elevetor] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=elevetor,limit=1] plane-id run tellraw @s [{"text":"エレベータが破壊されました","color":"dark_red"}]
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=body] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=body,limit=1] plane-id run tellraw @s [{"text":"機体が破壊されました","color":"dark_red"}]
#ダメージを受けたのが胴体だった場合プレイヤーにダメージを与える
execute if entity @e[tag=!entity-nohit,distance=..20,tag=body] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,tag=body,limit=1] plane-id run effect give @s minecraft:instant_damage 1 1

#### スポナーダメージ処理 ####
#0になった場合破壊メッセージ,0にならず当たった場合命中メッセージ
execute if entity @e[tag=!entity-nohit,distance=..16,tag=enemy-target] as @p[tag=bomb-owner] run title @s subtitle {"text":"命中","color":"white","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-target] as @p[tag=bomb-owner] run title @s subtitle {"text":"目標破壊","color":"gold","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,tag=enemy-target] as @p[tag=bomb-owner] run title @s title {"text":""}
#スポナー破壊した場合破壊者とグローバル破壊スコアを増やす
execute store result score #destroy-num reg1 if entity @e[tag=!entity-nohit,scores={reg1=0},tag=enemy-target,distance=..16]
scoreboard players operation #destroy-num reg1 *= #5 Num
scoreboard players operation #global shootdown += #destroy-num reg1

#ダメージ処理、破壊されたスポナーをキル
execute as @e[tag=!entity-nohit,distance=..16,type=spawner_minecart] store result entity @s MaxNearbyEntities short 1 run scoreboard players get @s reg1
execute as @e[tag=!entity-nohit,distance=..16,type=!spawner_minecart] store result entity @s Health short 1 run scoreboard players get @s reg1
kill @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-target,type=spawner_minecart]

#### ダメージ時エフェクト ####
#命中地点にパーティクル
execute at @s[tag=50kg] run particle minecraft:explosion ^ ^ ^ 1 1 1 0 100 force
execute at @s[tag=60kg] run particle minecraft:explosion ^ ^ ^ 1 1 1 0 120 force
execute at @s[tag=250kg] run particle minecraft:explosion ^ ^ ^ 3 3 3 0 500 force
execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 16 1.2 0

#タグ除去
tag @a remove bomb-owner
