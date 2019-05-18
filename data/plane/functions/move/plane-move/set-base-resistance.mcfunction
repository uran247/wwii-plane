#基本減速量決定 speed*resistance/cruise-speed
#入力 #speed input, #cruise-speed input, #resistance input, #ang-z input
#返り score #base-resistance return
scoreboard players operation #base-resistance return = #speed input
scoreboard players operation #base-resistance return *= #resistance input
scoreboard players operation #base-resistance return /= #cruise-speed input

execute if score #ang-z input > #0 Num run scoreboard players operation #additional-resistance reg1 = #resistance input
execute if score #ang-z input > #0 Num run scoreboard players operation #additional-resistance reg1 *= #80 Num
execute if score #ang-z input > #0 Num run scoreboard players operation #additional-resistance reg1 *= #ang-z input
execute if score #ang-z input > #0 Num run scoreboard players operation #additional-resistance reg1 /= #900000 Num
execute if score #ang-z input > #0 Num run scoreboard players operation #base-resistance return += #additional-resistance reg1

scoreboard players operation #min-registance reg1 = #resistance input
scoreboard players operation #min-registance reg1 /= #2 Num
execute if score #base-resistance return < #min-registance reg1 run scoreboard players operation #base-resistance return = #min-registance reg1
