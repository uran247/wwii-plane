#tickタグで指定して実行
execute as @e[tag=gun] at @s run function weapon:gun/gun-manager
execute as @e[tag=dropping] at @s run function weapon:dropping/move
execute as @e[tag=rocket,tag=launch] at @s run function weapon:rocket/move
execute as @e[tag=aagun] at @s run function weapon:aagun/move



#execute as @e[tag=a6m-root] at @s run function math:vector-3input
