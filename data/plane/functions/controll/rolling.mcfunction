#滑走中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている

#選択スロット判定
#scoreboard players set @s[scores={plane-key-input=1..}] plane-key-input 0
scoreboard players set @s[nbt={SelectedItemSlot:5}] plane-key-input 6
scoreboard players set @s[nbt={SelectedItemSlot:6}] plane-key-input 0
scoreboard players set @s[nbt={SelectedItemSlot:8}] plane-key-input 9

#周囲見渡しスロットを選択してたらタグ付け
tag @s[nbt={SelectedItemSlot:7}] add overlook

#engineがいなかったら強制的に速度マイナス
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={engine=0}] run scoreboard players set @p plane-key-input 6

#スロット8選択でthrottleが１，6選択で0
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players set @s throttle 1
execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players set @s throttle 0

#speedが1になったらエンジン始動音を鳴らす
execute if score @e[tag=controll-target,tag=!engine-started,distance=..20,limit=1] speed > #1 Num as @e[tag=controll-target,distance=..20,limit=1] run playsound minecraft:plane.engine.recipro-start ambient @a ~ ~ ~ 1 1 1
execute if score @e[tag=controll-target,distance=..20,limit=1] speed > #1 Num run tag @e[tag=controll-target,distance=..20,limit=1] add engine-started
execute if score @e[tag=controll-target,tag=engine-started,distance=..20,limit=1] speed <= #0 Num run tag @e[tag=controll-target,distance=..20,limit=1] remove engine-started

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score @s controll-yaw run data get entity @s Rotation[0] 100
scoreboard players remove @s[scores={controll-yaw=18100..}] controll-yaw 36000
scoreboard players add @s[scores={controll-yaw=..-18100}] controll-yaw 36000
scoreboard players operation @s controll-yaw -= @e[tag=controll-target,distance=..20,limit=1] AngY
scoreboard players remove @s[scores={controll-yaw=18100..}] controll-yaw 36000
scoreboard players add @s[scores={controll-yaw=..-18100}] controll-yaw 36000

#Y角度変化最大量決定
#radderがなかったら変化量は半分
execute as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players operation @s reg1 = @s yaw-speed
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={radder=0}] as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players operation @s reg1 /= #2 Num

#plane-key-inputが8だったら旋回はしない（周囲見渡し用）
scoreboard players set @s[tag=overlook] controll-yaw 0
scoreboard players set @s[tag=overlook] controll-pitch 0

#プレイヤーの向きに応じてAngXYZのスコア変更
#controll-yawがreg1よりでかいならAngY-reg1、0以上reg1未満ならAngY-controll-target
execute if score @s controll-yaw > @e[tag=controll-target,distance=..20,limit=1] reg1 as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players operation @s AngY += @s reg1
execute if entity @s[scores={controll-yaw=11..}] if score @s controll-yaw <= @e[tag=controll-target,distance=..20,limit=1] reg1 run scoreboard players operation @e[tag=controll-target,distance=..20,limit=1] AngY += @s controll-yaw

#controll-yawが0以下なら判定のためreg1を反転
execute if entity @s[scores={controll-yaw=..0}] as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players operation @s reg1 *= #-1 Num

#controll-yawがreg1より小さいならAngY-reg1、0未満reg1以下ならAngY-controll-target
execute if score @s controll-yaw < @e[tag=controll-target,distance=..20,limit=1] reg1 as @e[tag=controll-target,distance=..20,limit=1] run scoreboard players operation @s AngY += @s reg1
execute if entity @s[scores={controll-yaw=..-11}] if score @s controll-yaw >= @e[tag=controll-target,distance=..20,limit=1] reg1 run scoreboard players operation @e[tag=controll-target,distance=..20,limit=1] AngY += @s controll-yaw

#スコアを-180 - 180の範囲に収める
scoreboard players remove @e[tag=controll-target,distance=..20,limit=1,scores={AngY=18100..}] AngY 36000
scoreboard players add @e[tag=controll-target,distance=..20,limit=1,scores={AngY=..-18100}] AngY 36000

#ヨー，ロールを着地時のものに固定
execute as @e[tag=controll-target,distance=..20,limit=1] unless entity @s[scores={AngX=-9000..9000}] run scoreboard players add @s AngX 18000
execute as @e[tag=controll-target,distance=..20,limit=1] unless entity @s[scores={AngX=-9000..9000}] run scoreboard players add @s AngZ 18000

#speedがtakeoff-speedを超えたら飛行状態に遷移
execute as @e[tag=controll-target,distance=..20,limit=1] if score @s takeoff-speed < @s speed run function plane:controll/rolling/takeoff

#speedがpropeller-stopだったら停止モデル、propeller-startだったら滑走モデルに切り替え
execute as @e[tag=controll-target,limit=1,distance=..20] if score @s speed >= @s plpr-stop-min if score @s speed <= @s plpr-stop-max store result entity @e[tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s parking-udvm
execute as @e[tag=controll-target,limit=1,distance=..20] if score @s speed >= @s plpr-start-min if score @s speed <= @s plpr-start-max store result entity @e[tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm

#周囲見渡しタグ削除
tag @s[tag=overlook] remove overlook
