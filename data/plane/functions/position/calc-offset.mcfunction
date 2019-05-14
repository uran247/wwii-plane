#オフセット位置を計算
#実行方法:xxx-positionから実行
#実行者：パーツ　実行位置：パーツ

#三角関数計算
function math:sin
function math:cos

#スコアリセット
scoreboard players set #offset-x reg1 0
scoreboard players set #offset-y reg1 0
scoreboard players set #offset-z reg1 0
scoreboard players set #x-direction-dx reg1 0
scoreboard players set #x-direction-dy reg1 0
scoreboard players set #x-direction-dz reg1 0
scoreboard players set #y-direction-dx reg1 0
scoreboard players set #y-direction-dy reg1 0
scoreboard players set #y-direction-dz reg1 0
scoreboard players set #x-direction-unit-vector-x reg1 0
scoreboard players set #x-direction-unit-vector-y reg1 0
scoreboard players set #x-direction-unit-vector-z reg1 0
scoreboard players set #y-direction-unit-vector-x reg1 0
scoreboard players set #y-direction-unit-vector-y reg1 0
scoreboard players set #y-direction-unit-vector-z reg1 0

#座標取得
execute store result score #offset-x reg1 run data get entity @s Pos[0] 100
execute store result score #offset-y reg1 run data get entity @s Pos[1] 100
execute store result score #offset-z reg1 run data get entity @s Pos[2] 100

#X方向の単位ベクトル算出
tp 0-0-1-0-0 ^1 ^ ^
tp 0-0-2-0-0 ^ ^1 ^

execute store result score #x-direction-dx reg1 run data get entity 0-0-1-0-0 Pos[0] 100
execute store result score #x-direction-dy reg1 run data get entity 0-0-1-0-0 Pos[1] 100
execute store result score #x-direction-dz reg1 run data get entity 0-0-1-0-0 Pos[2] 100
scoreboard players operation #x-direction-dx reg1 -= #offset-x reg1
scoreboard players operation #x-direction-dy reg1 -= #offset-y reg1
scoreboard players operation #x-direction-dz reg1 -= #offset-z reg1
scoreboard players operation #x-direction-unit-vector-x reg1 = #x-direction-dx reg1
scoreboard players operation #x-direction-unit-vector-y reg1 = #x-direction-dy reg1
scoreboard players operation #x-direction-unit-vector-z reg1 = #x-direction-dz reg1
scoreboard players operation #x-direction-dx reg1 *= @s cos
scoreboard players operation #x-direction-dy reg1 *= @s cos
scoreboard players operation #x-direction-dz reg1 *= @s cos
scoreboard players operation #x-direction-dx reg1 /= #1000 Num
scoreboard players operation #x-direction-dy reg1 /= #1000 Num
scoreboard players operation #x-direction-dz reg1 /= #1000 Num

execute store result score #y-direction-dx reg1 run data get entity 0-0-2-0-0 Pos[0] 100
execute store result score #y-direction-dy reg1 run data get entity 0-0-2-0-0 Pos[1] 100
execute store result score #y-direction-dz reg1 run data get entity 0-0-2-0-0 Pos[2] 100
scoreboard players operation #y-direction-dx reg1 -= #offset-x reg1
scoreboard players operation #y-direction-dy reg1 -= #offset-y reg1
scoreboard players operation #y-direction-dz reg1 -= #offset-z reg1
scoreboard players operation #y-direction-unit-vector-x reg1 = #y-direction-dx reg1
scoreboard players operation #y-direction-unit-vector-y reg1 = #y-direction-dy reg1
scoreboard players operation #y-direction-unit-vector-z reg1 = #y-direction-dz reg1
scoreboard players operation #y-direction-dx reg1 *= @s sin
scoreboard players operation #y-direction-dy reg1 *= @s sin
scoreboard players operation #y-direction-dz reg1 *= @s sin
scoreboard players operation #y-direction-dx reg1 /= #1000 Num
scoreboard players operation #y-direction-dy reg1 /= #1000 Num
scoreboard players operation #y-direction-dz reg1 /= #1000 Num

