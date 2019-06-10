function summon:d3a
tag @e[tag=d3a-root] add no-move
#tag @e[tag=d3a-root] add flying
data merge entity @e[tag=d3a-root,limit=1] {NoGravity:1}
scoreboard players set @e[tag=d3a-root] speed 1000

execute as @e[tag=d3a-root] at @s store result entity @e[tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm
