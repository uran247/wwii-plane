#飛行中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている
#使えるタグ　controll-target controll-parts
#ふぃくしょん方式

#選択スロット判定
scoreboard players set @s[scores={plane-key-input=1..}] plane-key-input 0
scoreboard players set @s[nbt={SelectedItemSlot:6}] plane-key-input 7
scoreboard players set @s[nbt={SelectedItemSlot:8}] plane-key-input 9

#engineがいなかったら強制的に速度マイナス
execute if entity @e[tag=controll-target,distance=..3,limit=1,scores={engine=0}] run scoreboard players set @p plane-key-input 7

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score @s controll-yaw run data get entity @s Rotation[0] 100
scoreboard players remove @s[scores={controll-yaw=18100..}] controll-yaw 36000
scoreboard players add @s[scores={controll-yaw=..-18100}] controll-yaw 36000
scoreboard players operation @s controll-yaw -= @e[tag=controll-target,distance=..3,limit=1] AngY
scoreboard players remove @s[scores={controll-yaw=18100..}] controll-yaw 36000
scoreboard players add @s[scores={controll-yaw=..-18100}] controll-yaw 36000
scoreboard players operation @s controll-yaw *= #-1 Num
#tellraw @a [{"text":"reg1:"},{"score":{"name":"@s","objective":"reg1"}},{"text":"AngY:"},{"score":{"name":"@e[tag=controll-target,distance=..3,limit=1]","objective":"AngY"}},{"text":"roll-speed:"},{"score":{"name":"@s","objective":"roll-speed"}}]

#radderがなかったら捜査は無効
execute if entity @e[tag=controll-target,distance=..3,limit=1,scores={radder=0}] run scoreboard players set @p controll-yaw 0

#プレイヤーが上を向いているか下を向いているか取得(0未満なら上、0以上なら下)
execute store result score @s controll-pitch run data get entity @s Rotation[1] 100
scoreboard players remove @s[scores={controll-pitch=18100..}] controll-pitch 36000
scoreboard players add @s[scores={controll-pitch=..-18100}] controll-pitch 36000
scoreboard players operation @s controll-pitch -= @e[tag=controll-target,distance=..3,limit=1] AngX
scoreboard players remove @s[scores={controll-pitch=18100..}] controll-pitch 36000
scoreboard players add @s[scores={controll-pitch=..-18100}] controll-pitch 36000

#elevetorの数を数えて、1以下なら操作は無効
execute if entity @e[tag=controll-target,distance=..3,limit=1,scores={elevetor=..1}] run scoreboard players set @p controll-yaw 0

#プレイヤーの向きに応じてAngXYZのスコア変更
execute if entity @s[scores={controll-yaw=200..}] as @e[tag=controll-target,distance=..3,limit=1] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngY -= @s yaw-speed
execute if entity @s[scores={controll-yaw=..-200}] as @e[tag=controll-target,distance=..3,limit=1] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngY += @s yaw-speed

execute if entity @s[scores={controll-pitch=-17800..-300}] as @e[tag=controll-target,distance=..3,limit=1] at @s[tag=!,tag=!destroyed] run scoreboard players operation @s AngX -= @s pitch-speed
execute if entity @s[scores={controll-pitch=200..17800}] as @e[tag=controll-target,distance=..3,limit=1] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngX += @s pitch-speed

#yawが変化してたらrollも変化
execute if entity @s[scores={controll-yaw=-17800..-200}] as @e[tag=controll-target,distance=..3,limit=1,scores={AngZ=..9000}] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngZ += @s roll-speed
execute if entity @s[scores={controll-yaw=300..17800}] as @e[tag=controll-target,distance=..3,limit=1,scores={AngZ=-9000..}] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngZ -= @s roll-speed

#rollをもとに戻す
execute if entity @s[scores={controll-yaw=-200..300}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngZ=100..18000}] at @s run scoreboard players operation @s AngZ -= @s roll-speed
execute if entity @s[scores={controll-yaw=-200..300}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngZ=-18000..-100}] at @s run scoreboard players operation @s AngZ += @s roll-speed

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

#減速量決定（スピードが早いほど増える）
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg2 = @s cruise-speed
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg2 -= @s stall-speed
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg3 = @s deaccelerate
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg3 -= @s accelerate
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg3 -= @s accelerate

execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg1 = @s speed
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg1 -= @s stall-speed
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players set @s[scores={reg1=..0}] reg1 0
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg1 *= @s reg3
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg1 /= @s reg2
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg1 += @s accelerate
execute as @e[tag=controll-target,distance=..3,limit=1] run scoreboard players operation @s reg1 += @s accelerate
execute as @e[tag=controll-target,distance=..3,limit=1] if score @s reg1 > @s deaccelerate run scoreboard players operation @s reg1 = @s deaccelerate

#失速してたら警告表示
execute if entity @e[tag=controll-target,distance=..3,limit=1,tag=stall] run title @s times 0 1 1
execute if entity @e[tag=controll-target,distance=..3,limit=1,tag=stall] run title @s title [{"text":"失速！！","color":"dark_red"}]

#墜落判定が出たら表示
execute if entity @e[tag=controll-target,distance=..3,limit=1,tag=destroyed] run title @s times 0 1 1
execute if entity @e[tag=controll-target,distance=..3,limit=1,tag=destroyed] run title @s title [{"text":"墜落！！操作不能","color":"dark_red"}]

#speedがgear-pull-outだったら滑走モデル、gear-retractingだったら飛行モデルに切り替え(失速中の場合はギアを出さない)
execute as @e[tag=controll-target,limit=1,distance=..3,tag=!stall] if score @s speed >= @s gear-pullout-min if score @s speed <= @s gear-pullout-max store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm
execute as @e[tag=controll-target,limit=1,distance=..3] if score @s speed >= @s gear-retract-min if score @s speed <= @s gear-retract-max store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm

#1ブロック下が空気以外かつspeedが離陸速度未満かつ失速してないならならなら着陸モードへ
execute as @e[tag=controll-target,distance=..3,limit=1,tag=!stall,tag=!destroyed] at @s if score @s takeoff-speed > @s speed unless block ~ ~-2 ~ minecraft:air run data merge entity @e[tag=plane-seat,distance=..5,limit=1] {Invulnerable:1b}
execute as @e[tag=controll-target,distance=..3,limit=1,tag=!stall,tag=!destroyed] at @s if score @s takeoff-speed > @s speed unless block ~ ~-1 ~ minecraft:air run function plane:controll/flying/landing


