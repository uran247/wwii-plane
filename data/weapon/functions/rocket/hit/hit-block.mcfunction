#機銃の命中判定
#なんブロック先で命中するか判定、その値をreg1に入れる
#あたってた場合reg2は1以上になる
#gun/moveから呼び出される
#実行前提条件：reg1に移動距離の値が入ってる　単位：block/tick　スケール：1倍
#使えるタグ　gun-move-executer：弾体  gunner:発射母体

#ブロック衝突判定、衝突判定が出たら#hit-flagが1に
execute store success score #hit-flag reg1 positioned ^ ^ ^ unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 0
execute if score #speed reg1 matches 1.. store success score #hit-flag reg1 positioned ^ ^ ^1 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 1
execute if score #speed reg1 matches 2.. store success score #hit-flag reg1 positioned ^ ^ ^2 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 2
execute if score #speed reg1 matches 3.. store success score #hit-flag reg1 positioned ^ ^ ^3 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 3
execute if score #speed reg1 matches 4.. store success score #hit-flag reg1 positioned ^ ^ ^4 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 4
execute if score #speed reg1 matches 5.. store success score #hit-flag reg1 positioned ^ ^ ^5 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 5
execute if score #speed reg1 matches 6.. store success score #hit-flag reg1 positioned ^ ^ ^6 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 6
execute if score #speed reg1 matches 7.. store success score #hit-flag reg1 positioned ^ ^ ^7 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 7
execute if score #speed reg1 matches 8.. store success score #hit-flag reg1 positioned ^ ^ ^8 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 8
execute if score #speed reg1 matches 9.. store success score #hit-flag reg1 positioned ^ ^ ^9 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 9
execute if score #speed reg1 matches 10.. store success score #hit-flag reg1 positioned ^ ^ ^10 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 10
execute if score #speed reg1 matches 11.. store success score #hit-flag reg1 positioned ^ ^ ^11 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 11
execute if score #speed reg1 matches 12.. store success score #hit-flag reg1 positioned ^ ^ ^12 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 12
execute if score #speed reg1 matches 13.. store success score #hit-flag reg1 positioned ^ ^ ^13 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 13
execute if score #speed reg1 matches 14.. store success score #hit-flag reg1 positioned ^ ^ ^14 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 14
execute if score #speed reg1 matches 15.. store success score #hit-flag reg1 positioned ^ ^ ^15 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 15
execute if score #speed reg1 matches 16.. store success score #hit-flag reg1 positioned ^ ^ ^16 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 16
execute if score #speed reg1 matches 17.. store success score #hit-flag reg1 positioned ^ ^ ^17 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 17
execute if score #speed reg1 matches 18.. store success score #hit-flag reg1 positioned ^ ^ ^18 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 18
execute if score #speed reg1 matches 19.. store success score #hit-flag reg1 positioned ^ ^ ^19 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 19
execute if score #speed reg1 matches 20.. store success score #hit-flag reg1 positioned ^ ^ ^20 unless block ~ ~ ~ minecraft:air run scoreboard players set #speed reg1 20
