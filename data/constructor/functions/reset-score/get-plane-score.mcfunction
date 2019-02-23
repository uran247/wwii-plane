execute as @e[tag=plane] store result score @s plane-id run data get entity @s Attributes[1].Base 1
execute as @e[tag=a6m-root] run function constructor:reset-score/a6m-reset