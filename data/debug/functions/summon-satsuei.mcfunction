function plane:summon/j-100b
tag @e[tag=j100b-root] add no-move
tag @e[tag=j100b-seat] add no-particle
#tag @e[tag=j100b-root] add flying
execute as @e[tag=j100b-root] run data merge entity @s {NoGravity:1}
scoreboard players set @e[tag=j100b-root] speed 1000
