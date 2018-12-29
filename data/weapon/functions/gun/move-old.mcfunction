#スコア分向いてる方向にTP
#実行者：弾体

#実行者にタグ付け
tag @s add gun-move-executer

#進行方向上にいるエンティティにタグ付け
execute if entity @s[scores={age=..199}] as @e[tag=!gun,distance=..50] unless score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id positioned ^ ^ ^-10 facing entity @s feet positioned ^ ^ ^10 if entity @e[tag=gun-move-executer,distance=..2] run tag @s add hit-gun-cand

#移動&ヒット判定
#0.1-0.9移動させてhit判定
scoreboard players operation @s reg1 = @s speed
scoreboard players operation @s reg1 %= #10 Num
#tellraw @p [{"score":{"name":"@s","objective":"plane-id"}}]

execute if score @s reg1 matches 1 at @s run tag @e[tag=hit-gun-cand,distance=..0.1] add hit-gun
execute if score @s reg1 matches 1 at @s run tp @s ^ ^ ^0.1
execute if score @s reg1 matches 2 at @s run tag @e[tag=hit-gun-cand,distance=..0.2] add hit-gun
execute if score @s reg1 matches 2 at @s run tp @s ^ ^ ^0.2
execute if score @s reg1 matches 3 at @s run tag @e[tag=hit-gun-cand,distance=..0.3] add hit-gun
execute if score @s reg1 matches 3 at @s run tp @s ^ ^ ^0.3
execute if score @s reg1 matches 4 at @s run tag @e[tag=hit-gun-cand,distance=..0.4] add hit-gun
execute if score @s reg1 matches 4 at @s run tp @s ^ ^ ^0.4
execute if score @s reg1 matches 5 at @s run tag @e[tag=hit-gun-cand,distance=..0.5] add hit-gun
execute if score @s reg1 matches 5 at @s run tp @s ^ ^ ^0.5
execute if score @s reg1 matches 6 at @s run tag @e[tag=hit-gun-cand,distance=..0.6] add hit-gun
execute if score @s reg1 matches 6 at @s run tp @s ^ ^ ^0.6
execute if score @s reg1 matches 7 at @s run tag @e[tag=hit-gun-cand,distance=..0.7] add hit-gun
execute if score @s reg1 matches 7 at @s run tp @s ^ ^ ^0.7
execute if score @s reg1 matches 8 at @s run tag @e[tag=hit-gun-cand,distance=..0.8] add hit-gun
execute if score @s reg1 matches 8 at @s run tp @s ^ ^ ^0.8
execute if score @s reg1 matches 9 at @s run tag @e[tag=hit-gun-cand,distance=..0.9] add hit-gun
execute if score @s reg1 matches 9 at @s run tp @s ^ ^ ^0.9

#hitしたら弾を消す
execute if entity @e[tag=hit-gun,distance=..1] run tag @s[scores={age=..199}] add hit-executer
execute unless block ~ ~ ~ minecraft:air run tag @s[scores={age=..199}] add hit-executer

#1-9移動させてhit判定
scoreboard players operation @s reg1 = @s speed
scoreboard players operation @s reg1 /= #10 Num
scoreboard players operation @s reg1 %= #10 Num

execute if score @s[tag=!hit-executer] reg1 matches 1 at @s run tag @e[tag=hit-gun-cand,distance=..1] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 1 at @s run tp @s ^ ^ ^1
execute if score @s[tag=!hit-executer] reg1 matches 2 at @s run tag @e[tag=hit-gun-cand,distance=..2] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 2 at @s run tp @s ^ ^ ^2
execute if score @s[tag=!hit-executer] reg1 matches 3 at @s run tag @e[tag=hit-gun-cand,distance=..3] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 3 at @s run tp @s ^ ^ ^3
execute if score @s[tag=!hit-executer] reg1 matches 4 at @s run tag @e[tag=hit-gun-cand,distance=..4] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 4 at @s run tp @s ^ ^ ^4
execute if score @s[tag=!hit-executer] reg1 matches 5 at @s run tag @e[tag=hit-gun-cand,distance=..5] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 5 at @s run tp @s ^ ^ ^5
execute if score @s[tag=!hit-executer] reg1 matches 6 at @s run tag @e[tag=hit-gun-cand,distance=..6] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 6 at @s run tp @s ^ ^ ^6
execute if score @s[tag=!hit-executer] reg1 matches 7 at @s run tag @e[tag=hit-gun-cand,distance=..7] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 7 at @s run tp @s ^ ^ ^7
execute if score @s[tag=!hit-executer] reg1 matches 8 at @s run tag @e[tag=hit-gun-cand,distance=..8] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 8 at @s run tp @s ^ ^ ^8
execute if score @s[tag=!hit-executer] reg1 matches 9 at @s run tag @e[tag=hit-gun-cand,distance=..9] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 9 at @s run tp @s ^ ^ ^9

#hitしたら弾を消す
execute if entity @e[tag=hit-gun,distance=..10] run tag @s[scores={age=..199}] add hit-executer
execute unless block ~ ~ ~ minecraft:air run tag @s[scores={age=..199}] add hit-executer

#10-50移動させてhit判定
scoreboard players operation @s reg1 = @s speed
scoreboard players operation @s reg1 /= #100 Num
scoreboard players operation @s reg1 %= #10 Num

execute if score @s[tag=!hit-executer] reg1 matches 1 at @s run tag @e[tag=hit-gun-cand,distance=..10] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 1 at @s run tp @s ^ ^ ^10
execute if score @s[tag=!hit-executer] reg1 matches 2 at @s run tag @e[tag=hit-gun-cand,distance=..20] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 2 at @s run tp @s ^ ^ ^20
execute if score @s[tag=!hit-executer] reg1 matches 3 at @s run tag @e[tag=hit-gun-cand,distance=..30] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 3 at @s run tp @s ^ ^ ^30
execute if score @s[tag=!hit-executer] reg1 matches 4 at @s run tag @e[tag=hit-gun-cand,distance=..40] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 4 at @s run tp @s ^ ^ ^40
execute if score @s[tag=!hit-executer] reg1 matches 5 at @s run tag @e[tag=hit-gun-cand,distance=..50] add hit-gun
execute if score @s[tag=!hit-executer] reg1 matches 5 at @s run tp @s ^ ^ ^50

#hitしたら弾を消す
execute if entity @e[tag=hit-gun,distance=..50] run tag @s[scores={age=..199}] add hit-executer
execute unless block ~ ~ ~ minecraft:air run tag @s[scores={age=..199}] add hit-executer

#ダメージ処理
execute as @e[tag=hit-gun,distance=..50] store result score @s reg1 run data get entity @s Health
scoreboard players operation @e[tag=hit-gun,distance=..50] reg1 -= @s damage
execute as @e[tag=hit-gun,distance=..50] if score @s reg1 < #0 Num run scoreboard players set @s 0
execute as @e[tag=hit-gun,distance=..50] store result entity @s Health float 1 run scoreboard players get @s reg1
effect give @e[tag=hit-gun,distance=..50] minecraft:instant_damage 1 31

#ブロックにめり込んでたら削除

execute at @s run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0 1 force
scoreboard players remove @s age 1
kill @s[scores={age=..0}]
kill @s[tag=hit-executer]
tag @e[tag=hit-gun,distance=..50] remove hit-gun
tag @e[tag=hit-gun-cand,distance=..50] remove hit-gun-cand
tag @s remove gun-move-executer