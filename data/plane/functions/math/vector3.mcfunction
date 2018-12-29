#plane:controll/rolling経由で実行　実行者/座標はplane-root

#X軸回転のsincos計算
scoreboard players operation @s input1 = @s AngX
scoreboard players operation @s input1 *= #-1 Num
scoreboard players add @s[scores={input1=..-18000}] input1 36000
scoreboard players remove @s[scores={input1=18000..}] input1 36000
function plane:math/sin
scoreboard players operation @s sinX = @s sin
function plane:math/cos
scoreboard players operation @s cosX = @s cos

#Y軸回転のsincos計算
scoreboard players operation @s input1 = @s AngY
scoreboard players add @s[scores={input1=..-18000}] input1 36000
scoreboard players remove @s[scores={input1=18000..}] input1 36000
function plane:math/sin
scoreboard players operation @s sinY = @s sin
function plane:math/cos
scoreboard players operation @s cosY = @s cos

#実行者と同一スコアのindicator取得
#tag @s add vector-executer
#execute as @e[tag=plane-indicator] if score @s plane-id = @e[tag=vector-executer,distance=..1,limit=1] plane-id run tag @s add vector-target

#Z軸回転のsincos計算
scoreboard players operation @s input1 = @s AngZ
scoreboard players operation @s input1 *= #-1 Num
scoreboard players add @s[scores={input1=..-18000}] input1 36000
scoreboard players remove @s[scores={input1=18000..}] input1 36000
function plane:math/sin
scoreboard players operation @s sinZ = @s sin
function plane:math/cos
scoreboard players operation @s cosZ = @s cos

#各sin,cosからxベクトル算出
scoreboard players operation @s speedX = @s cosX
scoreboard players operation @s speedX *= @s sinY
scoreboard players operation @s reg1 = @s cosY
scoreboard players operation @s reg1 *= @s sinX
scoreboard players operation @s reg1 *= @s sinZ
scoreboard players operation @s reg1 /= #1000 Num
scoreboard players operation @s speedX += @s reg1

#各sin,cosからyベクトル算出
scoreboard players operation @s speedY = @s cosZ
scoreboard players operation @s speedY *= @s sinX
scoreboard players operation @s speedY *= #-1 Num

#各sin,cosからzベクトル算出
scoreboard players operation @s speedZ = @s cosX
scoreboard players operation @s speedZ *= @s cosY
scoreboard players operation @s reg1 = @s sinX
scoreboard players operation @s reg1 *= @s sinY
scoreboard players operation @s reg1 *= @s sinZ
scoreboard players operation @s reg1 /= #1000 Num
scoreboard players operation @s speedZ -= @s reg1

#速度を正規化する
scoreboard players operation @s speedX /= #-10000 Num
scoreboard players operation @s speedY /= #-10000 Num
scoreboard players operation @s speedZ /= #10000 Num

#移動量を出す
scoreboard players operation @s travelX = @s speedX
scoreboard players operation @s travelY = @s speedY
scoreboard players operation @s travelZ = @s speedZ
scoreboard players operation @s travelX *= @s speed
scoreboard players operation @s travelY *= @s speed
scoreboard players operation @s travelZ *= @s speed

tellraw @a [{"text":"travelX:"},{"score":{"name":"@s","objective":"travelX"}},{"text":"travelY:"},{"score":{"name":"@s","objective":"travelY"}},{"text":"travelZ:"},{"score":{"name":"@s","objective":"travelZ"}}]

#タグ解除
#tag @s remove vector-executer
#tag @e[tag=vector-target] remove vector-target
