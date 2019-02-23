#角度/速度スコアからベクトルを計算して機体のMotionに反映する
#失速判定と墜落判定をやる
#条件:tickで実行 execute as @e[type=armor_stand,tag=plane-root,scores={speed=1..}] at @s run function plane:move/move
#実行者：機体

#実行者にタグ付け
tag @s add flying-executer

#ピッチによってスピード調整
scoreboard players operation @s[scores={AngX=..0}] reg1 *= @s AngX
scoreboard players operation @s[scores={AngX=..0}] reg1 /= #9000 Num
scoreboard players operation @s[scores={AngX=..0}] speed += @s reg1

scoreboard players operation @s[scores={AngX=1..}] reg1 = @s accelerate
scoreboard players operation @s[scores={AngX=1..}] reg1 *= @s AngX
scoreboard players operation @s[scores={AngX=1..}] reg1 /= #9000 Num
scoreboard players operation @s[scores={AngX=1..}] speed += @s reg1

#speedが0未満だったら0にする
scoreboard players set @e[scores={speed=..-1}] speed 0

#x方向ベクトル×speedをPosに代入
scoreboard players operation @s reg1 = @s speedX
scoreboard players operation @s reg1 *= @s speed
scoreboard players operation @s PosX += @s reg1
execute store result entity @s Pos[0] double 0.00001 run scoreboard players get @s PosX

#y方向ベクトル×speedをMotionに代入(滑走中の場合は実行しない、失速の場合下降させる)
scoreboard players operation @s reg1 = @s speedY
scoreboard players operation @s reg1 *= @s speed
scoreboard players operation @s[tag=!stall] PosY += @s reg1
scoreboard players operation @s[tag=stall] PosY -= #50000 Num
execute store result entity @s Pos[1] double 0.00001 run scoreboard players get @s PosY

#z方向ベクトル×speedをMotionに代入
scoreboard players operation @s reg1 = @s speedZ
scoreboard players operation @s reg1 *= @s speed
scoreboard players operation @s PosZ += @s reg1
execute store result entity @s Pos[2] double 0.00001 run scoreboard players get @s PosZ

#speedが離陸速度未満だったら失速タグをつける
execute if score @s[tag=!stall] speed < @s stall-speed run tag @s add stall
execute if score @s[tag=stall] speed >= @s stall-speed run tag @s remove stall

#失速してたらピッチを下げる(ピッチ速度の5分の1の速度で下がる)
execute at @s[tag=stall] run scoreboard players operation @s reg1 = @s pitch-speed
execute at @s[tag=stall] run scoreboard players operation @s reg1 /= #5 Num
execute at @s[tag=stall] run scoreboard players operation @s AngX += @s reg1

#以下条件のどれかを満たしたら墜落タグ
#パーツが3個破損　bodyが破損 aileronのどっちかが破損
tag @s[scores={aileron=..1}] add destroyed
tag @s[scores={plane-parts=..4}] add destroyed
tag @s[scores={body=..0}] add destroyed

#墜落してたらピッチを下げる(ピッチ速度の2分の1の速度で下がる)
execute at @s[tag=destroyed] run scoreboard players operation @s reg1 = @s pitch-speed
execute at @s[tag=destroyed] run scoreboard players operation @s reg1 /= #2 Num
execute at @s[tag=destroyed] run scoreboard players operation @s AngX += @s reg1

#登場者がいるか判定して、いないならピッチを下げる
execute at @s as @a[tag=plane-rider] if score @e[tag=flying-executer,limit=1,distance=..1] plane-id = @s plane-id run tag @e[tag=flying-executer,limit=1,distance=..1] add exist-rider
execute at @s[tag=!exist-rider] run scoreboard players operation @s[scores={AngX=..9000}] AngX += @s pitch-speed

#音
scoreboard players set @s[scores={sound=30..}] sound 0
execute if entity @s[scores={sound=0,speed=-1..}] at @p run playsound minecraft:plane.engine.recipro-flying ambient @a ~ ~ ~ 10 1 1
scoreboard players operation @s reg1 = #rand rand
scoreboard players operation @s reg1 %= #4 Num
scoreboard players operation @s sound += @s reg1
#tellraw @p [{"score":{"name":"@s","objective":"reg1"}}]

#飛行状態でブロックにめり込んだら爆発
execute at @s unless block ~ ~1 ~ air run playsound minecraft:entity.generic.explode ambient @a ~ ~ ~ 16 0
execute at @s unless block ~ ~1 ~ air run particle minecraft:explosion ~ ~ ~ 2 2 2 1 50 force
execute at @s unless block ~ ~1 ~ air run kill @s
execute at @s unless block ~ ~1 ~ air run kill @e[tag=plane-move-parts,distance=..20]

#登場者無しで奈落に行ったらキル
execute at @s[tag=!exist-rider] if entity @s[y=0,dy=-100] run playsound minecraft:entity.generic.explode ambient @a ~ ~ ~ 16 0
execute at @s[tag=!exist-rider] if entity @s[y=0,dy=-100] run particle minecraft:explosion ~ ~ ~ 2 2 2 1 50 force
execute at @s[tag=!exist-rider] if entity @s[y=0,dy=-100] run kill @s
execute at @s[tag=!exist-rider] if entity @s[y=0,dy=-100] run kill @e[tag=plane-move-parts,distance=..20]


#タグ解除
tag @s remove exist-rider
tag @s remove flying-executer
