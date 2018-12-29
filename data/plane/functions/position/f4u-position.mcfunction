#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=f4u-root] at @s run function plane:position/f4u-position
#実行者：機体　実行位置：機体

#自分と同じIDを判定しタグ付け
tag @s add f4u-position-executer
execute as @e[tag=f4u,tag=!f4u-root] if score @s plane-id = @e[tag=f4u-position-executer,limit=1] plane-id run tag @s add f4u-position-target

#角度スコアが前tickから変化したか判定しタグ付け
execute if score @s AngX-old = @s AngX if score @s AngY-old = @s AngY if score @s AngZ-old = @s AngZ run tag @s add angle-not-changed

#角度スコアが変化していた場合ベクトル計算
execute if entity @s[tag=!angle-not-changed] run function plane:math/vector

#indicatorの位置を機体の向いてる方向へ移動
execute store result score @e[tag=plane-indicator,tag=f4u-position-target,distance=..6] reg1 run data get entity @s Pos[0] 20
scoreboard players operation @e[tag=plane-indicator,tag=f4u-position-target,distance=..6] reg1 += @s speedX
execute as @e[tag=plane-indicator,tag=f4u-position-target,distance=..6] store result entity @s Pos[0] double 0.05 run scoreboard players get @s reg1

execute store result score @e[tag=plane-indicator,tag=f4u-position-target,distance=..6] reg1 run data get entity @s Pos[1] 20
scoreboard players operation @e[tag=plane-indicator,tag=f4u-position-target,distance=..6] reg1 += @s speedY
execute as @e[tag=plane-indicator,tag=f4u-position-target,distance=..6] store result entity @s Pos[1] double 0.05 run scoreboard players get @s reg1

execute store result score @e[tag=plane-indicator,tag=f4u-position-target,distance=..6] reg1 run data get entity @s Pos[2] 20
scoreboard players operation @e[tag=plane-indicator,tag=f4u-position-target,distance=..6] reg1 += @s speedZ
execute as @e[tag=plane-indicator,tag=f4u-position-target,distance=..6] store result entity @s Pos[2] double 0.05 run scoreboard players get @s reg1
#tellraw @a ["",{"text":"X:"},{"score":{"name":"@e[tag=f4u-position-executer,limit=1]","objective":"speedX"}},{"text":"Y:"},{"score":{"name":"@e[tag=f4u-position-executer,limit=1]","objective":"speedY"}},{"text":" Z:"},{"score":{"name":"@e[tag=f4u-position-executer,limit=1]","objective":"speedZ"}}]

#角度スコアが変化していた場合rootをindicatorの方向に向ける
execute if entity @s[tag=!angle-not-changed] run teleport @s ^ ^ ^ facing entity @e[tag=plane-indicator,tag=f4u-position-target,distance=..6,limit=1]

#角度スコアが変化していた場合indicatorをrootに対して90度の方向に向ける
#execute if entity @s[tag=!angle-not-changed] at @e[tag=plane-indicator,tag=f4u-position-target,distance=..6,limit=1] run teleport @e[tag=plane-indicator,tag=f4u-position-target,distance=..6,limit=1] ^ ^ ^ facing entity @s
#execute if entity @s[tag=!angle-not-changed] at @e[tag=plane-indicator,tag=f4u-position-target,distance=..6,limit=1] run teleport @e[tag=plane-indicator,tag=f4u-position-target,distance=..6,limit=1] ~ ~ ~ ~90 ~

#自分と同じIDのパーツを自分の位置へ
execute as @s at @s run tp @e[tag=f4u,tag=f4u-position-target,tag=!plane-indicator] ^ ^-0.2 ^1

#パーツをオフセット位置へ
execute if entity @s[tag=folded] run scoreboard players set @e[tag=f4u-wing-r,tag=f4u-position-target,distance=..10] offsetX -2060
execute if entity @s[tag=!folded] run scoreboard players set @e[tag=f4u-wing-r,tag=f4u-position-target,distance=..10] offsetX -1860
scoreboard players operation @e[tag=plane-parts,tag=f4u-position-target] input1 = @s AngZ
execute as @e[tag=f4u-wing-r,tag=f4u-position-target] at @s run function plane:position/calc-offset
execute as @e[tag=f4u-wing-l,tag=f4u-position-target] at @s run function plane:position/calc-offset
execute as @e[tag=f4u-rocket,tag=f4u-position-target] at @s run function plane:position/calc-offset
execute rotated as @s as @e[tag=f4u-rocket,tag=f4u-position-target] positioned as @s rotated as @s run tp @s ^ ^ ^1.4
#角度スコアが変化していた場合NBT補正
execute if entity @s[tag=!angle-not-changed] as @e[tag=f4u,tag=f4u-position-target,distance=..2] run data merge entity @s {Pose:{RightArm:[-12.0f,0.0f,0.0f]}}

