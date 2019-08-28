#入力　entity:plane-root
#処理　機種に応じたplane2itemを実行

#同じIDのパーツ取得
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[tag=plane] if score @s plane-id = #plane-id reg1 run tag @s add plane2item-plane-parts

#個別処理
execute as @s[tag=a5m-root] at @s run function item:plane2item/a5m-2-item
execute as @s[tag=ki43-root] at @s run function item:plane2item/ki43-2-item
execute as @s[tag=ki21-root] at @s run function item:plane2item/ki21-2-item
execute as @s[tag=d3a-root] at @s run function item:plane2item/d3a-2-item
execute as @s[tag=a6m2-root] at @s run function item:plane2item/a6m2-2-item
execute as @s[tag=ki44-root] at @s run function item:plane2item/ki44-2-item
execute as @s[tag=d4y2-root] at @s run function item:plane2item/d4y2-2-item

#キル
execute as @e[tag=plane2item-plane-parts] at @s run tp @s ~ -40 ~
kill @e[tag=plane2item-plane-parts]
kill @s