#飛行中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている
#使えるタグ　controll-target controll-parts
#ふぃくしょん方式

#選択スロット判定
execute as @s run function util:get-player-slot
scoreboard players operation @s plane-key-input = #selected-slot return

#周囲見渡しスロットを選択してたらタグ付け
tag @s[scores={plane-key-input=8}] add overlook

#engineがいなかったら強制的に速度マイナス
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={engine=0}] run scoreboard players set @p plane-key-input 6

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score #source-rot input run data get entity @s Rotation[0] 100
scoreboard players operation #target-rot input = @e[tag=controll-target,distance=..20,limit=1] AngY
function util:get-angle-defference
scoreboard players operation @s controll-yaw = #defference return

#プレイヤーが上を向いているか下を向いているか取得(0未満なら上、0以上なら下)
execute store result score #source-rot input run data get entity @s Rotation[1] 100
scoreboard players operation #target-rot input = @e[tag=controll-target,distance=..20,limit=1] AngX
function util:get-angle-defference
scoreboard players operation @s controll-pitch = #defference return

#plane-key-inputが8だったら旋回はしない（周囲見渡し用）
scoreboard players set @s[tag=overlook] controll-yaw 0
scoreboard players set @s[tag=overlook] controll-pitch 0


#### 角度変化量決定 ####
#Y角度変化最大量決定
#radderがなかったら変化量は半分 撃墜されてたら変化量は0
execute as @e[tag=controll-target,distance=..20,limit=1] run function plane:controll/flying/set-max-yaw
scoreboard players operation #max-yaw reg1 = #max-yaw return

#X角度変化最大量決定
#elevetorの数を数えて、1以下なら変化量は半分 撃墜されてたら変化量は0
execute as @e[tag=controll-target,distance=..20,limit=1] run function plane:controll/flying/set-max-pitch
scoreboard players operation #max-pitch reg1 = #max-pitch return


#### プレイヤーの向きに応じてAngXYZのスコア変更 ####
#yaw
scoreboard players operation #delta-angle input = @s controll-yaw
scoreboard players operation #base-angle input = @e[tag=controll-target,distance=..20,limit=1] AngY
scoreboard players operation #change-ammount input = #max-yaw reg1
function util:fill-angle-gap
scoreboard players operation @e[tag=controll-target,distance=..20,limit=1] AngY = #new-angle return
#pitch
scoreboard players operation #delta-angle input = @s controll-pitch
scoreboard players operation #base-angle input = @e[tag=controll-target,distance=..20,limit=1] AngX
scoreboard players operation #change-ammount input = #max-pitch reg1
function util:fill-angle-gap
scoreboard players operation @e[tag=controll-target,distance=..20,limit=1] AngX = #new-angle return

#yawが変化してたらrollも変化
execute if entity @s[scores={controll-yaw=-17800..-200}] as @e[tag=controll-target,distance=..20,limit=1,scores={AngZ=-9000..}] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngZ -= @s roll-speed
execute if entity @s[scores={controll-yaw=300..17800}] as @e[tag=controll-target,distance=..20,limit=1,scores={AngZ=..9000}] at @s[tag=!stall,tag=!destroyed] run scoreboard players operation @s AngZ += @s roll-speed

#rollをもとに戻す
execute if entity @s[scores={controll-yaw=-200..300}] as @e[tag=controll-target,distance=..20,limit=1] if entity @s[scores={AngZ=100..18000}] at @s run scoreboard players operation @s AngZ -= @s roll-speed
execute if entity @s[scores={controll-yaw=-200..300}] as @e[tag=controll-target,distance=..20,limit=1] if entity @s[scores={AngZ=-18000..-100}] at @s run scoreboard players operation @s AngZ += @s roll-speed

#AngYを-18000 - 18000に補正
scoreboard players remove @s[scores={AngY=36000..}] AngY 36000
scoreboard players add @s[scores={AngY=..-36000}] AngY 36000

#スロット8選択でthrottleが１，6選択で0
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players set @s throttle 1
execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players set @s throttle 0

#失速してたら警告表示
execute if entity @e[tag=controll-target,distance=..20,limit=1,tag=stall] run title @s times 0 1 1
execute if entity @e[tag=controll-target,distance=..20,limit=1,tag=stall] run title @s title [{"text":"失速！！","color":"dark_red"}]

#墜落判定が出たら表示
execute if entity @e[tag=controll-target,distance=..20,limit=1,tag=destroyed] run title @s times 0 1 1
execute if entity @e[tag=controll-target,distance=..20,limit=1,tag=destroyed] run title @s title [{"text":"墜落！！操作不能","color":"dark_red"}]

#speedがgear-pull-outだったら滑走モデル、gear-retractingだったら飛行モデルに切り替え(失速中の場合はギアを出さない)
execute as @e[tag=controll-target,limit=1,distance=..20,tag=!stall] if score @s speed >= @s gear-pullout-min if score @s speed <= @s gear-pullout-max store result entity @e[tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm
execute as @e[tag=controll-target,limit=1,distance=..20] if score @s speed >= @s gear-retract-min if score @s speed <= @s gear-retract-max store result entity @e[tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm

#1ブロック下が空気以外かつspeedが離陸速度未満かつ失速してないならならなら着陸モードへ
execute as @e[tag=controll-target,distance=..20,limit=1,tag=!stall,tag=!destroyed] at @s if score @s takeoff-speed > @s speed unless block ~ ~-2 ~ minecraft:air run data merge entity @e[tag=plane-seat,distance=..20,limit=1] {Invulnerable:1b}
execute as @e[tag=controll-target,distance=..20,limit=1,tag=!stall,tag=!destroyed] at @s if score @s takeoff-speed > @s speed unless block ~ ~-1 ~ minecraft:air run function plane:controll/flying/landing

#周囲見渡しタグ削除
tag @s[tag=overlook] remove overlook
