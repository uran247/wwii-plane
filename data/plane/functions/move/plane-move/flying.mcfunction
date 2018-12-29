#角度/速度スコアからベクトルを計算して機体のMotionに反映する
#条件:tickで実行 execute as @e[type=armor_stand,tag=plane-root,scores={speed=1..}] at @s run function plane:move/move

#x方向ベクトル×speedをMotionに代入
#scoreboard players operation @s reg1 = @s speedX
#scoreboard players operation @s reg1 *= @s speed
#execute store result entity @s Motion[0] double 0.0001 run scoreboard players get @s reg1

#y方向ベクトル×speedをMotionに代入(滑走中の場合は実行しない)
#execute if entity @s[tag=flying] run scoreboard players operation @s reg1 = @s speedY
#execute if entity @s[tag=flying] run scoreboard players operation @s reg1 *= @s speed
#execute if entity @s[tag=flying] store result entity @s Motion[1] double 0.0001 run scoreboard players get @s reg1
#execute store result score @s reg1 run data get entity @s Motion[1]
#title @a actionbar ["",{"text":"reg1:"},{"score":{"name":"@s","objective":"reg1"}},{"text":"Y:"},{"score":{"name":"@e[tag=a6m-position-executer,limit=1]","objective":"speedY"}},{"text":" Z:"},{"score":{"name":"@e[tag=a6m-position-executer,limit=1]","objective":"speedZ"}}]

#z方向ベクトル×speedをMotionに代入
#scoreboard players operation @s reg1 = @s speedZ
#scoreboard players operation @s reg1 *= @s speed
#execute store result entity @s Motion[2] double 0.0001 run scoreboard players get @s reg1

#x方向ベクトル×speedをPosに代入
scoreboard players operation @s reg1 = @s speedX
scoreboard players operation @s reg1 *= @s speed
scoreboard players operation @s PosX += @s reg1
execute store result entity @s Pos[0] double 0.00001 run scoreboard players get @s PosX

#y方向ベクトル×speedをMotionに代入(滑走中の場合は実行しない)
scoreboard players operation @s reg1 = @s speedY
scoreboard players operation @s reg1 *= @s speed
scoreboard players operation @s PosY += @s reg1
execute store result entity @s Pos[1] double 0.00001 run scoreboard players get @s PosY

#z方向ベクトル×speedをMotionに代入
scoreboard players operation @s reg1 = @s speedZ
scoreboard players operation @s reg1 *= @s speed
scoreboard players operation @s PosZ += @s reg1
execute store result entity @s Pos[2] double 0.00001 run scoreboard players get @s PosZ


#音
scoreboard players set @s[scores={sound=30..}] sound 0
execute if entity @s[scores={sound=0,speed=-1..}] at @p run playsound minecraft:plane.engine.recipro-flying ambient @a ~ ~ ~ 10 1 1
scoreboard players operation @s reg1 = #rand rand
scoreboard players operation @s reg1 %= #4 Num
scoreboard players operation @s sound += @s reg1
#tellraw @p [{"score":{"name":"@s","objective":"reg1"}}]
