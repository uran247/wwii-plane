#スコア分向いてる方向にTP
#実行者：弾体

#実行者にタグ付け
tag @s add gun-move-executer

#自分と同じID持ちのエンティティにタグ付け
execute as @e[distance=..20] if score @s plane-id = @e[tag=gun-move-executer,distance=..20,limit=1] plane-id run tag @s add gunner

#移動&ヒット判定
#0.1-0.9移動させる
scoreboard players operation @s reg1 = @s speed
scoreboard players operation @s reg1 %= #10 Num

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

#ブロック、エンティティ衝突判定
execute at @s run function weapon:gun/hit/hit

#命中エンティティがいないなら衝突位置のブロックか到達地点まで移動
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

#着弾地点にパーティクル
execute at @s[scores={reg2=1}] run particle minecraft:explosion ^ ^ ^-1 0.1 0.1 0.1 0 1 force

#曳光弾ならパーティクル
execute as @s[tag=tracer,tag=tracer-red] at @s run particle minecraft:dust 1 0 0 2 ~ ~ ~ 0 0 0 1 1 force
execute as @s[tag=tracer,tag=tracer-lightblue] at @s run particle minecraft:dust 0 1 1 2 ~ ~ ~ 0 0 0 1 1 force

#hitしてたら弾を削除
kill @s[scores={reg2=1}]

#弾の寿命を1減らし、0なら消す
scoreboard players remove @s age 1
kill @s[scores={age=..0}]

#タグ削除
execute at @s run tag @e[tag=hit-gun,distance=..2] remove hit-gun
execute at @s run tag @s remove gun-move-executer
tag @e[tag=gunner,distance=..25] remove gunner

#gun-nohitタグを削除
tag @s remove gun-nohit
