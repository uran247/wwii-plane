function summon:ki-21
tag @e[tag=ki21-root] add no-move
tag @e[tag=ki21-root] add flying
data merge entity @e[tag=ki21-root,limit=1] {NoGravity:1}
scoreboard players set @e[tag=ki21-root] speed 1000

