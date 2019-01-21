#オフセット位置を計算
#実行方法:xxx-positionから実行
#実行者：パーツ　実行位置：パーツ

#三角関数計算
function plane:math/sin
function plane:math/cos

#スコアリセット
scoreboard players set @s reg1 0
scoreboard players set @s reg2 0
scoreboard players set @s reg3 0
scoreboard players set @s reg4 0
scoreboard players set @s reg5 0
scoreboard players set @s reg6 0
scoreboard players set @s reg7 0
scoreboard players set @s reg8 0
scoreboard players set @s reg9 0
scoreboard players set @s reg10 0
scoreboard players set @s reg11 0
scoreboard players set @s reg12 0
scoreboard players set @s reg13 0
scoreboard players set @s reg14 0
scoreboard players set @s reg15 0

#座標取得
execute store result score @s reg1 run data get entity @s Pos[0] 100
execute store result score @s reg2 run data get entity @s Pos[1] 100
execute store result score @s reg3 run data get entity @s Pos[2] 100
#tellraw @a [{"text":"X: "},{"score":{"name":"@s","objective":"reg1"}},{"text":"Y: "},{"score":{"name":"@s","objective":"reg2"}},{"text":"Z: "},{"score":{"name":"@s","objective":"reg3"}},{"text":"cos: "},{"score":{"name":"@s","objective":"cos"}}]


#X方向の単位ベクトル算出
summon minecraft:area_effect_cloud ^1 ^ ^ {Tags:[indicatorX]}
summon minecraft:area_effect_cloud ^ ^1 ^ {Tags:[indicatorY]}

execute store result score @s reg4 run data get entity @e[type=minecraft:area_effect_cloud,tag=indicatorX,limit=1,sort=nearest] Pos[0] 100
execute store result score @s reg5 run data get entity @e[type=minecraft:area_effect_cloud,tag=indicatorX,limit=1,sort=nearest] Pos[1] 100
execute store result score @s reg6 run data get entity @e[type=minecraft:area_effect_cloud,tag=indicatorX,limit=1,sort=nearest] Pos[2] 100
scoreboard players operation @s reg4 -= @s reg1
scoreboard players operation @s reg5 -= @s reg2
scoreboard players operation @s reg6 -= @s reg3
scoreboard players operation @s reg10 = @s reg4
scoreboard players operation @s reg11 = @s reg5
scoreboard players operation @s reg12 = @s reg6
scoreboard players operation @s reg4 *= @s cos
scoreboard players operation @s reg5 *= @s cos
scoreboard players operation @s reg6 *= @s cos
scoreboard players operation @s reg4 /= #1000 Num
scoreboard players operation @s reg5 /= #1000 Num
scoreboard players operation @s reg6 /= #1000 Num


execute store result score @s reg7 run data get entity @e[type=minecraft:area_effect_cloud,tag=indicatorY,limit=1,sort=nearest] Pos[0] 100
execute store result score @s reg8 run data get entity @e[type=minecraft:area_effect_cloud,tag=indicatorY,limit=1,sort=nearest] Pos[1] 100
execute store result score @s reg9 run data get entity @e[type=minecraft:area_effect_cloud,tag=indicatorY,limit=1,sort=nearest] Pos[2] 100
scoreboard players operation @s reg7 -= @s reg1
scoreboard players operation @s reg8 -= @s reg2
scoreboard players operation @s reg9 -= @s reg3
scoreboard players operation @s reg13 = @s reg7
scoreboard players operation @s reg14 = @s reg8
scoreboard players operation @s reg15 = @s reg9
scoreboard players operation @s reg7 *= @s sin
scoreboard players operation @s reg8 *= @s sin
scoreboard players operation @s reg9 *= @s sin
scoreboard players operation @s reg7 /= #1000 Num
scoreboard players operation @s reg8 /= #1000 Num
scoreboard players operation @s reg9 /= #1000 Num

