function plane:summon/ki-61
tag @e[tag=ki61-root] add no-move
tag @e[tag=ki61-seat] add no-particle
#tag @e[tag=ki61-root] add flying
execute as @e[tag=ki61-root] run data merge entity @s {NoGravity:1}
scoreboard players set @e[tag=ki61-root] speed 1000
