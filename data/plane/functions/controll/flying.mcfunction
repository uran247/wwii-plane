#飛行中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている
#入力：　エンティティ：プレイヤー　座標：機体　タグ：controll-target controll-parts
#ふぃくしょん方式

#周囲見渡しスロットを選択してたらタグ付け
tag @s[scores={plane-key-input=8}] add overlook

#engineがいなかったら強制的に速度マイナス
execute if entity @e[tag=controll-target,distance=..1,limit=1,scores={engine=0}] run scoreboard players set @p plane-key-input 6

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score #source-rot input run data get entity @s Rotation[0] 100
scoreboard players operation #target-rot input = @e[tag=controll-target,distance=..1,limit=1] AngY
function util:get-angle-defference
scoreboard players operation #yaw-gap reg1 = #defference return

#プレイヤーが上を向いているか下を向いているか取得(0未満なら上、0以上なら下)
execute store result score #source-rot input run data get entity @s Rotation[1] 100
scoreboard players operation #target-rot input = @e[tag=controll-target,distance=..1,limit=1] AngX
function util:get-angle-defference
scoreboard players operation #pitch-gap reg1 = #defference return

#周囲見渡し用タグがついてたらyaw-gap,pitch-gapを0にして旋回を無効
execute if entity @s[tag=overlook] run scoreboard players set #yaw-gap reg1 0
execute if entity @s[tag=overlook] run scoreboard players set #pitch-gap reg1 0


#### 角度変化量決定 ####
#Y角度変化最大量決定
#radderがなかったら変化量は半分 撃墜されてたら変化量は0
execute as @e[tag=controll-target,distance=..1,limit=1] run function plane:controll/flying/set-max-yaw
scoreboard players operation #max-yaw reg1 = #max-yaw return

#X角度変化最大量決定
#elevetorの数を数えて、1以下なら変化量は半分 撃墜されてたら変化量は0
execute as @e[tag=controll-target,distance=..1,limit=1] run function plane:controll/flying/set-max-pitch
scoreboard players operation #max-pitch reg1 = #max-pitch return


#### プレイヤーの向きに応じてAngXYZのスコア変更 ####
#yaw
scoreboard players operation #delta-angle input = #yaw-gap reg1
scoreboard players operation #base-angle input = @e[tag=controll-target,distance=..1,limit=1] AngY
scoreboard players operation #change-ammount input = #max-yaw reg1
function util:fill-angle-gap
scoreboard players operation @e[tag=controll-target,distance=..1,limit=1] AngY = #new-angle return
#pitch
scoreboard players operation #delta-angle input = #pitch-gap reg1
scoreboard players operation #base-angle input = @e[tag=controll-target,distance=..1,limit=1] AngX
scoreboard players operation #change-ammount input = #max-pitch reg1
function util:fill-angle-gap
scoreboard players operation @e[tag=controll-target,distance=..1,limit=1] AngX = #new-angle return

#yawが変化してたらrollも変化(-9000..9000)
scoreboard players operation #roll-speed reg1 = @e[tag=controll-target,distance=..1,limit=1] roll-speed
execute if score #yaw-gap reg1 >= #-17800 Num if score #yaw-gap reg1 <= #-200 Num as @e[tag=controll-target,distance=..1,limit=1,scores={AngZ=-8999..}] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngZ -= #roll-speed reg1
execute if score #yaw-gap reg1 >= #300 Num if score #yaw-gap reg1 <= #17800 Num as @e[tag=controll-target,distance=..1,limit=1,scores={AngZ=..8999}] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngZ += #roll-speed reg1
execute if score #yaw-gap reg1 >= #-17800 Num if score #yaw-gap reg1 <= #-200 Num as @e[tag=controll-target,distance=..1,limit=1,scores={AngZ=..-9000}] at @s[tag=!stall,tag=!destroyed] run scoreboard players set @s AngZ -9000
execute if score #yaw-gap reg1 >= #300 Num if score #yaw-gap reg1 <= #17800 Num as @e[tag=controll-target,distance=..1,limit=1,scores={AngZ=9000..}] at @s[tag=!stall,tag=!destroyed] run scoreboard players set @s AngZ 9000

