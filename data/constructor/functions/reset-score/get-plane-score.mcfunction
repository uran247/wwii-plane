execute as @e[tag=plane] store result score @s plane-id run data get entity @s Attributes[{Name:"generic.knockbackResistance"}].Base 1
#execute as @e[tag=a6m-root] run function constructor:reset-score/a6m-reset