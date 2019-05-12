#基本減速量決定 speed*resistance/cruise-speed
#入力 #speed input, #cruise-speed input, #resistance input
#返り score #base-resistance return
scoreboard players operation #base-resistance return = #speed input
scoreboard players operation #base-resistance return *= #resistance input
scoreboard players operation #base-resistance return /= #cruise-speed input
execute if score #base-resistance return < #10 Num run scoreboard players set #base-resistance return 10
