#tickタグで指定して実行
#execute as @e[tag=ki43,tag=engine] at @s positioned ~ ~ ~ run particle minecraft:flame ^ ^ ^ 0 0 0 0 1 force
#execute as @e[tag=ki43,tag=aileron-l] at @s positioned ~ ~ ~ run particle minecraft:flame ^ ^ ^ 0 0 0 0 1 force
#execute as @e[tag=rocket] at @s positioned ~ ~1.4 ~ run particle minecraft:flame ^ ^ ^-1.2 0 0 0 0.007 1 force
#execute as @e[tag=rocket] at @s positioned ~ ~1.4 ~ run particle minecraft:flame ^ ^ ^-1.4 0 0 0 0.009 1 force
#execute as @e[tag=rocket] at @s positioned ~ ~1.4 ~ run particle minecraft:flame ^ ^ ^-1.6 0 0 0 0.011 1 force
#execute as @e[tag=rocket] at @s positioned ~ ~1.4 ~ run particle minecraft:flame ^ ^ ^-1.8 0 0 0 0.013 1 force
#execute as @e[tag=a6m-root] at @s run function satsuei:gun-test
#execute as @a[scores={open-shop=1..}] run function debug:insert-villager
#execute store result score #pick reg1 run clear @a stone 0
#execute if score #pick reg1 > #0 Num run say pick
#scoreboard players set #pick reg1 0
#execute as @e[tag=a6m2-root] at @s run function debug:chk-offset
#function debug:test-immute-pickup