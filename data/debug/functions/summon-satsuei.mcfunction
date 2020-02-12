function plane:summon/ki-43
tag @e[tag=ki43-root] add no-move
tag @e[tag=ki43-seat] add no-particle
#tag @e[tag=ki43-root] add flying
execute as @e[tag=ki43-root] run data merge entity @s {NoGravity:1b}
scoreboard players set @e[tag=ki43-root] speed 1000
