#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=a6m-root] at @s run function plane:position/a6m-position
#実行者：機体　実行位置：機体

#自分と同じIDを判定しタグ付け
tag @s add a6m-position-executer
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[tag=a6m,tag=!a6m-root,distance=..40] if score @s plane-id = #plane-id reg1 run tag @s add position-target

#自分と同じIDのパーツを自分の位置へ
execute as @s at @s run tp @e[tag=a6m,tag=position-target,distance=..40] ^ ^ ^ ~90 ~

#パーツのヘルスチェック
execute store result score @s plane-parts if entity @e[tag=position-target,distance=..10,tag=plane-hitbox]
execute store result score @s radder if entity @e[tag=position-target,distance=..10,tag=radder]
execute store result score @s elevetor if entity @e[tag=position-target,distance=..10,tag=elevetor]
execute store result score @s aileron if entity @e[tag=position-target,distance=..10,tag=aileron]
execute store result score @s engine if entity @e[tag=position-target,distance=..10,tag=engine]
execute store result score @s body if entity @e[tag=position-target,distance=..10,tag=body]

#パーツをオフセット位置へ
scoreboard players operation @e[tag=has-offset,tag=position-target] input1 = @s AngZ
execute as @e[tag=has-offset,tag=position-target,distance=..1] at @s rotated ~-90 ~ run function plane:position/calc-offset

execute as @e[tag=engine,tag=position-target,distance=..10] at @s rotated ~-90 ~ run tp @s ^ ^ ^2
execute as @e[tag=aileron-r,tag=position-target,distance=..10] at @s rotated ~-90 ~ run tp @s ^ ^ ^0.1
execute as @e[tag=aileron-l,tag=position-target,distance=..10] at @s rotated ~-90 ~ run tp @s ^ ^ ^0.1
execute as @e[tag=elevator-r,tag=position-target,distance=..10] at @s rotated ~-90 ~ run tp @s ^ ^ ^-4.4
execute as @e[tag=elevator-l,tag=position-target,distance=..10] at @s rotated ~-90 ~ run tp @s ^ ^ ^-4.4
execute as @e[tag=radder,tag=position-target,distance=..10] at @s rotated ~-90 ~ run tp @s ^ ^ ^-4.9

#seatの位置修正
execute at @s run tp @e[tag=position-target,tag=plane-seat,type=minecraft:armor_stand,distance=..10] ^ ^1 ^-1 ~ ~

#角度スコアが前tickから変化したか判定しタグ付け
execute if score @s AngX-old = @s AngX if score @s AngY-old = @s AngY if score @s AngZ-old = @s AngZ run tag @s add angle-not-changed

#角度スコアが変化していた場合ベクトル計算
execute if entity @s[tag=!angle-not-changed] run function math:vector

#角度補正
execute at @s[tag=!angle-not-changed] run function plane:position/position-common/modify-angle
##角度スコアが変化していた場合NBT補正(なぜかAngXを変更できなくなるバグ防止)
#execute if entity @s[tag=!angle-not-changed] as @e[tag=a6m,tag=position-target,distance=..10] run data merge entity @s {Pose:{RightArm:[0.0f,-90.0f,-102.0f]}}
#
##角度スコアが変化していた場合自分と同じIDのパーツのモデル角度をスコア分にする
#scoreboard players operation #ang-x reg1 = @s AngX
#scoreboard players remove #ang-x reg1 9000
#execute if entity @s[tag=!angle-not-changed] as @e[tag=has-model,tag=position-target,distance=..10] at @s store result entity @s Pose.RightArm[2] float 0.01 run scoreboard players get #ang-x reg1
#scoreboard players operation #ang-z reg1 = @s AngZ
#scoreboard players remove #ang-z reg1 9000
#execute if entity @s[tag=!angle-not-changed] as @e[tag=has-model,tag=position-target,distance=..10] at @s store result entity @s Pose.RightArm[1] float 0.01 run scoreboard players get #ang-z reg1
#
##Rootの向き修正
#execute if entity @s[tag=!angle-not-changed] at @s store result entity @s Rotation[0] float 0.01 run scoreboard players get @s AngY
#execute if entity @s[tag=!angle-not-changed] at @s store result entity @s Rotation[1] float 0.01 run scoreboard players get @s AngX
#
##パーツのX角度補正
#scoreboard players operation #ang-z reg1 = @s AngZ
#execute if entity @s[tag=!angle-not-changed] as @e[tag=a6m,tag=position-target,distance=..6] at @s store result entity @s Rotation[1] float 0.01 run scoreboard players get #ang-z reg1

#Ang-oldに現在のAng代入
scoreboard players operation @s AngX-old = @s AngX
scoreboard players operation @s AngY-old = @s AngY
scoreboard players operation @s AngZ-old = @s AngZ

#タグ削除
tag @s remove a6m-position-executer
execute if entity @s[tag=angle-not-changed] run tag @s remove angle-not-changed
tag @e[tag=position-target,distance=..10] remove position-target

