#plane:weapon/***経由で実行　実行者/座標はplane-root
#input2:xベクトル　input3:yベクトル　input4:zベクトル
#inputはブロック数×10
#ベクトルを計算
#output2,3,4に結果を返す

#X軸回転のsincos計算
scoreboard players operation @s input1 = @s AngX
scoreboard players operation @s input1 *= #-1 Num
scoreboard players add @s[scores={input1=..-180}] input1 360
scoreboard players remove @s[scores={input1=180..}] input1 360
function plane:math/sin
scoreboard players operation @s sinX = @s sin
function plane:math/cos
scoreboard players operation @s cosX = @s cos

#Y軸回転のsincos計算
scoreboard players operation @s input1 = @s AngY
scoreboard players add @s[scores={input1=..-180}] input1 360
scoreboard players remove @s[scores={input1=180..}] input1 360
function plane:math/sin
scoreboard players operation @s sinY = @s sin
function plane:math/cos
scoreboard players operation @s cosY = @s cos

#Z軸回転のsincos計算
scoreboard players operation @s input1 = @s AngZ
scoreboard players operation @s input1 *= #-1 Num
scoreboard players add @s[scores={input1=..-180}] input1 360
scoreboard players remove @s[scores={input1=180..}] input1 360
function plane:math/sin
scoreboard players operation @s sinZ = @s sin
function plane:math/cos
scoreboard players operation @s cosZ = @s cos

#X軸に沿って回転
scoreboard players operation @s output2 = @s input2
scoreboard players operation @s output3 = @s input3

scoreboard players operation @s output2 *= #1000 Num

scoreboard players operation @s output3 *= @s cosX
scoreboard players operation @s reg4 = @s input4
scoreboard players operation @s reg4 *= @s sinX
scoreboard players operation @s output3 -= @s reg4
#scoreboard players operation @s output2 /= #100 Num

scoreboard players operation @s output4 = @s input3
scoreboard players operation @s output4 *= @s sinX
scoreboard players operation @s reg4 = @s input4
scoreboard players operation @s reg4 *= @s cosX
scoreboard players operation @s output4 += @s reg4
#scoreboard players operation @s output3 /= #100 Num

#Z軸に沿って回転
scoreboard players operation @s reg5 = @s output2
scoreboard players operation @s reg6 = @s output3

scoreboard players operation @s output2 *= @s cosZ
scoreboard players operation @s reg3 = @s reg6
scoreboard players operation @s reg3 *= @s sinZ
scoreboard players operation @s output2 -= @s reg3

scoreboard players operation @s output3 *= @s cosZ
scoreboard players operation @s reg2 = @s reg5
scoreboard players operation @s reg2 *= @s sinZ
scoreboard players operation @s output3 += @s reg2

scoreboard players operation @s output4 *= #1000 Num
#tellraw @a [{"text":"output2:"},{"score":{"name":"@s","objective":"output2"}},{"text":"output3:"},{"score":{"name":"@s","objective":"output3"}},{"text":"output4:"},{"score":{"name":"@s","objective":"output4"}}]

#オーバーフロー防止処理
scoreboard players operation @s output2 /= #1000 Num
scoreboard players operation @s output3 /= #-1000 Num
scoreboard players operation @s output4 /= #1000 Num

#Y軸に沿って回転
scoreboard players operation @s reg5 = @s output2
scoreboard players operation @s reg7 = @s output4

scoreboard players operation @s output2 *= @s cosY
scoreboard players operation @s reg4 = @s reg7
scoreboard players operation @s reg4 *= @s sinY
scoreboard players operation @s output2 += @s reg4

scoreboard players operation @s output3 *= #1000 Num

scoreboard players operation @s output4 *= @s cosY
scoreboard players operation @s reg2 = @s reg5
scoreboard players operation @s reg2 *= @s sinY
scoreboard players operation @s output4 -= @s reg2

#X軸補正&桁落とし
scoreboard players operation @s output2 /= #-1000 Num
scoreboard players operation @s output3 /= #1000 Num
scoreboard players operation @s output4 /= #1000 Num


#tellraw @a [{"text":"output2:"},{"score":{"name":"@s","objective":"output2"}},{"text":"output3:"},{"score":{"name":"@s","objective":"output3"}},{"text":"output4:"},{"score":{"name":"@s","objective":"output4"}}]


#タグ解除
#tag @s remove vector-executer
#tag @e[tag=vector-target] remove vector-target
