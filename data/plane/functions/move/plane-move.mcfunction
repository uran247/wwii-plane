#flyingタグで実行するfunctionを選別
#飛行機を動かすファンクション
#条件:tickで実行 execute as @e[type=armor_stand,tag=plane-root,scores={speed=1..}] at @s run function plane:move/move

#実行者にタグ付け
tag @s add plane-move-executer
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[distance=..20,tag=plane] if score @s plane-id = #plane-id reg1 run tag @s add plane-move-parts

#飛行・滑走実行
execute if entity @s[tag=!flying] run function plane:move/plane-move/rolling
execute if entity @s[tag=flying] run function plane:move/plane-move/flying

#タグ解除
execute at @s run tag @e[distance=..20,tag=plane-move-parts] remove plane-move-parts
tag @s remove plane-move-executer
