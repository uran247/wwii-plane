#機銃の命中判定
#なんブロック先で命中するか判定、その値をreg1に入れる
#gun/moveから呼び出される
#実行前提条件：reg1に移動距離の値が入ってる　単位：block/tick　スケール：1倍
#使えるタグ　gun-move-executer：弾体  gunner:発射母体
#実行者：弾体

#衝突判定フラグを0に
scoreboard players set @s reg2 0

#ブロック衝突判定、衝突判定が出たらreg2が1に
execute if score @s reg1 >= #1 Num store success score @s reg2 positioned ^ ^ ^1 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 1
execute if score @s reg1 >= #2 Num store success score @s reg2 positioned ^ ^ ^2 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 2
execute if score @s reg1 >= #3 Num store success score @s reg2 positioned ^ ^ ^3 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 3
execute if score @s reg1 >= #4 Num store success score @s reg2 positioned ^ ^ ^4 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 4
execute if score @s reg1 >= #5 Num store success score @s reg2 positioned ^ ^ ^5 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 5
execute if score @s reg1 >= #6 Num store success score @s reg2 positioned ^ ^ ^6 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 6
execute if score @s reg1 >= #7 Num store success score @s reg2 positioned ^ ^ ^7 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 7
execute if score @s reg1 >= #8 Num store success score @s reg2 positioned ^ ^ ^8 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 8
execute if score @s reg1 >= #9 Num store success score @s reg2 positioned ^ ^ ^9 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 9
execute if score @s reg1 >= #10 Num store success score @s reg2 positioned ^ ^ ^10 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 10
execute if score @s reg1 >= #11 Num store success score @s reg2 positioned ^ ^ ^11 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 11
execute if score @s reg1 >= #12 Num store success score @s reg2 positioned ^ ^ ^12 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 12
execute if score @s reg1 >= #13 Num store success score @s reg2 positioned ^ ^ ^13 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 13
execute if score @s reg1 >= #14 Num store success score @s reg2 positioned ^ ^ ^14 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 14
execute if score @s reg1 >= #15 Num store success score @s reg2 positioned ^ ^ ^15 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 15
execute if score @s reg1 >= #16 Num store success score @s reg2 positioned ^ ^ ^16 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 16
execute if score @s reg1 >= #17 Num store success score @s reg2 positioned ^ ^ ^17 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 17
execute if score @s reg1 >= #18 Num store success score @s reg2 positioned ^ ^ ^18 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 18
execute if score @s reg1 >= #19 Num store success score @s reg2 positioned ^ ^ ^19 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 19
execute if score @s reg1 >= #20 Num store success score @s reg2 positioned ^ ^ ^20 unless block ~ ~ ~ minecraft:air run scoreboard players set @s reg1 20

#エンティティ衝突判定
#機銃口径に応じて衝突判定幅が変わる
execute at @s[tag=7p7mm] run function weapon:gun/hit/hit-entity-7p7mm
execute at @s[tag=20mm] run function weapon:gun/hit/hit-entity-20mm
execute if entity @e[tag=hit-gun,distance=..20] run scoreboard players set @s reg2 1

#命中エンティティにパーティクル
execute at @e[tag=hit-gun,distance=..20] run particle minecraft:explosion ^ ^ ^ 0.1 0.1 0.1 0 1 force

#ダメージ判定
execute as @e[tag=hit-gun,distance=..20] store result score @s reg1 run data get entity @s Health
scoreboard players operation @e[tag=hit-gun,distance=..20] reg1 -= @s damage
execute as @e[tag=hit-gun,distance=..20] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0
execute as @e[tag=hit-gun,distance=..20,scores={reg1=0},type=!minecraft:spawner_minecart] run say destroyed
execute as @e[tag=hit-gun,distance=..20] store result entity @s Health float 1 run scoreboard players get @s reg1
execute at @s[scores={reg2=1}] if entity @e[tag=hit-gun,distance=..20,scores={reg1=0}] as @e[tag=plane-root] if score @s plane-id = @e[tag=gun-move-executer,limit=1] plane-id run scoreboard players add @p shootdown 1
#execute at @s[tag=hit-executer] run effect give @e[tag=hit-gun,distance=..2] minecraft:instant_damage 1 31
#execute at @s[tag=hit-executer] run kill @e[tag=hit-gun,distance=..2]

#スポナー破壊判定
execute as @e[tag=hit-gun,distance=..20,type=minecraft:spawner_minecart] store result score @s reg1 run data get entity @s RequiredPlayerRange
scoreboard players operation @e[tag=hit-gun,distance=..20,type=minecraft:spawner_minecart] reg1 -= @s damage
execute as @e[tag=hit-gun,distance=..20,type=minecraft:spawner_minecart] if score @s reg1 < #0 Num run scoreboard players set @s reg1 0
execute as @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart] run say destroyed
execute as @e[tag=hit-gun,distance=..20] store result entity @s RequiredPlayerRange short 1 run scoreboard players get @s reg1
kill @e[tag=hit-gun,distance=..20,scores={reg1=0},type=minecraft:spawner_minecart]

#hit-gunタグ除去
tag @e[tag=hit-gun] remove hit-gun