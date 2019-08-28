function summon:d4y2
tag @e[tag=d4y2-root] add no-move
tag @e[tag=d4y2-seat] add no-particle
#tag @e[tag=d4y2-root] add flying
execute as @e[tag=d4y2-root] run data merge entity @s {NoGravity:1}
scoreboard players set @e[tag=d4y2-root] speed 1000
