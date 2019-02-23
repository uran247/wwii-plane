#飛行中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている
#使えるタグ　controll-target controll-parts
#ふぃくしょん方式

#選択スロット判定
#scoreboard players set @s[scores={plane-key-input=1..}] plane-key-input 0
scoreboard players set @s[nbt={SelectedItemSlot:5}] plane-key-input 6
scoreboard players set @s[nbt={SelectedItemSlot:6}] plane-key-input 0
scoreboard players set @s[nbt={SelectedItemSlot:8}] plane-key-input 9

#周囲見渡しスロットを選択してたらタグ付け
tag @s[nbt={SelectedItemSlot:7}] add overlook

#engineがいなかったら強制的に速度マイナス
execute if entity @e[tag=controll-target,distance=..5,limit=1,scores={engine=0}] run scoreboard players set @p plane-key-input 6

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score @s controll-yaw run data get entity @s Rotation[0] 100
scoreboard players remove @s[scores={controll-yaw=18100..}] controll-yaw 36000
scoreboard players add @s[scores={controll-yaw=..-18100}] controll-yaw 36000
scoreboard players operation @s controll-yaw -= @e[tag=controll-target,distance=..5,limit=1] AngY
scoreboard players remove @s[scores={controll-yaw=18100..}] controll-yaw 36000
scoreboard players add @s[scores={controll-yaw=..-18100}] controll-yaw 36000
scoreboard players operation @s controll-yaw *= #-1 Num
#tellraw @a [{"text":"plane-key-input:"},{"score":{"name":"@s","objective":"plane-key-input"}}]

#プレイヤーが上を向いているか下を向いているか取得(0未満なら上、0以上なら下)
execute store result score @s controll-pitch run data get entity @s Rotation[1] 100
scoreboard players remove @s[scores={controll-pitch=18100..}] controll-pitch 36000
scoreboard players add @s[scores={controll-pitch=..-18100}] controll-pitch 36000
scoreboard players operation @s controll-pitch -= @e[tag=controll-target,distance=..5,limit=1] AngX
scoreboard players remove @s[scores={controll-pitch=18100..}] controll-pitch 36000
scoreboard players add @s[scores={controll-pitch=..-18100}] controll-pitch 36000

#plane-key-inputが8だったら旋回はしない（周囲見渡し用）
scoreboard players set @s[tag=overlook] controll-yaw 0
scoreboard players set @s[tag=overlook] controll-pitch 0

#Y角度変化最大量決定
#radderがなかったら変化量は半分
#撃墜されてたら変化量は0
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg1 = @s yaw-speed
execute if entity @e[tag=controll-target,distance=..5,limit=1,scores={radder=0}] as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg1 /= #2 Num
execute as @e[tag=controll-target,distance=..5,limit=1,tag=destroyed] run scoreboard players set @s reg1 0


#X角度変化最大量決定
#elevetorの数を数えて、1以下なら変化量は半分
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg2 = @s pitch-speed
execute if entity @e[tag=controll-target,distance=..5,limit=1,scores={elevetor=..1}] as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg2 /= #2 Num
execute as @e[tag=controll-target,distance=..5,limit=1,tag=destroyed] run scoreboard players set @s reg2 0

#### プレイヤーの向きに応じてAngXYZのスコア変更 ####
#controll-yawがreg1よりでかいならAngY-reg1、0以上reg1未満ならAngY-controll-target
execute if score @s controll-yaw > @e[tag=controll-target,distance=..5,limit=1] reg1 as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s AngY -= @s reg1
execute if entity @s[scores={controll-yaw=1..}] if score @s controll-yaw <= @e[tag=controll-target,distance=..5,limit=1] reg1 run scoreboard players operation @e[tag=controll-target,distance=..5,limit=1] AngY -= @s controll-yaw

#controll-yawが0以下なら判定のためreg1を反転
execute if entity @s[scores={controll-yaw=..0}] as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg1 *= #-1 Num

#controll-yawがreg1より小さいならAngY-reg1、0未満reg1以下ならAngY-controll-target
execute if score @s controll-yaw < @e[tag=controll-target,distance=..5,limit=1] reg1 as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s AngY -= @s reg1
execute if entity @s[scores={controll-yaw=..-1}] if score @s controll-yaw >= @e[tag=controll-target,distance=..5,limit=1] reg1 run scoreboard players operation @e[tag=controll-target,distance=..5,limit=1] AngY -= @s controll-yaw

#controll-pitchがreg2よりでかいならAngX-reg2、0以上reg2未満ならAngX-controll-target
execute if score @s controll-pitch > @e[tag=controll-target,distance=..5,limit=1] reg2 as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s AngX += @s reg2
execute if entity @s[scores={controll-pitch=1..}] if score @s controll-pitch <= @e[tag=controll-target,distance=..5,limit=1] reg2 run scoreboard players operation @e[tag=controll-target,distance=..5,limit=1] AngX += @s controll-pitch

#controll-pitchが0以下なら判定のためreg2を反転
execute if entity @s[scores={controll-pitch=..0}] as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg2 *= #-1 Num