#角度スコアが変化していた場合自分と同じIDのパーツの角度をスコア分にする
execute if entity @s[tag=!angle-not-changed] as @e[tag=f4u,tag=f4u-position-target,distance=..10,tag=!plane-indicator] at @s store result entity @s Pose.RightArm[0] float 0.01 run scoreboard players get @e[tag=f4u-position-executer,limit=1,distance=..10] AngX
execute if entity @s[tag=!angle-not-changed] as @e[tag=f4u,tag=f4u-position-target,distance=..10,tag=!plane-indicator] at @s store result entity @s Pose.RightArm[2] float 0.01 run scoreboard players get @e[tag=f4u-position-executer,limit=1,distance=..10] AngZ
execute if entity @s[tag=!angle-not-changed] as @e[tag=f4u,tag=f4u-position-target,distance=..10,tag=!plane-indicator] at @s store result entity @s Rotation[0] float 0.01 run scoreboard players get @e[tag=f4u-position-executer,limit=1,distance=..10] AngY
execute if entity @s[tag=!angle-not-changed] as @e[tag=plane-parts,tag=f4u-position-target] store result entity @s Rotation[1] float 0.01 run scoreboard players get @e[tag=f4u-position-executer,limit=1,distance=..10] AngX
execute if entity @s[tag=!angle-not-changed] as @e[tag=plane-parts,tag=f4u-position-target] store result entity @s Rotation[0] float 0.01 run scoreboard players get @e[tag=f4u-position-executer,limit=1,distance=..10] AngY

#foldedの場合翼を折りたたみ角度にする
execute if entity @s[tag=folded] run tag @e[tag=f4u-position-target,distance=..10,tag=!folded] add folded
execute if entity @s[tag=folded] as @e[tag=f4u-wing-r,tag=f4u-position-target,distance=..10,tag=folded] run data merge entity @s {Pose:{RightArm:[0.0f,12.0f,110.0f]}}
execute if entity @s[tag=folded] as @e[tag=f4u-wing-l,tag=f4u-position-target,distance=..10,tag=folded] run data merge entity @s {Pose:{RightArm:[0.0f,-12.0f,-110.0f]}}
execute if entity @s[tag=folded] as @e[tag=rocket-r,tag=f4u-position-target,distance=..10,tag=folded] run data merge entity @s {Pose:{RightArm:[0.0f,12.0f,110.0f]}}
execute if entity @s[tag=folded] as @e[tag=rocket-l,tag=f4u-position-target,distance=..10,tag=folded] run data merge entity @s {Pose:{RightArm:[0.0f,-12.0f,-110.0f]}}
execute if entity @s[tag=folded] rotated as @s as @e[tag=f4u-wing-r,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^ ^-0.3 ^
execute if entity @s[tag=folded] rotated as @s as @e[tag=f4u-wing-l,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^ ^-0.2 ^
execute if entity @s[tag=folded] rotated as @s as @e[tag=rocket1,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^0.1 ^1.2 ^
execute if entity @s[tag=folded] rotated as @s as @e[tag=rocket2,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^0.7 ^0.6 ^
execute if entity @s[tag=folded] rotated as @s as @e[tag=rocket3,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^0.9 ^1.65 ^
execute if entity @s[tag=folded] rotated as @s as @e[tag=rocket4,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^-0.1 ^1.05 ^
execute if entity @s[tag=folded] rotated as @s as @e[tag=rocket5,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^1.7 ^2.1 ^
execute if entity @s[tag=folded] rotated as @s as @e[tag=rocket6,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^-0.9 ^1.5 ^
execute if entity @s[tag=folded] rotated as @s as @e[tag=rocket7,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^2.5 ^2.55 ^
execute if entity @s[tag=folded] rotated as @s as @e[tag=rocket8,tag=f4u-position-target,distance=..10] positioned as @s run tp @s ^-1.7 ^1.99 ^
execute if entity @s[tag=!folded] as @e[tag=f4u-wing-r,tag=f4u-position-target,distance=..10,tag=folded] run data merge entity @s {Pose:{RightArm:[-12.0f,0.0f,0.0f]}}
execute if entity @s[tag=!folded] as @e[tag=f4u-wing-l,tag=f4u-position-target,distance=..10,tag=folded] run data merge entity @s {Pose:{RightArm:[-12.0f,0.0f,0.0f]}}
execute if entity @s[tag=!folded] as @e[tag=rocket-r,tag=f4u-position-target,distance=..10,tag=folded] run data merge entity @s {Pose:{RightArm:[-12.0f,0.0f,0.0f]}}
execute if entity @s[tag=!folded] as @e[tag=rocket-l,tag=f4u-position-target,distance=..10,tag=folded] run data merge entity @s {Pose:{RightArm:[-12.0f,0.0f,0.0f]}}
execute if entity @s[tag=!folded] run tag @e[tag=f4u-position-target,distance=..10,tag=folded] remove folded


#Rootの向き修正
execute if entity @s[tag=!angle-not-changed] at @s store result entity @s Rotation[0] float 0.01 run scoreboard players get @e[tag=f4u-position-executer,limit=1,distance=..2] AngY
execute if entity @s[tag=!angle-not-changed] at @s store result entity @s Rotation[1] float 0.01 run scoreboard players get @e[tag=f4u-position-executer,limit=1,distance=..2] AngX

#indicatorのX角度補正
execute if entity @s[tag=!angle-not-changed] as @e[tag=f4u,tag=f4u-position-target,distance=..6,tag=plane-indicator] at @s store result entity @s Rotation[1] float 0.01 run scoreboard players get @e[tag=f4u-position-executer,limit=1,distance=..6] AngZ

#Ang-oldに現在のAng代入
scoreboard players operation @s AngX-old = @s AngX
scoreboard players operation @s AngY-old = @s AngY
scoreboard players operation @s AngZ-old = @s AngZ

#タグ削除
tag @s remove f4u-position-executer
execute if entity @s[tag=angle-not-changed] run tag @s remove angle-not-changed
tag @e[tag=f4u-position-target] remove f4u-position-target

