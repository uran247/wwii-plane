#飛行中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている
#ふぃくしょん方式

#選択スロット判定
scoreboard players set @s[scores={plane-key-input=1..}] plane-key-input 0
#scoreboard players set @s[nbt={SelectedItemSlot:0}] plane-key-input 1
scoreboard players set @s[nbt={SelectedItemSlot:1}] plane-key-input 2
#scoreboard players set @s[nbt={SelectedItemSlot:2}] plane-key-input 3
scoreboard players set @s[nbt={SelectedItemSlot:3}] plane-key-input 4
scoreboard players set @s[nbt={SelectedItemSlot:5}] plane-key-input 6
scoreboard players set @s[nbt={SelectedItemSlot:6}] plane-key-input 7
scoreboard players set @s[nbt={SelectedItemSlot:7}] plane-key-input 8
scoreboard players set @s[nbt={SelectedItemSlot:8}] plane-key-input 9

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score @s reg1 run data get entity @s Rotation[0] 100
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
scoreboard players operation @s reg1 -= @e[tag=controll-target,distance=..3,limit=1] AngY
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
scoreboard players operation @s reg1 *= #-1 Num
#tellraw @a [{"text":"reg1:"},{"score":{"name":"@s","objective":"reg1"}},{"text":"AngY:"},{"score":{"name":"@e[tag=controll-target,distance=..3,limit=1]","objective":"AngY"}},{"text":"roll-speed:"},{"score":{"name":"@s","objective":"roll-speed"}}]

#プレイヤーが上を向いているか下を向いているか取得(0未満なら上、0以上なら下)
execute store result score @s reg2 run data get entity @s Rotation[1] 100
scoreboard players remove @s[scores={reg2=18100..}] reg2 36000
scoreboard players add @s[scores={reg2=..-18100}] reg2 36000
scoreboard players operation @s reg2 -= @e[tag=controll-target,distance=..3,limit=1] AngX
scoreboard players remove @s[scores={reg2=18100..}] reg2 36000
scoreboard players add @s[scores={reg2=..-18100}] reg2 36000

#プレイヤーの向きに応じてAngXYZのスコア変更
execute if entity @s[scores={reg1=200..}] as @e[tag=controll-target,distance=..3,limit=1] at @s run scoreboard players operation @s AngY -= @s yaw-speed

execute if entity @s[scores={reg1=..-200}] as @e[tag=controll-target,distance=..3,limit=1] at @s run scoreboard players operation @s AngY += @s yaw-speed

execute if entity @s[scores={reg2=-17800..-300}] as @e[tag=controll-target,distance=..3,limit=1] at @s run scoreboard players operation @s AngX -= @s pitch-speed

execute if entity @s[scores={reg2=200..17800}] as @e[tag=controll-target,distance=..3,limit=1] at @s run scoreboard players operation @s AngX += @s pitch-speed

execute if entity @s[scores={reg1=-17800..-200}] as @e[tag=controll-target,distance=..3,limit=1,scores={AngZ=..9000}] at @s run scoreboard players operation @s AngZ += @s roll-speed

execute if entity @s[scores={reg1=300..17800}] as @e[tag=controll-target,distance=..3,limit=1,scores={AngZ=-9000..}] at @s run scoreboard players operation @s AngZ -= @s roll-speed

execute if entity @s[scores={reg1=-200..300}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngZ=100..18000}] at @s run scoreboard players operation @s AngZ -= @s roll-speed
execute if entity @s[scores={reg1=-200..300}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngZ=-18000..-100}] at @s run scoreboard players operation @s AngZ += @s roll-speed

#execute as @e[tag=controll-target,distance=..3,limit=1] run tellraw @a [{"text":"reg1:"},{"score":{"name":"@p","objective":"reg1"}},{"text":"AngZ:"},{"score":{"name":"@s","objective":"AngZ"}},{"text":"roll-speed:"},{"score":{"name":"@s","objective":"roll-speed"}}]


#AngXYZを-180 - 180の範囲に収める
scoreboard players remove @e[tag=controll-target,distance=..3,limit=1,scores={AngX=18100..}] AngX 36000
scoreboard players add @e[tag=controll-target,distance=..3,limit=1,scores={AngX=..-18100}] AngX 36000
scoreboard players remove @e[tag=controll-target,distance=..3,limit=1,scores={AngY=18100..}] AngY 36000
scoreboard players add @e[tag=controll-target,distance=..3,limit=1,scores={AngY=..-18100}] AngY 36000
scoreboard players remove @e[tag=controll-target,distance=..3,limit=1,scores={AngZ=18100..}] AngZ 36000
scoreboard players add @e[tag=controll-target,distance=..3,limit=1,scores={AngZ=..-18100}] AngZ 36000

#スロット8選択でspeed増，6選択で減、増で巡航速度を超えてた場合加速量を減少
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 = @s max-speed
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 -= @s speed
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 *= @s accelerate
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg2 = @s max-speed
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg2 -= @s cruise-speed
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 /= @s reg2
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s speed += @s reg1

execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed <= @s cruise-speed at @s run scoreboard players operation @s speed += @s accelerate
execute if entity @s[scores={plane-key-input=7}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed >= @s takeoff-speed at @s run scoreboard players operation @s speed -= @s accelerate

#speedがgear-pull-outだったら滑走モデル、gear-retractingだったら飛行モデルに切り替え
execute as @e[tag=controll-target,limit=1,distance=..3] if score @s speed >= @s gear-pullout-min if score @s speed <= @s gear-pullout-max store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm
execute as @e[tag=controll-target,limit=1,distance=..3] if score @s speed >= @s gear-retract-min if score @s speed <= @s gear-retract-max store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm

#1ブロック下が空気以外かつspeedが100未満ならなら着陸モードへ
execute as @e[tag=controll-target,distance=..3,limit=1] at @s if score @s takeoff-speed > @s speed unless block ~ ~-2 ~ minecraft:air run data merge entity @e[tag=plane-seat,distance=..5,limit=1] {Invulnerable:1b}
execute as @e[tag=controll-target,distance=..3,limit=1] at @s if score @s takeoff-speed > @s speed unless block ~ ~-1 ~ minecraft:air run function plane:controll/flying/landing