#controll-pitchがreg2より小さいならAngX-reg2、0未満reg2以下ならAngX-controll-target
execute if score @s controll-pitch < @e[tag=controll-target,distance=..5,limit=1] reg2 as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s AngX += @s reg2
execute if entity @s[scores={controll-pitch=..-1}] if score @s controll-pitch >= @e[tag=controll-target,distance=..5,limit=1] reg2 run scoreboard players operation @e[tag=controll-target,distance=..5,limit=1] AngX += @s controll-pitch

#yawが変化してたらrollも変化
execute if entity @s[scores={controll-yaw=-17800..-200}] as @e[tag=controll-target,distance=..5,limit=1,scores={AngZ=..9000}] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngZ += @s roll-speed
execute if entity @s[scores={controll-yaw=300..17800}] as @e[tag=controll-target,distance=..5,limit=1,scores={AngZ=-9000..}] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngZ -= @s roll-speed

#rollをもとに戻す
execute if entity @s[scores={controll-yaw=-200..300}] as @e[tag=controll-target,distance=..5,limit=1] if entity @s[scores={AngZ=100..18000}] at @s run scoreboard players operation @s AngZ -= @s roll-speed
execute if entity @s[scores={controll-yaw=-200..300}] as @e[tag=controll-target,distance=..5,limit=1] if entity @s[scores={AngZ=-18000..-100}] at @s run scoreboard players operation @s AngZ += @s roll-speed

#AngXYZを-180 - 180の範囲に収める
scoreboard players remove @e[tag=controll-target,distance=..5,limit=1,scores={AngX=18100..}] AngX 36000
scoreboard players add @e[tag=controll-target,distance=..5,limit=1,scores={AngX=..-18100}] AngX 36000
scoreboard players remove @e[tag=controll-target,distance=..5,limit=1,scores={AngY=18100..}] AngY 36000
scoreboard players add @e[tag=controll-target,distance=..5,limit=1,scores={AngY=..-18100}] AngY 36000
scoreboard players remove @e[tag=controll-target,distance=..5,limit=1,scores={AngZ=18100..}] AngZ 36000
scoreboard players add @e[tag=controll-target,distance=..5,limit=1,scores={AngZ=..-18100}] AngZ 36000

#スロット8選択でspeed増，6選択で減、増で巡航速度を超えてた場合加速量を減少
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..5,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 = @s max-speed
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..5,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 -= @s speed
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..5,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 *= @s accelerate
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..5,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg2 = @s max-speed
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..5,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg2 -= @s cruise-speed
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..5,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 /= @s reg2
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..5,limit=1] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s speed += @s reg1

execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..5,limit=1] if score @s speed <= @s cruise-speed at @s run scoreboard players operation @s speed += @s accelerate
execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..5,limit=1] if score @s speed >= @s takeoff-speed at @s run scoreboard players operation @s speed -= @s accelerate

#減速量決定（スピードが早いほど増える）
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg2 = @s cruise-speed
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg2 -= @s stall-speed
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg3 = @s deaccelerate
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg3 -= @s accelerate
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg3 -= @s accelerate

execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg1 = @s speed
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg1 -= @s stall-speed
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players set @s[scores={reg1=..0}] reg1 0
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg1 *= @s reg3
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg1 /= @s reg2
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg1 += @s accelerate
execute as @e[tag=controll-target,distance=..5,limit=1] run scoreboard players operation @s reg1 += @s accelerate
execute as @e[tag=controll-target,distance=..5,limit=1] if score @s reg1 > @s deaccelerate run scoreboard players operation @s reg1 = @s deaccelerate

#失速してたら警告表示
execute if entity @e[tag=controll-target,distance=..5,limit=1,tag=stall] run title @s times 0 1 1
execute if entity @e[tag=controll-target,distance=..5,limit=1,tag=stall] run title @s title [{"text":"失速！！","color":"dark_red"}]

#墜落判定が出たら表示
execute if entity @e[tag=controll-target,distance=..5,limit=1,tag=destroyed] run title @s times 0 1 1
execute if entity @e[tag=controll-target,distance=..5,limit=1,tag=destroyed] run title @s title [{"text":"墜落！！操作不能","color":"dark_red"}]

#speedがgear-pull-outだったら滑走モデル、gear-retractingだったら飛行モデルに切り替え(失速中の場合はギアを出さない)
execute as @e[tag=controll-target,limit=1,distance=..5,tag=!stall] if score @s speed >= @s gear-pullout-min if score @s speed <= @s gear-pullout-max store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm
execute as @e[tag=controll-target,limit=1,distance=..5] if score @s speed >= @s gear-retract-min if score @s speed <= @s gear-retract-max store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm

#1ブロック下が空気以外かつspeedが離陸速度未満かつ失速してないならならなら着陸モードへ
execute as @e[tag=controll-target,distance=..5,limit=1,tag=!stall,tag=!destroyed] at @s if score @s takeoff-speed > @s speed unless block ~ ~-2 ~ minecraft:air run data merge entity @e[tag=plane-seat,distance=..5,limit=1] {Invulnerable:1b}
execute as @e[tag=controll-target,distance=..5,limit=1,tag=!stall,tag=!destroyed] at @s if score @s takeoff-speed > @s speed unless block ~ ~-1 ~ minecraft:air run function plane:controll/flying/landing

#周囲見渡しタグ削除
tag @s[tag=overlook] remove overlook
