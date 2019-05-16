#hitしたエンティティにダメージを与える
#撃墜メッセージやダメージエフェクトも出す
#使えるタグ　gun-move-executer：弾体  gunner:発射母体
#実行者：弾体

#ダメージ後の体力計算
execute as @e[tag=hit-gun,distance=..20,type=spawner_minecart] store result score @s reg1 run data get entity @s MaxNearbyEntities
execute as @e[tag=hit-gun,distance=..20,type=!spawner_minecart,type=!player] store result score @s reg1 run data get entity @s Health
scoreboard players operation @e[tag=hit-gun,distance=..20,type=!player] reg1 -= @s damage
execute as @e[tag=hit-gun,distance=..20,type=!player] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0

#### 破壊処理（mob） ####
#HPが0になったら破壊メッセージ
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-plane,tag=!enemy-target] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s times 0 20 20
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-plane,tag=!enemy-target] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s subtitle {"text":"敵機撃墜","color":"gold","italic":true}
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-plane,tag=!enemy-target] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s title {"text":""}

#倒したのが敵航空機だった場合撃墜者のスコアをプラス
execute if score #hit-flag reg1 matches 1 at @s if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=!enemy-target,tag=enemy-plane] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run scoreboard players add @s shootdown 1

#機体パーツが破壊されたら搭乗者にtellraw
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=engine] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=engine,limit=1] plane-id run tellraw @s [{"text":"エンジンが破壊されました","color":"dark_red"}]
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=aileron] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=aileron,limit=1] plane-id run tellraw @s [{"text":"主翼が破壊されました","color":"dark_red"}]
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=radder] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=radder,limit=1] plane-id run tellraw @s [{"text":"ラダーが破壊されました","color":"dark_red"}]
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=elevetor] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=elevetor,limit=1] plane-id run tellraw @s [{"text":"エレベータが破壊されました","color":"dark_red"}]
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=body] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=body,limit=1] plane-id run tellraw @s [{"text":"機体が破壊されました","color":"dark_red"}]

#ダメージを受けたのが胴体だった場合プレイヤーにダメージを与える
execute if entity @e[tag=hit-gun,distance=..20,tag=body] as @a if score @s plane-id = @e[tag=hit-gun,distance=..20,tag=body,limit=1] plane-id run effect give @s instant_damage 1 1

#スコアをHPに反映
execute as @e[tag=hit-gun,distance=..20] store result entity @s Health float 1 run scoreboard players get @s reg1


#### スポナー破壊処理 ####
#0になった場合破壊メッセージ
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=spawner_minecart] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s times 0 20 20
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=spawner_minecart] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s subtitle {"text":"ターゲット破壊","color":"gold","italic":true}
execute if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},type=spawner_minecart] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run title @s title {"text":""}

#スポナー破壊した場合破壊者とグローバル破壊スコアを増やす
execute at @s if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-target] as @a if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run scoreboard players add @s shootdown 5
execute at @s if entity @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-target] run scoreboard players add #global shootdown 5

#破壊音
execute at @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-target] run playsound minecraft:entity.generic.explode ambient @a ~ ~ ~ 16 0

#破壊されたスポナーをキル
kill @e[tag=hit-gun,distance=..20,scores={reg1=0},tag=enemy-target]

#スコアをMaxNearbyEntitiesに反映
execute as @e[tag=hit-gun,distance=..20,type=spawner_minecart] store result entity @s MaxNearbyEntities float 1 run scoreboard players get @s reg1

#### 飛行機に乗ってないプレイヤーにダメージ判定 ####
execute as @e[tag=hit-gun,tag=!plane-rider,distance=..20,type=player] run effect give @s instant_damage 1 1
