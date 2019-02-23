#hitしたエンティティにダメージを与える
#撃墜メッセージやダメージエフェクトも出す
#使えるタグ　gun-move-executer：弾体  gunner:発射母体
#実行者：弾体

#### ダメージ判定（mob） ####
#hpからダメージを引く
execute as @e[tag=hit-gun,distance=..20,type=!minecraft:spawner_minecart,type=!minecraft:player] store result score @s reg1 run data get entity @s Health
scoreboard players operation @e[tag=hit-gun,distance=..20,type=!minecraft:spawner_minecart,type=!minecraft:player] reg1 -= @s damage
execute as @e[tag=hit-gun,distance=..20,type=!minecraft:spawner_minecart,type=!minecraft:player] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0

#HPが0になったら破壊メッセージ
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-plane,type=!minecraft:spawner_minecart,type=!minecraft:player] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s times 0 20 20
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-plane,type=!minecraft:spawner_minecart,type=!minecraft:player] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s subtitle {"text":"敵機撃墜","color":"gold","italic":true}
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-plane,type=!minecraft:spawner_minecart,type=!minecraft:player] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s title {"text":""}

#倒したのが敵航空機だった場合撃墜者のスコアをプラス
execute at @s[scores={reg2=1}] if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=!minecraft:spawner_minecart,type=!minecraft:player,tag=enemy-plane] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run scoreboard players add @s shootdown 1

#機体パーツが破壊されたら登場者にtellraw
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=engine] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=engine,limit=1] plane-id run tellraw @s [{"text":"エンジンが破壊されました","color":"dark_red"}]
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=aileron] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=aileron,limit=1] plane-id run tellraw @s [{"text":"主翼が破壊されました","color":"dark_red"}]
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=radder] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=radder,limit=1] plane-id run tellraw @s [{"text":"ラダーが破壊されました","color":"dark_red"}]
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=elevetor] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=elevetor,limit=1] plane-id run tellraw @s [{"text":"エレベータが破壊されました","color":"dark_red"}]
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=body] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=body,limit=1] plane-id run tellraw @s [{"text":"機体が破壊されました","color":"dark_red"}]

#スコアをHPに反映
execute as @e[tag=hit-gun,distance=..20] store result entity @s Health float 1 run scoreboard players get @s reg1


#### スポナー破壊判定 ####
#MaxNearbyEntities取得
execute as @e[tag=hit-gun,distance=..20,type=minecraft:spawner_minecart] store result score @s reg1 run data get entity @s MaxNearbyEntities

#ダメージ分MaxNearbyEntitiesを引く
scoreboard players operation @e[tag=hit-gun,distance=..20,type=minecraft:spawner_minecart] reg1 -= @s damage
execute as @e[tag=hit-gun,distance=..20,type=minecraft:spawner_minecart] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0
execute as @e[tag=hit-gun,distance=..20] store result entity @s MaxNearbyEntities short 1 run scoreboard players get @s reg1

#0になった場合破壊メッセージ
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s times 0 20 20
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s subtitle {"text":"スポナー破壊","color":"gold","italic":true}
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s title {"text":""}

#スポナー破壊した場合破壊者とグローバル破壊スコアを増やす
execute at @s[scores={reg2=1}] if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run scoreboard players add @s shootdown 5
execute at @s[scores={reg2=1}] if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart] run scoreboard players add #global shootdown 5

#破壊されたスポナーをキル
kill @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart]


#### プレイヤーダメージ判定 ####
execute as @e[tag=hit-gun,distance=..20,type=minecraft:player] run effect give @s minecraft:instant_damage 1 1
