#スコア分向いてる方向にTP
#実行者：弾体

#実行者にタグ付け
tag @s add gun-move-executer

#自分と同じID持ちのエンティティにタグ付け
execute as @e[distance=..2] if score @s plane-id = @e[tag=gun-move-executer,distance=..2,limit=1] plane-id run tag @s add gunner

#進行方向上にいるエンティティにタグ付け
#execute if entity @s[scores={age=..199}] as @e[tag=!gun,distance=..20] unless score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id positioned ^ ^ ^-10 facing entity @s feet positioned ^ ^ ^10 if entity @e[tag=gun-move-executer,distance=..2] run tag @s add hit-gun-cand

#移動&ヒット判定
#0.1-0.9移動させてhit判定
scoreboard players operation @s reg1 = @s speed
scoreboard players operation @s reg1 %= #10 Num
#tellraw @p [{"score":{"name":"@s","objective":"plane-id"}}]

execute if score @s reg1 matches 1 at @s run tp @s ^ ^ ^0.1
execute if score @s reg1 matches 2 at @s run tp @s ^ ^ ^0.2
execute if score @s reg1 matches 3 at @s run tp @s ^ ^ ^0.3
execute if score @s reg1 matches 4 at @s run tp @s ^ ^ ^0.4
execute if score @s reg1 matches 5 at @s run tp @s ^ ^ ^0.5
execute if score @s reg1 matches 6 at @s run tp @s ^ ^ ^0.6
execute if score @s reg1 matches 7 at @s run tp @s ^ ^ ^0.7
execute if score @s reg1 matches 8 at @s run tp @s ^ ^ ^0.8
execute if score @s reg1 matches 9 at @s run tp @s ^ ^ ^0.9

#1-20移動させてhit判定
scoreboard players operation @s reg1 = @s speed
scoreboard players operation @s reg1 /= #10 Num

#entity衝突判定
execute if score @s reg1 >= #1 Num at @s positioned ^ ^ ^1 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 1
execute if score @s reg1 >= #2 Num at @s positioned ^ ^ ^2 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 2
execute if score @s reg1 >= #3 Num at @s positioned ^ ^ ^3 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 3
execute if score @s reg1 >= #4 Num at @s positioned ^ ^ ^4 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 4
execute if score @s reg1 >= #5 Num at @s positioned ^ ^ ^5 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 5
execute if score @s reg1 >= #6 Num at @s positioned ^ ^ ^6 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 6
execute if score @s reg1 >= #7 Num at @s positioned ^ ^ ^7 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 7
execute if score @s reg1 >= #8 Num at @s positioned ^ ^ ^8 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 8
execute if score @s reg1 >= #9 Num at @s positioned ^ ^ ^9 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 9
execute if score @s reg1 >= #10 Num at @s positioned ^ ^ ^10 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 10
execute if score @s reg1 >= #11 Num at @s positioned ^ ^ ^11 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 11
execute if score @s reg1 >= #12 Num at @s positioned ^ ^ ^12 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 12
execute if score @s reg1 >= #13 Num at @s positioned ^ ^ ^13 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 13
execute if score @s reg1 >= #14 Num at @s positioned ^ ^ ^14 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 14
execute if score @s reg1 >= #15 Num at @s positioned ^ ^ ^15 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 15
execute if score @s reg1 >= #16 Num at @s positioned ^ ^ ^16 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 16
execute if score @s reg1 >= #17 Num at @s positioned ^ ^ ^17 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 17
execute if score @s reg1 >= #18 Num at @s positioned ^ ^ ^18 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 18
execute if score @s reg1 >= #19 Num at @s positioned ^ ^ ^19 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 19
execute if score @s reg1 >= #20 Num at @s positioned ^ ^ ^20 unless block ~ ~ ~ minecraft:air run scoreboard players set reg1 20
execute if score @s reg1 >= #1 Num at @s positioned ^ ^ ^1 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 1
execute if score @s reg1 >= #2 Num at @s positioned ^ ^ ^2 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 2
execute if score @s reg1 >= #3 Num at @s positioned ^ ^ ^3 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 3
execute if score @s reg1 >= #4 Num at @s positioned ^ ^ ^4 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 4
execute if score @s reg1 >= #5 Num at @s positioned ^ ^ ^5 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 5
execute if score @s reg1 >= #6 Num at @s positioned ^ ^ ^6 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 6
execute if score @s reg1 >= #7 Num at @s positioned ^ ^ ^7 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 7
execute if score @s reg1 >= #8 Num at @s positioned ^ ^ ^8 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 8
execute if score @s reg1 >= #9 Num at @s positioned ^ ^ ^9 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 9
execute if score @s reg1 >= #10 Num at @s positioned ^ ^ ^10 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 10
execute if score @s reg1 >= #11 Num at @s positioned ^ ^ ^11 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 11
execute if score @s reg1 >= #12 Num at @s positioned ^ ^ ^12 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 12
execute if score @s reg1 >= #13 Num at @s positioned ^ ^ ^13 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 13
execute if score @s reg1 >= #14 Num at @s positioned ^ ^ ^14 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 14
execute if score @s reg1 >= #15 Num at @s positioned ^ ^ ^15 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 15
execute if score @s reg1 >= #16 Num at @s positioned ^ ^ ^16 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 16
execute if score @s reg1 >= #17 Num at @s positioned ^ ^ ^17 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 17
execute if score @s reg1 >= #18 Num at @s positioned ^ ^ ^18 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 18
execute if score @s reg1 >= #19 Num at @s positioned ^ ^ ^19 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 19
execute if score @s reg1 >= #20 Num at @s positioned ^ ^ ^20 if entity @e[tag=!gun,tag=!gunner,distance=..2] run scoreboard players set reg1 20
execute if score @s reg1 = #1 Num at @s run tp @s ^ ^ ^1
execute if score @s reg1 = #2 Num at @s run tp @s ^ ^ ^2
execute if score @s reg1 = #3 Num at @s run tp @s ^ ^ ^3
execute if score @s reg1 = #4 Num at @s run tp @s ^ ^ ^4
execute if score @s reg1 = #5 Num at @s run tp @s ^ ^ ^5
execute if score @s reg1 = #6 Num at @s run tp @s ^ ^ ^6
execute if score @s reg1 = #7 Num at @s run tp @s ^ ^ ^7
execute if score @s reg1 = #8 Num at @s run tp @s ^ ^ ^8
execute if score @s reg1 = #9 Num at @s run tp @s ^ ^ ^9
execute if score @s reg1 = #10 Num at @s run tp @s ^ ^ ^10
execute if score @s reg1 = #11 Num at @s run tp @s ^ ^ ^11
execute if score @s reg1 = #12 Num at @s run tp @s ^ ^ ^12
execute if score @s reg1 = #13 Num at @s run tp @s ^ ^ ^13
execute if score @s reg1 = #14 Num at @s run tp @s ^ ^ ^14
execute if score @s reg1 = #15 Num at @s run tp @s ^ ^ ^15
execute if score @s reg1 = #16 Num at @s run tp @s ^ ^ ^16
execute if score @s reg1 = #17 Num at @s run tp @s ^ ^ ^17
execute if score @s reg1 = #18 Num at @s run tp @s ^ ^ ^18
execute if score @s reg1 = #19 Num at @s run tp @s ^ ^ ^19
execute if score @s reg1 = #20 Num at @s run tp @s ^ ^ ^20


