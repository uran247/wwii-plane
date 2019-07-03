#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=d3a-root] at @s run function plane:position/d3a-position
#実行者：機体　実行位置：機体


#自分と同じIDを判定しタグ付け
tag @s add d3a-position-executer
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[tag=d3a,tag=!d3a-root] if score @s plane-id = #plane-id reg1 run tag @s add position-target

#爆弾装備タグがついていて爆弾が0なら召喚
execute store result score @s[tag=bombed] reg1 if entity @e[tag=position-target,tag=plane-bomb] 
execute as @s[tag=bombed,scores={ammunition2=3,reg1=0}] at @s run function summon:d3a/d3a-bomb

#自分と同じIDのパーツを自分の位置へ
execute as @s at @s run tp @e[tag=position-target] ^ ^ ^ ~90 ~

#パーツのヘルスチェック
execute store result score @s plane-parts if entity @e[tag=position-target,distance=..10,tag=plane-hitbox]
execute store result score @s radder if entity @e[tag=position-target,distance=..10,tag=radder]
execute store result score @s elevetor if entity @e[tag=position-target,distance=..10,tag=elevetor]
execute store result score @s aileron if entity @e[tag=position-target,distance=..10,tag=aileron]
execute store result score @s engine if entity @e[tag=position-target,distance=..10,tag=engine]
execute store result score @s body if entity @e[tag=position-target,distance=..10,tag=body]

#パーツをオフセット位置へ
scoreboard players operation @e[tag=has-offset,tag=position-target,distance=..3] input1 = @s AngZ
execute as @e[tag=has-offset,tag=position-target,distance=..3] at @s rotated ~-90 ~ run function plane:position/calc-offset

#角度スコアが前tickから変化したか判定しタグ付け
execute if score @s AngX-old = @s AngX if score @s AngY-old = @s AngY if score @s AngZ-old = @s AngZ run tag @s add angle-not-changed

#角度スコアが変化していた場合ベクトル計算
execute if entity @s[tag=!angle-not-changed] run function math:vector

#角度補正
execute at @s[tag=!angle-not-changed] run function plane:position/position-common/modify-angle

#seatの位置修正
execute at @s run tp @e[tag=position-target,tag=plane-seat,type=minecraft:armor_stand] ^ ^1 ^-1 ~ ~

#Ang-oldに現在のAng代入
scoreboard players operation @s AngX-old = @s AngX
scoreboard players operation @s AngY-old = @s AngY
scoreboard players operation @s AngZ-old = @s AngZ

#タグ削除
tag @s remove d3a-position-executer
execute if entity @s[tag=angle-not-changed] run tag @s remove angle-not-changed
tag @e[tag=position-target] remove position-target

