#plane:weapon/***経由で実行　実行者/座標はplane-root
#input2:xベクトル　input3:yベクトル　input4:zベクトル
#inputはブロック数×10
#ベクトルを計算
#output2,3,4に結果を返す

#実行者の現在座標取得
execute store result score @s reg1 run data get entity @s Pos[0] 100
execute store result score @s reg2 run data get entity @s Pos[1] 100
execute store result score @s reg3 run data get entity @s Pos[2] 100

#向いてる方向にAEC召喚
summon area_effect_cloud ^ ^ ^1 {Particle:"ambient_entity_effect",Duration:1,Tags:[weapon-indicator1]}
summon area_effect_cloud ^1 ^ ^ {Particle:"ambient_entity_effect",Duration:1,Tags:[weapon-indicator2]}
summon area_effect_cloud ^ ^1 ^ {Particle:"ambient_entity_effect",Duration:1,Tags:[weapon-indicator3]}

#AECの現在座標取得
execute store result score @s output2 run data get entity @e[tag=weapon-indicator1,limit=1,distance=..1.5] Pos[0] 100
execute store result score @s output3 run data get entity @e[tag=weapon-indicator1,limit=1,distance=..1.5] Pos[1] 100
execute store result score @s output4 run data get entity @e[tag=weapon-indicator1,limit=1,distance=..1.5] Pos[2] 100
execute store result score @s reg4 run data get entity @e[tag=weapon-indicator2,limit=1,distance=..1.5] Pos[0] 100
execute store result score @s reg5 run data get entity @e[tag=weapon-indicator2,limit=1,distance=..1.5] Pos[1] 100
execute store result score @s reg6 run data get entity @e[tag=weapon-indicator2,limit=1,distance=..1.5] Pos[2] 100
execute store result score @s reg7 run data get entity @e[tag=weapon-indicator3,limit=1,distance=..1.5] Pos[0] 100
execute store result score @s reg8 run data get entity @e[tag=weapon-indicator3,limit=1,distance=..1.5] Pos[1] 100
execute store result score @s reg9 run data get entity @e[tag=weapon-indicator3,limit=1,distance=..1.5] Pos[2] 100

#単位ベクトル算出
scoreboard players operation @s output2 -= @s reg1
scoreboard players operation @s output3 -= @s reg2
scoreboard players operation @s output4 -= @s reg3
scoreboard players operation @s reg4 -= @s reg1
scoreboard players operation @s reg5 -= @s reg2
scoreboard players operation @s reg6 -= @s reg3
scoreboard players operation @s reg7 -= @s reg1
scoreboard players operation @s reg8 -= @s reg2
scoreboard players operation @s reg9 -= @s reg3

#Z軸回転のsincos計算
scoreboard players operation @s input1 = @s AngZ
scoreboard players operation @s input1 *= #-1 Num
scoreboard players add @s[scores={input1=..-180}] input1 360
scoreboard players remove @s[scores={input1=180..}] input1 360
function plane:math/sin
scoreboard players operation @s sinZ = @s sin
function plane:math/cos
scoreboard players operation @s cosZ = @s cos


#Xベクトルを変換
scoreboard players operation @s reg10 = @s reg4
scoreboard players operation @s reg11 = @s reg5
scoreboard players operation @s reg12 = @s reg6
scoreboard players operation @s reg13 = @s reg7
scoreboard players operation @s reg14 = @s reg8
scoreboard players operation @s reg15 = @s reg9

scoreboard players operation @s reg10 *= @s cosZ
scoreboard players operation @s reg11 *= @s cosZ
scoreboard players operation @s reg12 *= @s cosZ
scoreboard players operation @s reg13 *= @s sinZ
scoreboard players operation @s reg14 *= @s sinZ
scoreboard players operation @s reg15 *= @s sinZ

scoreboard players operation @s reg10 += @s reg13
scoreboard players operation @s reg11 += @s reg14
scoreboard players operation @s reg12 += @s reg15
scoreboard players operation @s reg10 *= @s input2
scoreboard players operation @s reg11 *= @s input2
scoreboard players operation @s reg12 *= @s input2


#Yベクトルを変換
scoreboard players operation @s reg16 = @s reg4
scoreboard players operation @s reg17 = @s reg5
scoreboard players operation @s reg18 = @s reg6
scoreboard players operation @s reg19 = @s reg7
scoreboard players operation @s reg20 = @s reg8
scoreboard players operation @s reg21 = @s reg9

scoreboard players operation @s reg19 *= @s cosZ
scoreboard players operation @s reg20 *= @s cosZ
scoreboard players operation @s reg21 *= @s cosZ
scoreboard players operation @s reg16 *= @s sinZ
scoreboard players operation @s reg17 *= @s sinZ
scoreboard players operation @s reg18 *= @s sinZ

scoreboard players operation @s reg16 += @s reg19
scoreboard players operation @s reg17 += @s reg20
scoreboard players operation @s reg18 += @s reg21
scoreboard players operation @s reg16 *= @s input3
scoreboard players operation @s reg17 *= @s input3
scoreboard players operation @s reg18 *= @s input3


#Zベクトルを変換
scoreboard players operation @s output2 *= #1000 Num
scoreboard players operation @s output3 *= @s cosZ
scoreboard players operation @s output4 *= #1000 Num
scoreboard players operation @s reg4 *= @s sinZ
scoreboard players operation @s reg5 *= @s sinZ
scoreboard players operation @s reg6 *= @s sinZ
scoreboard players operation @s output2 += @s reg4
scoreboard players operation @s output3 += @s reg5
scoreboard players operation @s output4 += @s reg6
scoreboard players operation @s output2 *= @s input4
scoreboard players operation @s output3 *= @s input4
scoreboard players operation @s output4 *= @s input4
#tellraw @a [{"text":"output2:"},{"score":{"name":"@s","objective":"output2"}},{"text":"output3:"},{"score":{"name":"@s","objective":"output3"}},{"text":"output4:"},{"score":{"name":"@s","objective":"output4"}}]

#ベクトル合成
scoreboard players operation @s output2 += @s reg10
scoreboard players operation @s output3 += @s reg11
scoreboard players operation @s output4 += @s reg12
scoreboard players operation @s output2 += @s reg16
scoreboard players operation @s output3 += @s reg17
scoreboard players operation @s output4 += @s reg18


#オーバーフロー防止処理
scoreboard players operation @s output2 /= #100 Num
scoreboard players operation @s output3 /= #100 Num
scoreboard players operation @s output4 /= #100 Num



#tellraw @a [{"text":"output2:"},{"score":{"name":"@s","objective":"output2"}},{"text":"output3:"},{"score":{"name":"@s","objective":"output3"}},{"text":"output4:"},{"score":{"name":"@s","objective":"output4"}}]


#タグ解除
#tag @s remove vector-executer
#tag @e[tag=vector-target] remove vector-target
