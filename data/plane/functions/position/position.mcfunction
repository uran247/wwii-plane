#入力：entity plane-root
#処理：飛行機の位置修正

#自分と同じIDを判定しタグ付け
tag @s add plane-position-executer
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[tag=plane,tag=!plane-root] if score @s plane-id = #plane-id reg1 run tag @s add position-target

#自分と同じIDのパーツを自分の位置へ
execute as @s at @s run tp @e[tag=position-target] ^ ^ ^ ~90 ~

#パーツのヘルスチェック
execute store result score @s plane-parts if entity @e[tag=position-target,distance=..20,tag=plane-hitbox]
execute store result score @s radder if entity @e[tag=position-target,distance=..20,tag=radder]
execute store result score @s elevetor if entity @e[tag=position-target,distance=..20,tag=elevetor]
execute store result score @s aileron if entity @e[tag=position-target,distance=..20,tag=aileron]
execute store result score @s engine if entity @e[tag=position-target,distance=..20,tag=engine]
execute store result score @s body if entity @e[tag=position-target,distance=..20,tag=body]

#パーツをオフセット位置へ
scoreboard players operation @e[tag=has-offset,tag=position-target] input1 = @s AngZ
execute as @e[tag=has-offset,tag=position-target] at @s rotated ~-90 ~ run function plane:position/calc-offset

#航空機ごとの個別処理
execute as @s[tag=a6m-root] run function plane:position/a6m-position
execute as @s[tag=d3a-root] run function plane:position/d3a-position
execute as @s[tag=ki21-root] run function plane:position/ki-21-position
execute as @s[tag=ki43-root] run function plane:position/ki-43-position
execute as @s[tag=a5m-root] run function plane:position/a5m-position
execute as @s[tag=a6m2-root] run function plane:position/a6m2-position
execute as @s[tag=ki44-root] run function plane:position/ki-44-position
execute as @s[tag=d4y2-root] run function plane:position/d4y2-position
execute as @s[tag=j2m3-root] run function plane:position/j2m3-position
execute as @s[tag=g4m1-root] run function plane:position/g4m1-position
#execute as @s[tag=spitfire-root] run function plane:position/spitfire-position
#execute as @s[tag=ju87-root] run function plane:position/ju87-position
#execute as @s[tag=f4u-root] run function plane:position/f4u-position
execute as @s[tag=j100b-root] run function plane:position/j-100b-position

#角度スコアが前tickから変化したか判定しタグ付け
execute if score @s AngX-old = @s AngX if score @s AngY-old = @s AngY if score @s AngZ-old = @s AngZ run tag @s add angle-not-changed

#角度スコアが変化していた場合ベクトル計算
execute if entity @s[tag=!angle-not-changed] run function math:vector

#角度補正
execute at @s[tag=!angle-not-changed] run function plane:position/position-common/modify-angle

#seatの位置表示
execute if entity @s[tag=!has-rider,tag=!no-move] at @e[tag=position-target,tag=plane-seat,tag=!no-particle,type=minecraft:armor_stand] run particle minecraft:happy_villager ~ ~2.8 ~ 0.1 0.1 0.1 1 1 force @a[tag=!plane-rider]

#Ang-oldに現在のAng代入
scoreboard players operation @s AngX-old = @s AngX
scoreboard players operation @s AngY-old = @s AngY
scoreboard players operation @s AngZ-old = @s AngZ

#処理済みタグ付与
tag @e[tag=position-target] add position-processed

#タグ削除
tag @s remove plane-position-executer
execute if entity @s[tag=angle-not-changed] run tag @s remove angle-not-changed
tag @e[tag=position-target] remove position-target
