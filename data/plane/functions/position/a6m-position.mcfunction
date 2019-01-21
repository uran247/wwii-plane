#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=a6m-root] at @s run function plane:position/a6m-position
#実行者：機体　実行位置：機体

#自分と同じIDを判定しタグ付け
tag @s add a6m-position-executer
execute as @e[tag=a6m,tag=!a6m-root] if score @s plane-id = @e[tag=a6m-position-executer,limit=1] plane-id run tag @s add a6m-position-target

#角度スコアが前tickから変化したか判定しタグ付け
execute if score @s AngX-old = @s AngX if score @s AngY-old = @s AngY if score @s AngZ-old = @s AngZ run tag @s add angle-not-changed

#角度スコアが変化していた場合ベクトル計算
execute if entity @s[tag=!angle-not-changed] run function plane:math/vector

#indicatorの位置を機体の向いてる方向へ移動
execute store result score @e[tag=plane-indicator,tag=a6m-position-target,distance=..6] reg1 run data get entity @s Pos[0] 20
scoreboard players operation @e[tag=plane-indicator,tag=a6m-position-target,distance=..6] reg1 += @s speedX
execute as @e[tag=plane-indicator,tag=a6m-position-target,distance=..6] store result entity @s Pos[0] double 0.05 run scoreboard players get @s reg1

execute store result score @e[tag=plane-indicator,tag=a6m-position-target,distance=..6] reg1 run data get entity @s Pos[1] 20
scoreboard players operation @e[tag=plane-indicator,tag=a6m-position-target,distance=..6] reg1 += @s speedY
execute as @e[tag=plane-indicator,tag=a6m-position-target,distance=..6] store result entity @s Pos[1] double 0.05 run scoreboard players get @s reg1

execute store result score @e[tag=plane-indicator,tag=a6m-position-target,distance=..6] reg1 run data get entity @s Pos[2] 20
scoreboard players operation @e[tag=plane-indicator,tag=a6m-position-target,distance=..6] reg1 += @s speedZ
execute as @e[tag=plane-indicator,tag=a6m-position-target,distance=..6] store result entity @s Pos[2] double 0.05 run scoreboard players get @s reg1
#tellraw @a ["",{"text":"X:"},{"score":{"name":"@e[tag=a6m-position-executer,limit=1]","objective":"speedX"}},{"text":"Y:"},{"score":{"name":"@e[tag=a6m-position-executer,limit=1]","objective":"speedY"}},{"text":" Z:"},{"score":{"name":"@e[tag=a6m-position-executer,limit=1]","objective":"speedZ"}}]

#角度スコアが変化していた場合rootをindicatorの方向に向ける
execute if entity @s[tag=!angle-not-changed] run teleport @s ^ ^ ^ facing entity @e[tag=plane-indicator,tag=a6m-position-target,distance=..6,limit=1]

#自分と同じIDのパーツを自分の位置へ
execute as @s at @s run tp @e[tag=a6m,tag=a6m-position-target,tag=!plane-indicator] ^ ^-0.2 ^1 ~90 ~

#角度スコアが変化していた場合NBT補正
execute if entity @s[tag=!angle-not-changed] as @e[tag=a6m,tag=a6m-position-target,distance=..2] run data merge entity @s {Pose:{RightArm:[0.0f,-90.0f,-102.0f]}}

#角度スコアが変化していた場合自分と同じIDのパーツの角度をスコア分にする
scoreboard players operation @s reg1 = @s AngX
scoreboard players remove @s reg1 9000
execute if entity @s[tag=!angle-not-changed] as @e[tag=a6m,tag=a6m-position-target,distance=..2,tag=!plane-indicator] at @s store result entity @s Pose.RightArm[2] float 0.01 run scoreboard players get @e[tag=a6m-position-executer,limit=1,distance=..2] reg1
scoreboard players operation @s reg1 = @s AngZ
scoreboard players remove @s reg1 9000
execute if entity @s[tag=!angle-not-changed] as @e[tag=a6m,tag=a6m-position-target,distance=..2,tag=!plane-indicator] at @s store result entity @s Pose.RightArm[1] float 0.01 run scoreboard players get @e[tag=a6m-position-executer,limit=1,distance=..2] reg1
#execute if entity @s[tag=!angle-not-changed] as @e[tag=a6m,tag=a6m-position-target,distance=..2,tag=!plane-indicator] at @s store result entity @s Rotation[0] float 0.01 run scoreboard players get @e[tag=a6m-position-executer,limit=1,distance=..2] AngY
#execute as @e[tag=a6m,tag=a6m-position-target,distance=..2] run data merge entity @s {Pose:{RightArm:[0.0f,-90.0f,-102.0f]}}

#Rootの向き修正
execute if entity @s[tag=!angle-not-changed] at @s store result entity @s Rotation[0] float 0.01 run scoreboard players get @e[tag=a6m-position-executer,limit=1,distance=..2] AngY
execute if entity @s[tag=!angle-not-changed] at @s store result entity @s Rotation[1] float 0.01 run scoreboard players get @e[tag=a6m-position-executer,limit=1,distance=..2] AngX


#indicatorのX角度補正
execute if entity @s[tag=!angle-not-changed] as @e[tag=a6m,tag=a6m-position-target,distance=..6,tag=plane-indicator] at @s store result entity @s Rotation[1] float 0.01 run scoreboard players get @e[tag=a6m-position-executer,limit=1,distance=..6] AngZ

#Ang-oldに現在のAng代入
scoreboard players operation @s AngX-old = @s AngX
scoreboard players operation @s AngY-old = @s AngY
scoreboard players operation @s AngZ-old = @s AngZ

#タグ削除
tag @s remove a6m-position-executer
execute if entity @s[tag=angle-not-changed] run tag @s remove angle-not-changed
tag @e[tag=a6m-position-target] remove a6m-position-target