scoreboard players operation @s reg4 *= @s offsetX
scoreboard players operation @s reg5 *= @s offsetX
scoreboard players operation @s reg6 *= @s offsetX
scoreboard players operation @s reg7 *= @s offsetX
scoreboard players operation @s reg8 *= @s offsetX
scoreboard players operation @s reg9 *= @s offsetX

#tellraw @a [{"text":"X1: "},{"score":{"name":"@s","objective":"reg4"}},{"text":"Y1: "},{"score":{"name":"@s","objective":"reg5"}},{"text":"Z1: "},{"score":{"name":"@s","objective":"reg6"}}]
#tellraw @a [{"text":"X2: "},{"score":{"name":"@s","objective":"reg7"}},{"text":"Y2: "},{"score":{"name":"@s","objective":"reg8"}},{"text":"Z2: "},{"score":{"name":"@s","objective":"reg9"}}]

#Y方向の単位ベクトル算出
scoreboard players operation @s reg10 *= @s sin
scoreboard players operation @s reg11 *= @s sin
scoreboard players operation @s reg12 *= @s sin
scoreboard players operation @s reg10 /= #1000 Num
scoreboard players operation @s reg11 /= #1000 Num
scoreboard players operation @s reg12 /= #1000 Num

scoreboard players operation @s reg13 *= @s cos
scoreboard players operation @s reg14 *= @s cos
scoreboard players operation @s reg15 *= @s cos
scoreboard players operation @s reg13 /= #1000 Num
scoreboard players operation @s reg14 /= #1000 Num
scoreboard players operation @s reg15 /= #1000 Num

scoreboard players operation @s reg10 *= @s offsetY
scoreboard players operation @s reg11 *= @s offsetY
scoreboard players operation @s reg12 *= @s offsetY
scoreboard players operation @s reg13 *= @s offsetY
scoreboard players operation @s reg14 *= @s offsetY
scoreboard players operation @s reg15 *= @s offsetY



#座標計算
#tellraw @a [{"text":"X: "},{"score":{"name":"@s","objective":"reg1"}},{"text":"Y: "},{"score":{"name":"@s","objective":"reg2"}},{"text":"Z: "},{"score":{"name":"@s","objective":"reg3"}}]

scoreboard players operation @s reg1 *= #1000 Num
scoreboard players operation @s reg2 *= #1000 Num
scoreboard players operation @s reg3 *= #1000 Num



scoreboard players operation @s reg1 += @s reg4
scoreboard players operation @s reg2 += @s reg5
scoreboard players operation @s reg3 += @s reg6
scoreboard players operation @s reg1 += @s reg7
scoreboard players operation @s reg2 += @s reg8
scoreboard players operation @s reg3 += @s reg9
scoreboard players operation @s reg1 += @s reg10
scoreboard players operation @s reg2 += @s reg11
scoreboard players operation @s reg3 += @s reg12
scoreboard players operation @s reg1 -= @s reg13
scoreboard players operation @s reg2 -= @s reg14
scoreboard players operation @s reg3 -= @s reg15


#tellraw @a [{"text":"X: "},{"score":{"name":"@s","objective":"reg1"}},{"text":"Y: "},{"score":{"name":"@s","objective":"reg2"}},{"text":"Z: "},{"score":{"name":"@s","objective":"reg3"}}]
#tellraw @a [{"text":"X: "},{"score":{"name":"@s","objective":"reg1"}},{"text":"Y: "},{"score":{"name":"@s","objective":"reg2"}},{"text":"Z: "},{"score":{"name":"@s","objective":"reg3"}}]

#移動
execute store result entity @s Pos[0] double 0.00001 run scoreboard players get @s reg1
execute store result entity @s Pos[1] double 0.00001 run scoreboard players get @s reg2
execute store result entity @s Pos[2] double 0.00001 run scoreboard players get @s reg3

#後処理

