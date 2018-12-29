#flyingタグで実行するfunctionを選別
#条件:tickで実行 execute as @e[type=armor_stand,tag=plane-root,scores={speed=1..}] at @s run function plane:move/move

execute if entity @s[tag=!flying] run function plane:move/plane-move/rolling
execute if entity @s[tag=flying] run function plane:move/plane-move/flying
