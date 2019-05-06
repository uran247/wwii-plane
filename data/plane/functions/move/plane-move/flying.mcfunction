#角度/速度スコアからベクトルを計算して機体のMotionに反映する
#失速判定と墜落判定をやる
#条件:tickで実行 execute as @e[type=armor_stand,tag=plane-root,scores={speed=1..}] at @s run function plane:move/move
#実行者：機体

#実行者にタグ付け
tag @s add flying-executer

#### 基本加速量決定 reg1に代入される ####
scoreboard players set @s reg1 0
#throttle1で増
execute if entity @s[scores={throttle=1}] if score @s speed <= @s cruise-speed at @s run scoreboard players operation @s reg1 += @s accelerate
#throttle0で減
execute if entity @s[scores={throttle=0}] if score @s speed >= @s takeoff-speed at @s run scoreboard players operation @s reg1 -= @s accelerate
#throttle1で巡航速度を超えてた場合加速量を減少
execute if entity @s[scores={throttle=1}] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 = @s max-speed
execute if entity @s[scores={throttle=1}] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 -= @s speed
execute if entity @s[scores={throttle=1}] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 *= @s accelerate
execute if entity @s[scores={throttle=1}] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg2 = @s max-speed
execute if entity @s[scores={throttle=1}] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg2 -= @s cruise-speed
execute if entity @s[scores={throttle=1}] if score @s speed > @s cruise-speed at @s run scoreboard players operation @s reg1 /= @s reg2

#tellraw @a [{"text":"throttle:"},{"score":{"name":"@s","objective":"throttle"}},{"text":"#max:"},{"score":{"name":"#max","objective":"max-entity"}}]

####減速量決定　reg4に代入される ####
#基本減速量決定　現在速度÷巡航速度*減速度　下限はaccelerate+1
scoreboard players operation @s reg2 = @s cruise-speed
scoreboard players operation @s reg3 = @s speed
scoreboard players operation @s reg4 = @s deaccelerate
scoreboard players operation @s reg4 *= @s reg3
scoreboard players operation @s reg4 /= @s reg2
execute if score @s accelerate >= @s reg4 run scoreboard players operation @s reg4 = accelerate
execute if score @s accelerate >= @s reg4 run scoreboard players add @s reg4 1
#ピッチによって減速量調整
#上向きの場合y方向単位ベクトル×減速量
scoreboard players operation @s[scores={AngX=..0}] reg4 *= @s speedY
scoreboard players operation @s[scores={AngX=..0}] reg4 /= #50 Num
#下向きの場合加速、加速量は減速量/2、限度はaccelerate/2まで
scoreboard players operation @s[scores={AngX=1..}] reg4 *= #-1 Num
scoreboard players operation @s[scores={AngX=1..}] reg4 *= @s speedY
scoreboard players operation @s[scores={AngX=1..}] reg4 /= #100 Num
execute if score @s[scores={AngX=1..}] reg4 > @s accelerate run scoreboard players operation @s[scores={AngX=1..}] reg4 = @s accelerate
scoreboard players operation @s[scores={AngX=1..}] reg4 /= #-3 Num


#### speed決定 ####
#speed+reg1-reg4
scoreboard players operation @s speed += @s reg1
scoreboard players operation @s speed -= @s reg4
#speedが0未満だったら0にする
scoreboard players set @s[scores={speed=..-1}] speed 0
#speedが最高速度を超えないようにする
execute if score @s speed > @s max-speed run scoreboard players operation @s speed = @s max-speed

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
execute at @s[tag=destroyed,scores={AngX=..9000}] run scoreboard players operation @s reg1 = @s pitch-speed
execute at @s[tag=destroyed,scores={AngX=..9000}] run scoreboard players operation @s reg1 /= #2 Num
execute at @s[tag=destroyed,scores={AngX=..9000}] run scoreboard players operation @s AngX += @s reg1

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