scoreboard players operation #x-direction-dx reg1 *= @s offsetX
scoreboard players operation #x-direction-dy reg1 *= @s offsetX
scoreboard players operation #x-direction-dz reg1 *= @s offsetX
scoreboard players operation #y-direction-dx reg1 *= @s offsetX
scoreboard players operation #y-direction-dy reg1 *= @s offsetX
scoreboard players operation #y-direction-dz reg1 *= @s offsetX

#Y方向の単位ベクトル算出
scoreboard players operation #x-direction-unit-vector-x reg1 *= @s sin
scoreboard players operation #x-direction-unit-vector-y reg1 *= @s sin
scoreboard players operation #x-direction-unit-vector-z reg1 *= @s sin
scoreboard players operation #x-direction-unit-vector-x reg1 /= #1000 Num
scoreboard players operation #x-direction-unit-vector-y reg1 /= #1000 Num
scoreboard players operation #x-direction-unit-vector-z reg1 /= #1000 Num

scoreboard players operation #y-direction-unit-vector-x reg1 *= @s cos
scoreboard players operation #y-direction-unit-vector-y reg1 *= @s cos
scoreboard players operation #y-direction-unit-vector-z reg1 *= @s cos
scoreboard players operation #y-direction-unit-vector-x reg1 /= #1000 Num
scoreboard players operation #y-direction-unit-vector-y reg1 /= #1000 Num
scoreboard players operation #y-direction-unit-vector-z reg1 /= #1000 Num

scoreboard players operation #x-direction-unit-vector-x reg1 *= @s offsetY
scoreboard players operation #x-direction-unit-vector-y reg1 *= @s offsetY
scoreboard players operation #x-direction-unit-vector-z reg1 *= @s offsetY
scoreboard players operation #y-direction-unit-vector-x reg1 *= @s offsetY
scoreboard players operation #y-direction-unit-vector-y reg1 *= @s offsetY
scoreboard players operation #y-direction-unit-vector-z reg1 *= @s offsetY

#座標計算
scoreboard players operation #offset-x reg1 *= #1000 Num
scoreboard players operation #offset-y reg1 *= #1000 Num
scoreboard players operation #offset-z reg1 *= #1000 Num

scoreboard players operation #offset-x reg1 += #x-direction-dx reg1
scoreboard players operation #offset-y reg1 += #x-direction-dy reg1
scoreboard players operation #offset-z reg1 += #x-direction-dz reg1
scoreboard players operation #offset-x reg1 += #y-direction-dx reg1
scoreboard players operation #offset-y reg1 += #y-direction-dy reg1
scoreboard players operation #offset-z reg1 += #y-direction-dz reg1
scoreboard players operation #offset-x reg1 += #x-direction-unit-vector-x reg1
scoreboard players operation #offset-y reg1 += #x-direction-unit-vector-y reg1
scoreboard players operation #offset-z reg1 += #x-direction-unit-vector-z reg1
scoreboard players operation #offset-x reg1 -= #y-direction-unit-vector-x reg1
scoreboard players operation #offset-y reg1 -= #y-direction-unit-vector-y reg1
scoreboard players operation #offset-z reg1 -= #y-direction-unit-vector-z reg1

#底面をベースにするタグがついてた場合、底面が腕の高さに来るように補正
execute if entity @s[tag=offset-base] run scoreboard players operation #offset-y reg1 += #150000 Num

#移動
execute store result entity @s Pos[0] double 0.00001 run scoreboard players get #offset-x reg1
execute store result entity @s Pos[1] double 0.00001 run scoreboard players get #offset-y reg1
execute store result entity @s Pos[2] double 0.00001 run scoreboard players get #offset-z reg1

#後処理
tp 0-0-1-0-0 0 1 0
tp 0-0-2-0-0 0 1 0

