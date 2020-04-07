function plane:summon/g4m1
tag @e[tag=g4m1-root] add no-move
tag @e[tag=g4m1-seat] add no-particle
tag @e[tag=g4m1-root,tag=!satsuei] add satsuei1
tag @e[tag=g4m1-root,tag=!satsuei] add satsuei
execute as @e[tag=g4m1-root] run data merge entity @s {NoGravity:1b}
scoreboard players set @e[tag=g4m1-root] speed 1000
