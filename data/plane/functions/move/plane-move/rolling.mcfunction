#角度/速度スコアからベクトルを計算して機体のMotionに反映する
#条件:tickで実行 execute as @e[type=armor_stand,tag=plane-root,scores={speed=1..}] at @s run function plane:move/move
#実行者：機体

#実行者にタグ付け
tag @s add flying-executer

#x方向ベクトル×speedをMotionに代入
scoreboard players operation @s reg1 = @s speedX
scoreboard players operation @s reg1 *= @s speed
execute store result entity @s Motion[0] double 0.00001 run scoreboard players get @s reg1

#Y方向ベクトルに0.05を代入
execute store result entity @s Motion[1] double -0.05 run scoreboard players get #1 Num

#z方向ベクトル×speedをMotionに代入
scoreboard players operation @s reg1 = @s speedZ
scoreboard players operation @s reg1 *= @s speed
execute store result entity @s Motion[2] double 0.00001 run scoreboard players get @s reg1


#音
scoreboard players set @s[scores={sound=33..}] sound 0
execute if entity @s[scores={sound=0,speed=1..}] at @p run playsound minecraft:plane.engine.recipro-rolling ambient @a ~ ~ ~ 10 1 1
scoreboard players operation @s reg1 = #rand rand
scoreboard players operation @s reg1 %= #3 Num
scoreboard players operation @s sound += @s reg1
scoreboard players add @s sound 1

#speedが0なら音停止
execute if entity @s[scores={speed=..0}] at @s run stopsound @a[distance=..10] * minecraft:plane.engine.recipro-rolling

#登場者がいるか判定して、いないならスピードを下げる
execute at @s as @a[tag=plane-rider] if score @e[tag=flying-executer,limit=1,distance=..1] plane-id = @s plane-id run tag @e[tag=flying-executer,limit=1,distance=..1] add exist-rider
execute at @s[tag=!exist-rider] run scoreboard players remove @s[scores={speed=1..}] speed 1

#タグ解除
tag @s remove exist-rider
tag @s remove flying-executer
