#スポナー召喚
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner
execute positioned 0 1 0 run function mob:summon/phantom1-spawner

#targetタグ付与
execute positioned 0 1 0 as @e[tag=game-spawner,distance=..10] run tag @s add enemy-target

#game-idを付与
execute positioned 0 1 0 as @e[tag=game-spawner,distance=..10] store result score @s game-id run scoreboard players get #global game-id

#UUIDから乱数生成(0-150)
execute positioned 0 1 0 as @e[tag=game-spawner,distance=..10] store result score @s reg1 run data get entity @s UUIDMost 0.0000000003
execute positioned 0 1 0 run scoreboard players operation @e[tag=game-spawner,distance=..10,scores={reg=..-1}] reg1 *= #-1 Num
execute positioned 0 1 0 run scoreboard players operation @e[tag=game-spawner,distance=..10] reg1 %= #150 Num
execute positioned 0 1 0 run scoreboard players add @e[tag=game-spawner,distance=..10] reg1 105

#拡散
execute positioned 0 1 0 run spreadplayers -1888 -2112 0 160 false @e[tag=game-spawner,distance=..10]

#高さ調整
execute as @e[tag=game-spawner] store result entity @s Pos[1] double 1 run scoreboard players get @s reg1

