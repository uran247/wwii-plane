function plane:summon/n1k2
tag @e[tag=n1k2-root] add no-move
tag @e[tag=n1k2-seat] add no-particle
tag @e[tag=n1k2-root,tag=!satsuei] add satsuei2
tag @e[tag=n1k2-root,tag=!satsuei] add satsuei
execute as @e[tag=n1k2-root] run data merge entity @s {NoGravity:1b}
scoreboard players set @e[tag=n1k2-root] speed 1000
