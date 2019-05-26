#対空砲召喚&定位置へ移動
summon minecraft:armor_stand 0 0 0 {Invisible:1,Tags:[enemy-target,enemy-base,entity-nohit],HandItems:[{id:"minecraft:snowball",Count:1b,tag:{BaseHP:20000}},{}]}

#game-idを付与
execute as @e[tag=enemy-base,x=0,y=0,z=0] store result score @s game-id run scoreboard players get #global game-id

#設置場所へ移動
tp @e[tag=enemy-base,x=0,y=0,z=0] -1877 97 -2084
