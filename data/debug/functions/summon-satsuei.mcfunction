function summon:a6m2
tag @e[tag=a6m2-root] add no-move
#tag @e[tag=a6m2-root] add flying
execute as @e[tag=a6m2-root] run data merge entity @s {NoGravity:1}
scoreboard players set @e[tag=a6m2-root] speed 1000
