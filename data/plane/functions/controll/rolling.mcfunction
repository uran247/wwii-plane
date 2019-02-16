#滑走中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている

#選択スロット判定
scoreboard players set @s[scores={plane-key-input=1..}] plane-key-input 0
scoreboard players set @s[nbt={SelectedItemSlot:6}] plane-key-input 7
scoreboard players set @s[nbt={SelectedItemSlot:8}] plane-key-input 9

#engineがいなかったら強制的に速度マイナス
execute if entity @e[tag=controll-target,distance=..3,limit=1,scores={engine=0}] run scoreboard players set @p plane-key-input 7

#スロット8選択でspeed増，6選択で減、速度が0未満になったら0にする
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed < @s max-speed at @s run scoreboard players operation @s speed += @s accelerate
execute if entity @s[scores={plane-key-input=7}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed >= #0 Num at @s run scoreboard players operation @s speed -= @s accelerate
execute if entity @s[scores={plane-key-input=7}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed < #0 Num at @s run scoreboard players set @s speed 0

#ピッチによって加速量調整
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s[scores={AngX=..0}] reg1 = @s deaccelerate
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s[scores={AngX=..0}] reg1 *= @s AngX
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s[scores={AngX=..0}] reg1 /= #9000 Num
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s[scores={AngX=..0}] speed += @s reg1

#speedが1になったらエンジン始動音を鳴らす
execute if score @e[tag=controll-target,tag=!engine-started,distance=..3,limit=1] speed > #1 Num as @e[tag=controll-target,distance=..3,limit=1] run playsound minecraft:plane.engine.recipro-start ambient @a ~ ~ ~ 1 1 1
execute if score @e[tag=controll-target,distance=..3,limit=1] speed > #1 Num run tag @e[tag=controll-target,distance=..3,limit=1] add engine-started
execute if score @e[tag=controll-target,tag=engine-started,distance=..3,limit=1] speed <= #0 Num run tag @e[tag=controll-target,distance=..3,limit=1] remove engine-started

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score @s controll-yaw run data get entity @s Rotation[0] 100
scoreboard players remove @s[scores={controll-yaw=18100..}] controll-yaw 36000
scoreboard players add @s[scores={controll-yaw=..-18100}] controll-yaw 36000
scoreboard players operation @s controll-yaw -= @e[tag=controll-target,distance=..3,limit=1] AngY
scoreboard players remove @s[scores={controll-yaw=18100..}] controll-yaw 36000
scoreboard players add @s[scores={controll-yaw=..-18100}] controll-yaw 36000

#radderがなかったら捜査は無効
execute if entity @e[tag=controll-target,distance=..3,limit=1,scores={radder=0}] run scoreboard players set @p controll-yaw 0

#スロット0選択で左旋回，2で右旋回
execute if entity @s[scores={controll-yaw=-17800..-300}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngX=-9000..9000}] at @s run scoreboard players operation @s AngY -= @s yaw-speed
execute if entity @s[scores={controll-yaw=-17800..-300}] as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngX=-9000..9000}] at @s run scoreboard players operation @s AngY += @s yaw-speed
execute if entity @s[scores={controll-yaw=200..17800}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngX=-9000..9000}] at @s run scoreboard players operation @s AngY += @s yaw-speed
execute if entity @s[scores={controll-yaw=300..17800}] as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngX=-9000..9000}] at @s run scoreboard players operation @s AngY -= @s yaw-speed

#スコアを-180 - 180の範囲に収める
scoreboard players remove @e[tag=controll-target,distance=..3,limit=1,scores={AngY=18100..}] AngY 36000
scoreboard players add @e[tag=controll-target,distance=..3,limit=1,scores={AngY=..-18100}] AngY 36000

#ヨー，ロールを着地時のものに固定
execute as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngX=-9000..9000}] run scoreboard players add @s AngX 18000
execute as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngX=-9000..9000}] run scoreboard players add @s AngZ 18000

#speedがtakeoff-speedを超えたら飛行状態に遷移
execute as @e[tag=controll-target,distance=..3,limit=1] if score @s takeoff-speed < @s speed run function plane:controll/rolling/takeoff

#speedがpropeller-stopだったら停止モデル、propeller-startだったら滑走モデルに切り替え
execute as @e[tag=controll-target,limit=1,distance=..3] if score @s speed >= @s plpr-stop-min if score @s speed <= @s plpr-stop-max store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s parking-udvm
execute as @e[tag=controll-target,limit=1,distance=..3] if score @s speed >= @s plpr-start-min if score @s speed <= @s plpr-start-max store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm

