#機銃の命中判定
#なんブロック先で命中するか判定、その値をreg1に入れる
#あたってた場合reg2は1以上になる
#gun/moveから呼び出される
#実行前提条件：reg1に移動距離の値が入ってる　単位：block/tick　スケール：1倍
#使えるタグ　gun-move-executer：弾体  gunner:発射母体

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
