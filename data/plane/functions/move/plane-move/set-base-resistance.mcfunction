#基本減速量決定 speed*resistance/cruise-speed
#入力 #speed input, #cruise-speed input, #resistance input
#返り score #base-resistance return
scoreboard players operation #base-resistance return = #speed input
scoreboard players operation #base-resistance return *= #resistance input
scoreboard players operation #base-resistance return /= #cruise-speed input
scoreboard players operation #min-registance reg1 = #resistance input
scoreboard players operation #min-registance reg1 /= #2 Num
execute if score #base-resistance return < #min-registance reg1 run scoreboard players operation #base-resistance return = #min-registance reg1