#rollをもとに戻す
execute if score #yaw-gap reg1 >= #-200 Num if score #yaw-gap reg1 <= #300 Num as @e[tag=controll-target,distance=..1,limit=1,scores={AngZ=1..18000}] at @s run scoreboard players operation @s AngZ -= #roll-speed reg1
execute if score #yaw-gap reg1 >= #-200 Num if score #yaw-gap reg1 <= #300 Num as @e[tag=controll-target,distance=..1,limit=1,scores={AngZ=-18000..-1}] at @s run scoreboard players operation @s AngZ += #roll-speed reg1
execute if score #yaw-gap reg1 >= #-200 Num if score #yaw-gap reg1 <= #300 Num as @e[tag=controll-target,distance=..1,limit=1,scores={AngZ=1..}] if score @s AngZ < #roll-speed reg1 at @s run scoreboard players set @s AngZ 0
scoreboard players operation #roll-speed reg1 *= #-1 Num
execute if score #yaw-gap reg1 >= #-200 Num if score #yaw-gap reg1 <= #300 Num as @e[tag=controll-target,distance=..1,limit=1,scores={AngZ=..-1}] if score @s AngZ > @s roll-speed at @s run scoreboard players set @s AngZ 0

#AngYを-18000 - 18000に補正
scoreboard players remove @e[tag=controll-target,distance=..1,limit=1,scores={AngY=18100..}] AngY 36000
scoreboard players add @e[tag=controll-target,distance=..1,limit=1,scores={AngY=..-18100}] AngY 36000

#スロット8選択でthrottleが+１，6選択で-1
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..1,limit=1] run scoreboard players add @s[scores={throttle=..19}] throttle 1
execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..1,limit=1] run scoreboard players remove @s[scores={throttle=1..}] throttle 1

#失速してたら警告表示
execute if entity @e[tag=controll-target,distance=..1,limit=1,tag=stall] run title @s times 0 1 1
execute if entity @e[tag=controll-target,distance=..1,limit=1,tag=stall] run title @s title [{"text":"失速！！","color":"dark_red"}]

#墜落判定が出たら表示
execute if entity @e[tag=controll-target,distance=..1,limit=1,tag=destroyed] run title @s times 0 1 1
execute if entity @e[tag=controll-target,distance=..1,limit=1,tag=destroyed] run title @s title [{"text":"墜落！！操作不能","color":"dark_red"}]

#speedがgear-pull-outだったら滑走モデル、gear-retractingだったら飛行モデルに切り替え(失速中の場合はギアを出さない)
execute as @e[tag=controll-target,limit=1,distance=..20,tag=!stall] if score @s speed >= @s gear-pullout-min if score @s speed <= @s gear-pullout-max store result entity @e[tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm
execute as @e[tag=controll-target,limit=1,distance=..20] if score @s speed >= @s gear-retract-min if score @s speed <= @s gear-retract-max store result entity @e[tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm

#1ブロック下が空気以外かつspeedがギア引き出し速度未満、失速してない、throttlが50%未満ならならなら着陸モードへ
execute as @e[tag=controll-target,distance=..1,limit=1,tag=!stall,tag=!destroyed,scores={throttle=..10}] at @s if score @s gear-pullout-max > @s speed unless block ~ ~-2 ~ minecraft:air run data merge entity @e[tag=plane-seat,distance=..20,limit=1] {Invulnerable:1b}
execute as @e[tag=controll-target,distance=..1,limit=1,tag=!stall,tag=!destroyed,scores={throttle=..10}] at @s if score @s gear-pullout-max > @s speed unless block ~ ~-1 ~ minecraft:air run function plane:controll/flying/landing

#周囲見渡しタグ削除
tag @s[tag=overlook] remove overlook
