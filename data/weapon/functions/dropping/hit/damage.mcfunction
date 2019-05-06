#hitした周囲のエンティティにダメージを与える
#撃墜メッセージやダメージエフェクトも出す
#使えるタグ　bomb-move-executer：弾体  bomber:発射母体
#実行者：弾体


#### ダメージ判定（mob） ####
#hpからダメージを引く
execute as @e[tag=!entity-nohit,distance=..16,tag=!enemy-target,type=!minecraft:player] store result score @s reg1 run data get entity @s Health
scoreboard players operation @s reg3 = @s damage
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..1,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..2,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..3,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..4,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..5,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..6,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..7,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..8,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..9,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..10,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..11,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..12,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..13,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..14,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..15,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..16,tag=!enemy-target,type=!minecraft:player] reg1 -= @s reg3
execute as @e[tag=!entity-nohit,distance=..16,tag=!enemy-target,type=!minecraft:player] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0

#HPが0になったら破壊メッセージ、HP0がいなくて命中がいたら命中メッセージ
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=!enemy-target,type=!minecraft:player] as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run title @s times 0 20 20
execute if entity @e[tag=!entity-nohit,distance=..16,tag=!enemy-target,type=!minecraft:player] as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run title @s subtitle {"text":"命中","color":"white","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-plane,tag=!enemy-target,type=!minecraft:player] as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run title @s subtitle {"text":"敵機撃墜","color":"gold","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-artillery,tag=!enemy-target,type=!minecraft:player] as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run title @s subtitle {"text":"砲台破壊","color":"gold","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,tag=!enemy-target,type=!minecraft:player] as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run title @s title {"text":""}
#倒したのが敵航空機だった場合撃墜者のスコアをプラス
execute as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id store result score @s reg4 if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=!enemy-target,type=!minecraft:player,tag=enemy-plane]
execute as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run scoreboard players operation @s shootdown += @s reg4
#機体パーツが破壊されたら登場者にtellraw
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=engine] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=engine,limit=1] plane-id run tellraw @s [{"text":"エンジンが破壊されました","color":"dark_red"}]
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=aileron] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=aileron,limit=1] plane-id run tellraw @s [{"text":"主翼が破壊されました","color":"dark_red"}]
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=radder] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=radder,limit=1] plane-id run tellraw @s [{"text":"ラダーが破壊されました","color":"dark_red"}]
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=elevetor] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=elevetor,limit=1] plane-id run tellraw @s [{"text":"エレベータが破壊されました","color":"dark_red"}]
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=body] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=body,limit=1] plane-id run tellraw @s [{"text":"機体が破壊されました","color":"dark_red"}]
#ダメージを受けたのが胴体だった場合プレイヤーにダメージを与える
execute if entity @e[tag=!entity-nohit,distance=..20,tag=body] as @a if score @s plane-id = @e[tag=!entity-nohit,distance=..16,tag=body,limit=1] plane-id run effect give @s minecraft:instant_damage 1 1
#スコアをHPに反映
execute as @e[tag=!entity-nohit,distance=..16] store result entity @s Health float 1 run scoreboard players get @s reg1
 


#### スポナー破壊判定 ####
#MaxNearbyEntities取得
execute as @e[tag=!entity-nohit,distance=..20,type=minecraft:spawner_minecart] store result score @s reg1 run data get entity @s MaxNearbyEntities
#ダメージ分MaxNearbyEntitiesを引く
scoreboard players operation @s reg3 = @s damage
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..1,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..2,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..3,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..4,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..5,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..6,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..7,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..8,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..9,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..10,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..11,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..12,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..13,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..14,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..15,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
scoreboard players operation @s reg3 /= #2 Num
scoreboard players operation @e[tag=!entity-nohit,distance=..16,tag=enemy-target,type=!minecraft:player] reg1 -= @s reg3
execute as @e[tag=!entity-nohit,distance=..16,tag=enemy-target] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0
execute as @e[tag=!entity-nohit,distance=..16] store result entity @s MaxNearbyEntities short 1 run scoreboard players get @s reg1
#0になった場合破壊メッセージ,0にならず当たった場合命中メッセージ
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-target,type=!minecraft:player] as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run title @s times 0 20 20
execute if entity @e[tag=!entity-nohit,distance=..16,tag=enemy-target,type=!minecraft:player] as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run title @s subtitle {"text":"命中","color":"white","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=0},tag=enemy-target,type=!minecraft:player] as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run title @s subtitle {"text":"目標破壊","color":"gold","italic":true}
execute if entity @e[tag=!entity-nohit,distance=..16,tag=enemy-target,type=!minecraft:player] as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run title @s title {"text":""}
#スポナー破壊した場合破壊者とグローバル破壊スコアを増やす
execute as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id store result score @s reg4 if entity @e[tag=!entity-nohit,distance=..20,scores={reg1=0},tag=enemy-target] 
execute as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run scoreboard players operation @s reg4 *= #5 Num
execute as @a if score @s plane-id = @e[tag=bomb-move-executer,limit=1] plane-id run scoreboard players operation #global shootdown += @s reg4
#破壊されたスポナーをキル
kill @e[tag=!entity-nohit,distance=..20,scores={reg1=0},tag=enemy-target]


#### ダメージ時エフェクト ####
#命中地点にパーティクル
execute at @s[tag=60kg] run particle minecraft:explosion ^ ^ ^ 4 4 4 0 300 force
execute at @s[tag=250kg] run particle minecraft:explosion ^ ^ ^ 5 5 5 0 1250 force
execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 16 1.2 0

