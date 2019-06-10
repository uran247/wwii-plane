#phantom1を10匹召喚
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}
summon minecraft:armor_stand 0 1 0 {Tags:[phantom1-seed,mob-seed],Invisible:1,NoGravity:1}

#UUIDから乱数生成(0-150)
execute positioned 0 1 0 as @e[tag=phantom1-seed,distance=..10] store result score @s reg1 run data get entity @s UUIDMost 0.000000000233
execute positioned 0 1 0 run scoreboard players operation @e[tag=phantom1-seed,distance=..10,scores={reg=..-1}] reg1 *= #-1 Num
execute positioned 0 1 0 run scoreboard players operation @e[tag=phantom1-seed,distance=..10] reg1 %= #150 Num
execute positioned 0 1 0 run scoreboard players add @e[tag=phantom1-seed,distance=..10] reg1 105

#拡散
execute positioned 0 1 0 run spreadplayers -1888 -2112 0 160 false @e[tag=phantom1-seed,distance=..1000]

#高さ調整
execute as @e[tag=phantom1-seed] store result entity @s Pos[1] double 1 run scoreboard players get @s reg1
