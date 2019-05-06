#角度/速度スコアからベクトルを計算して機体のMotionに反映する
#条件:tickで実行 execute as @e[type=armor_stand,tag=plane-root,scores={speed=1..}] at @s run function plane:move/move
#実行者：機体

#実行者にタグ付け
tag @s add flying-executer

#### 基本加速量決定 reg1に代入される ####
scoreboard players set @s reg1 0
#throttle1で増
execute if entity @s[scores={throttle=1}] run scoreboard players operation @s reg1 += @s accelerate
#throttle0で減
execute if entity @s[scores={throttle=0}] run scoreboard players operation @s reg1 -= @s accelerate


####減速量決定　reg4に代入される ####
#基本原則量決定　現在速度÷巡航速度*減速度　
scoreboard players operation @s reg2 = @s cruise-speed
scoreboard players operation @s reg3 = @s speed
scoreboard players operation @s reg4 = @s deaccelerate
scoreboard players operation @s reg4 *= @s reg3
scoreboard players operation @s reg4 /= @s reg2
#ピッチによって減速量調整
#y方向単位ベクトル×減速量
scoreboard players operation @s reg4 *= @s speedY
scoreboard players operation @s reg4 /= #100 Num


#### speed決定 ####
#speed+reg1-reg4
scoreboard players operation @s speed += @s reg1
scoreboard players operation @s speed -= @s reg4
#speedが0未満だったら0にする
scoreboard players set @s[scores={speed=..-1}] speed 0


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
