#飛行中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている

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
execute store result score @s reg1 run data get entity @s Rotation[0] 1
scoreboard players remove @s[scores={reg1=181..}] reg1 360
scoreboard players add @s[scores={reg1=..-181}] reg1 360
scoreboard players operation @s reg1 -= @e[tag=controll-target,distance=..3,limit=1] AngY
scoreboard players remove @s[scores={reg1=181..}] reg1 360
scoreboard players add @s[scores={reg1=..-181}] reg1 360


#plane-key-input（選択スロット）に応じてAngXYZのスコア変更
execute if entity @s[scores={plane-key-input=0,reg1=-178..-3}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngX=-90..90}] at @s run scoreboard players operation @s AngY -= @s yaw-speed
execute if entity @s[scores={plane-key-input=0,reg1=-178..-3}] as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngX=-90..90}] at @s run scoreboard players operation @s AngY += @s yaw-speed

execute if entity @s[scores={plane-key-input=0,reg1=2..178}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngX=-90..90}] at @s run scoreboard players operation @s AngY += @s yaw-speed
execute if entity @s[scores={plane-key-input=0,reg1=3..178}] as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngX=-90..90}] at @s run scoreboard players operation @s AngY -= @s yaw-speed

execute if entity @s[scores={plane-key-input=2}] as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngZ=46..134}] unless entity @s[scores={AngZ=-134..-46}] at @s run scoreboard players operation @s AngX += @s pitch-speed
execute if entity @s[scores={plane-key-input=2}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngZ=46..134}] at @s run scoreboard players operation @s AngY += @s pitch-speed
execute if entity @s[scores={plane-key-input=2}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngZ=-134..-46}] at @s run scoreboard players operation @s AngY -= @s pitch-speed

execute if entity @s[scores={plane-key-input=8}] as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngZ=46..134}] unless entity @s[scores={AngZ=-134..-46}] at @s run scoreboard players operation @s AngX -= @s pitch-speed
execute if entity @s[scores={plane-key-input=8}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngZ=46..134}] at @s run scoreboard players operation @s AngY -= @s pitch-speed
execute if entity @s[scores={plane-key-input=8}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngZ=-134..-46}] at @s run scoreboard players operation @s AngY += @s pitch-speed

execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngX=46..134}] unless entity @s[scores={AngX=-134..-46}] at @s run scoreboard players operation @s AngZ -= @s roll-speed
execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngX=46..134}] at @s run scoreboard players operation @s AngY -= @s roll-speed
execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngX=-134..-46}] at @s run scoreboard players operation @s AngY += @s roll-speed

execute if entity @s[scores={plane-key-input=4}] as @e[tag=controll-target,distance=..3,limit=1] unless entity @s[scores={AngX=46..134}] unless entity @s[scores={AngX=-134..-46}] at @s run scoreboard players operation @s AngZ += @s roll-speed
execute if entity @s[scores={plane-key-input=4}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngX=46..134}] at @s run scoreboard players operation @s AngY -= @s roll-speed
execute if entity @s[scores={plane-key-input=4}] as @e[tag=controll-target,distance=..3,limit=1] if entity @s[scores={AngX=-134..-46}] at @s run scoreboard players operation @s AngY += @s roll-speed


#AngXYZを-180 - 180の範囲に収める
scoreboard players remove @e[tag=controll-target,distance=..3,limit=1,scores={AngX=181..}] AngX 360
scoreboard players add @e[tag=controll-target,distance=..3,limit=1,scores={AngX=..-181}] AngX 360
scoreboard players remove @e[tag=controll-target,distance=..3,limit=1,scores={AngY=181..}] AngY 360
scoreboard players add @e[tag=controll-target,distance=..3,limit=1,scores={AngY=..-181}] AngY 360
scoreboard players remove @e[tag=controll-target,distance=..3,limit=1,scores={AngZ=181..}] AngZ 360
scoreboard players add @e[tag=controll-target,distance=..3,limit=1,scores={AngZ=..-181}] AngZ 360

#スロット8選択でspeed増，6選択で減
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed < @s max-speed at @s run scoreboard players operation @s speed += @s accelerate
execute if entity @s[scores={plane-key-input=7}] as @e[tag=controll-target,distance=..3,limit=1] if score @s speed >= @s takeoff-speed at @s run scoreboard players operation @s speed -= @s accelerate

#speedがgear-pull-outだったら滑走モデル、gear-retractingだったら飛行モデルに切り替え
execute if score @e[tag=controll-target,limit=1,distance=..3] speed = @e[tag=controll-target,limit=1,distance=..3] gear-pull-out as @e[tag=controll-target,limit=1,distance=..3] store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm
execute if score @e[tag=controll-target,limit=1,distance=..3] speed = @e[tag=controll-target,limit=1,distance=..3] gear-retracting as @e[tag=controll-target,limit=1,distance=..3] store result entity @e[tag=plane-body,limit=1,sort=nearest,distance=..5] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm

#1ブロック下が空気以外かつspeedが100未満ならなら着陸モードへ
execute as @e[tag=controll-target,distance=..3,limit=1] at @s if score @s takeoff-speed > @s speed unless block ~ ~-2 ~ minecraft:air run data merge entity @e[tag=plane-seat,distance=..5,limit=1] {Invulnerable:1b}
execute as @e[tag=controll-target,distance=..3,limit=1] at @s if score @s takeoff-speed > @s speed unless block ~ ~-1 ~ minecraft:air run function plane:controll/flying/landing