#hitしたか判定
#execute at @s[tag=!gun-nohit] if entity @e[tag=!gun,distance=..2] run tag @e[tag=!gun,distance=..2] add hit-gun
execute at @s if entity @e[tag=!gun,distance=..2] run tag @e[tag=!gun,distance=..2] add hit-gun
execute at @s if entity @e[tag=!gun,distance=..2] run tag @s add hit-executer
execute at @s unless block ~ ~ ~ minecraft:air run tag @s[tag=!gun-nohit] add hit-executer

#着弾地点にパーティクル
execute at @s[tag=hit-executer] run particle minecraft:explosion ^ ^ ^-1 0.1 0.1 0.1 0 1 force

#ダメージ処理
execute at @s as @e[tag=hit-gun,distance=..2] store result score @s reg1 run data get entity @s Health
execute at @s run scoreboard players operation @e[tag=hit-gun,distance=..2] reg1 -= @s damage
execute at @s as @e[tag=hit-gun,distance=..2] if score @s reg1 < #0 Num run scoreboard players set @s 0
execute as @e[tag=hit-gun] run say hit
execute at @s[tag=hit-executer] if entity @e[tag=hit-gun,distance=..2] as @e[tag=plane-root] if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run scoreboard players add @p shootdown 1
execute at @s as @e[tag=hit-gun,distance=..2] store result entity @s Health float 1 run scoreboard players get @s reg1
execute at @s[tag=hit-executer] run effect give @e[tag=hit-gun,distance=..2] minecraft:instant_damage 1 31
execute at @s[tag=hit-executer] run kill @e[tag=hit-gun,distance=..2]

#曳光弾ならパーティクル
execute as @s[tag=!hit-executer,tag=tracer] at @s run particle minecraft:dust 0 1 1 2 ~ ~ ~ 0 0 0 1 1 force

#hitしてたら弾を削除
kill @s[tag=hit-executer]
#execute at @s at @e[tag=block-detector,tag=hit-pos,sort=nearest,distance=..21,limit=1] run particle minecraft:explosion ^ ^ ^ 0.1 0.1 0.1 0 1 force

#弾の寿命を1減らし、0なら消す
scoreboard players remove @s age 1
kill @s[scores={age=..0}]

#タグ削除
execute at @s run tag @e[tag=hit-gun,distance=..2] remove hit-gun
execute at @s run tag @s remove gun-move-executer
tag @e[tag=gunner,distance=..25] remove gunner

#gun-nohitタグを削除
tag @s remove gun-nohit
