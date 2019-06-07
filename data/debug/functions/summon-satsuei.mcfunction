function summon:a5m
tag @e[tag=a5m-root] add no-move
#tag @e[tag=a5m-root] add flying
data merge entity @e[tag=a5m-root,limit=1] {NoGravity:1}
scoreboard players set @e[tag=a5m-root] speed 1000

execute as @e[tag=a5m-root] store result entity @e[tag=plane-move-parts,tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm
