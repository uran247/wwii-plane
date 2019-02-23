#スポナー召喚
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run function mob:summon/phantom1-spawner

#UUIDから乱数生成(0-150)
execute if score @p stage-id matches 1 positioned -1888 180 -2112 as @e[tag=game-spawner,distance=..10] store result score @s reg1 run data get entity @s UUIDMost 0.0000000003
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run scoreboard players operation @e[tag=game-spawner,distance=..10,scores={reg=..-1}] reg1 *= #-1 Num
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run scoreboard players operation @e[tag=game-spawner,distance=..10] reg1 %= #150 Num
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run scoreboard players add @e[tag=game-spawner,distance=..10] reg1 105

#拡散
execute if score @p stage-id matches 1 positioned -1888 180 -2112 run spreadplayers -1888 -2112 0 192 false @e[tag=game-spawner,distance=..10]
execute if score @p stage-id matches 1 positioned -1888 180 -2112 as @e[tag=game-spawner,distance=..300] store result entity @s Pos[1] double 1 run scoreboard players get @s reg1

