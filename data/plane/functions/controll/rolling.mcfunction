#滑走中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている

#選択スロット判定
#execute as @s run function util:get-player-slot
#scoreboard players operation @s plane-key-input = #selected-slot return


#周囲見渡しスロットを選択してたらタグ付け
tag @s[scores={plane-key-input=8}] add overlook

#engineがいなかったら強制的に速度マイナス
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={engine=0}] run scoreboard players set @p plane-key-input 6

#スロット8選択でthrottleが+１，6選択で-1
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players add @s[scores={throttle=..19}] throttle 1
execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players remove @s[scores={throttle=1..}] throttle 1

#speedが1になったらエンジン始動音を鳴らす
execute as @e[tag=controll-target,distance=..20] at @s run function plane:controll/rolling/engine-start-sound

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score #source-rot input run data get entity @s Rotation[0] 100
scoreboard players operation #target-rot input = @e[tag=controll-target,distance=..20,limit=1] AngY
function util:get-angle-defference
scoreboard players operation @s controll-yaw = #defference return

#plane-key-inputが8だったら旋回はしない（周囲見渡し用）
scoreboard players set @s[tag=overlook] controll-yaw 0

#Y角度変化最大量決定
#radderがなかったら変化量は半分 撃墜されてたら変化量は0
execute as @e[tag=controll-target,distance=..20,limit=1] run function plane:controll/flying/set-max-yaw
scoreboard players operation #max-yaw reg1 = #max-yaw return

#### プレイヤーの向きに応じてAngXYZのスコア変更 ####
#yaw
scoreboard players operation #delta-angle input = @s controll-yaw
scoreboard players operation #base-angle input = @e[tag=controll-target,distance=..20,limit=1] AngY
scoreboard players operation #change-ammount input = #max-yaw reg1
function util:fill-angle-gap
scoreboard players operation @e[tag=controll-target,distance=..20,limit=1] AngY = #new-angle return

#スコアを-180 - 180の範囲に収める
execute as @e[tag=controll-target,distance=..20,limit=1] run function plane:controll/flying/correct-ang-y

#ピッチ，ロールを着地時のものに固定
execute as @e[tag=controll-target,distance=..20,limit=1] run function plane:controll/rolling/correct-ang-xz

#speedがtakeoff-speedを超えスロットル全開なら飛行状態に遷移
execute as @e[tag=controll-target,distance=..20,limit=1,scores={throttle=20..}] if score @s takeoff-speed < @s speed run function plane:controll/rolling/takeoff

#speedがpropeller-stopだったら停止モデル、propeller-startだったら滑走モデルに切り替え
execute as @e[tag=controll-target,distance=..20,limit=1] at @s run function plane:controll/rolling/change-plpr-model

#周囲見渡しタグ削除
tag @s[tag=overlook] remove overlook
