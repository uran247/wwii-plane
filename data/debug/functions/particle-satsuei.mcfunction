execute as 0-0-a-0-0 run scoreboard players set @s offsetX -0
execute as 0-0-a-0-0 run scoreboard players set @s offsetY 80
execute as 0-0-a-0-0 run scoreboard players set @s offsetZ 5500
execute as 0-0-a-0-0 run tag @s add offset-base
scoreboard players operation 0-0-a-0-0 input1 = @s AngZ
tp 0-0-a-0-0 ^ ^ ^

execute as 0-0-a-0-0 at @s rotated ~-90 ~ run function plane:position/calc-offset

#execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-1 ^ ^ run particle minecraft:flame ~ ~-0.4 ~ 0.01 0.01 0.01 0 1 force
#execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-1.1 ^ ^ run particle minecraft:flame ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-1.2 ^ ^ run particle minecraft:flame ~ ~-0.35 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-1.3 ^ ^ run particle minecraft:flame ~ ~-0.35 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-1.5 ^ ^ run particle minecraft:dust 1 1 1 0.8 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-1.7 ^ ^ run particle minecraft:dust 1 1 1 0.82 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-1.9 ^ ^ run particle minecraft:dust 1 1 1 0.84 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-2.1 ^ ^ run particle minecraft:dust 1 1 1 0.86 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-2.3 ^ ^ run particle minecraft:dust 1 1 1 0.88 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-2.5 ^ ^ run particle minecraft:dust 1 1 1 0.90 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-2.7 ^ ^ run particle minecraft:dust 1 1 1 0.92 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-2.9 ^ ^ run particle minecraft:dust 1 1 1 0.94 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-3.1 ^ ^ run particle minecraft:dust 1 1 1 0.96 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-3.3 ^ ^ run particle minecraft:dust 1 1 1 0.98 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-3.5 ^ ^ run particle minecraft:dust 1 1 1 1 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-3.7 ^ ^ run particle minecraft:dust 1 1 1 1.02 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-3.9 ^ ^ run particle minecraft:dust 1 1 1 1.04 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-4.1 ^ ^ run particle minecraft:dust 1 1 1 1.06 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-4.3 ^ ^ run particle minecraft:dust 1 1 1 1.08 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-4.5 ^ ^ run particle minecraft:dust 1 1 1 1.1 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-4.7 ^ ^ run particle minecraft:dust 1 1 1 1.12 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-4.9 ^ ^ run particle minecraft:dust 1 1 1 1.14 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-5.1 ^ ^ run particle minecraft:dust 1 1 1 1.16 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-5.3 ^ ^ run particle minecraft:dust 1 1 1 1.18 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-5.5 ^ ^ run particle minecraft:dust 1 1 1 1.2 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-5.7 ^ ^ run particle minecraft:dust 1 1 1 1.22 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-5.9 ^ ^ run particle minecraft:dust 1 1 1 1.24 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-6.1 ^ ^ run particle minecraft:dust 1 1 1 1.26 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-6.3 ^ ^ run particle minecraft:dust 1 1 1 1.28 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-6.5 ^ ^ run particle minecraft:dust 1 1 1 1.30 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-6.7 ^ ^ run particle minecraft:dust 1 1 1 1.32 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-6.9 ^ ^ run particle minecraft:dust 1 1 1 1.34 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-7.1 ^ ^ run particle minecraft:dust 1 1 1 1.36 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-7.3 ^ ^ run particle minecraft:dust 1 1 1 1.38 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-7.5 ^ ^ run particle minecraft:dust 1 1 1 1.40 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-7.7 ^ ^ run particle minecraft:dust 1 1 1 1.42 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-7.9 ^ ^ run particle minecraft:dust 1 1 1 1.44 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-8.1 ^ ^ run particle minecraft:dust 1 1 1 1.46 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-8.3 ^ ^ run particle minecraft:dust 1 1 1 1.48 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-8.5 ^ ^ run particle minecraft:dust 1 1 1 1.50 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-8.7 ^ ^ run particle minecraft:dust 1 1 1 1.52 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-8.9 ^ ^ run particle minecraft:dust 1 1 1 1.54 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-9.1 ^ ^ run particle minecraft:dust 1 1 1 1.56 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-9.3 ^ ^ run particle minecraft:dust 1 1 1 1.58 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-9.5 ^ ^ run particle minecraft:dust 1 1 1 1.6 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-9.7 ^ ^ run particle minecraft:dust 1 1 1 1.62 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-9.9 ^ ^ run particle minecraft:dust 1 1 1 1.64 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-10.1 ^ ^ run particle minecraft:dust 1 1 1 1.66 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-10.3 ^ ^ run particle minecraft:dust 1 1 1 1.68 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-10.5 ^ ^ run particle minecraft:dust 1 1 1 1.70 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-10.7 ^ ^ run particle minecraft:dust 1 1 1 1.72 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-10.9 ^ ^ run particle minecraft:dust 1 1 1 1.74 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-11.1 ^ ^ run particle minecraft:dust 1 1 1 1.76 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-11.3 ^ ^ run particle minecraft:dust 1 1 1 1.78 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-11.5 ^ ^ run particle minecraft:dust 1 1 1 1.80 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-11.7 ^ ^ run particle minecraft:dust 1 1 1 1.82 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force
execute at @e[tag=!plane,tag=plane-missile] anchored eyes positioned ^-11.9 ^ ^ run particle minecraft:dust 1 1 1 1.84 ~ ~-0.4 ~ 0.01 0.01 0.01 0 2 force

#execute at 0-0-a-0-0 run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force

tp 0-0-a-0-0 0 1 0
execute as 0-0-a-0-0 run tag @s remove offset-base
