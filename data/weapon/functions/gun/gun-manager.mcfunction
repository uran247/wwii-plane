#スコア分向いてる方向にTP
#実行者：弾体

#実行者にタグ付け
tag @s add gun-move-executer

#自分と同じID持ちのエンティティにタグ付け
execute as @e[distance=..20] if score @s plane-id = @e[tag=gun-move-executer,distance=..20,limit=1] plane-id run tag @s add gunner

#移動&ヒット判定
#小数点以下の移動量決定
scoreboard players operation #speed-decimal reg1 = @s speed
scoreboard players operation #speed-decimal reg1 %= #10 Num
#整数部の移動量決定
scoreboard players operation #speed reg1 = @s speed
scoreboard players operation #speed reg1 /= #10 Num

#小数点移動先でhitしたか確認
execute if score #speed-decimal reg1 matches 0 at @s positioned ^ ^ ^0.1 run function weapon:gun/hit/hit
execute if score #speed-decimal reg1 matches 1 at @s positioned ^ ^ ^0.1 run function weapon:gun/hit/hit
execute if score #speed-decimal reg1 matches 2 at @s positioned ^ ^ ^0.2 run function weapon:gun/hit/hit
execute if score #speed-decimal reg1 matches 3 at @s positioned ^ ^ ^0.3 run function weapon:gun/hit/hit
execute if score #speed-decimal reg1 matches 4 at @s positioned ^ ^ ^0.4 run function weapon:gun/hit/hit
execute if score #speed-decimal reg1 matches 5 at @s positioned ^ ^ ^0.5 run function weapon:gun/hit/hit
execute if score #speed-decimal reg1 matches 6 at @s positioned ^ ^ ^0.6 run function weapon:gun/hit/hit
execute if score #speed-decimal reg1 matches 7 at @s positioned ^ ^ ^0.7 run function weapon:gun/hit/hit
execute if score #speed-decimal reg1 matches 8 at @s positioned ^ ^ ^0.8 run function weapon:gun/hit/hit
execute if score #speed-decimal reg1 matches 9 at @s positioned ^ ^ ^0.9 run function weapon:gun/hit/hit

#ブロック、エンティティ衝突判定
#execute at @s run function weapon:gun/hit/hit

#命中エンティティがいないなら衝突位置のブロックか到達地点まで移動
#execute if score #speed reg1 = #1 Num at @s run tp @s ^ ^ ^1
#execute if score #speed reg1 = #2 Num at @s run tp @s ^ ^ ^2
#execute if score #speed reg1 = #3 Num at @s run tp @s ^ ^ ^3
#execute if score #speed reg1 = #4 Num at @s run tp @s ^ ^ ^4
#execute if score #speed reg1 = #5 Num at @s run tp @s ^ ^ ^5
#execute if score #speed reg1 = #6 Num at @s run tp @s ^ ^ ^6
#execute if score #speed reg1 = #7 Num at @s run tp @s ^ ^ ^7
#execute if score #speed reg1 = #8 Num at @s run tp @s ^ ^ ^8
#execute if score #speed reg1 = #9 Num at @s run tp @s ^ ^ ^9
#execute if score #speed reg1 = #10 Num at @s run tp @s ^ ^ ^10
#execute if score #speed reg1 = #11 Num at @s run tp @s ^ ^ ^11
#execute if score #speed reg1 = #12 Num at @s run tp @s ^ ^ ^12
#execute if score #speed reg1 = #13 Num at @s run tp @s ^ ^ ^13
#execute if score #speed reg1 = #14 Num at @s run tp @s ^ ^ ^14
#execute if score #speed reg1 = #15 Num at @s run tp @s ^ ^ ^15
#execute if score #speed reg1 = #16 Num at @s run tp @s ^ ^ ^16
#execute if score #speed reg1 = #17 Num at @s run tp @s ^ ^ ^17
#execute if score #speed reg1 = #18 Num at @s run tp @s ^ ^ ^18
#execute if score #speed reg1 = #19 Num at @s run tp @s ^ ^ ^19
#execute if score #speed reg1 = #20 Num at @s run tp @s ^ ^ ^20
execute if score #speed-decimal reg1 matches 0 at @s run function weapon:gun/move
execute if score #speed-decimal reg1 matches 1 at @s positioned ^ ^ ^0.1 run function weapon:gun/move
execute if score #speed-decimal reg1 matches 2 at @s positioned ^ ^ ^0.2 run function weapon:gun/move
execute if score #speed-decimal reg1 matches 3 at @s positioned ^ ^ ^0.3 run function weapon:gun/move
execute if score #speed-decimal reg1 matches 4 at @s positioned ^ ^ ^0.4 run function weapon:gun/move
execute if score #speed-decimal reg1 matches 5 at @s positioned ^ ^ ^0.5 run function weapon:gun/move
execute if score #speed-decimal reg1 matches 6 at @s positioned ^ ^ ^0.6 run function weapon:gun/move
execute if score #speed-decimal reg1 matches 7 at @s positioned ^ ^ ^0.7 run function weapon:gun/move
execute if score #speed-decimal reg1 matches 8 at @s positioned ^ ^ ^0.8 run function weapon:gun/move
execute if score #speed-decimal reg1 matches 9 at @s positioned ^ ^ ^0.9 run function weapon:gun/move


#ブロック衝突だった場合着弾地点にパーティクル
execute if score #hit-flag reg1 matches 1 at @s run particle minecraft:explosion ^ ^ ^-1 0.1 0.1 0.1 0 1 force

#曳光弾ならパーティクル
execute as @s[tag=tracer,tag=tracer-red] at @s run particle minecraft:dust 1 0 0 2 ~ ~ ~ 0 0 0 1 1 force
execute as @s[tag=tracer,tag=tracer-lightblue] at @s run particle minecraft:dust 0 1 1 2 ~ ~ ~ 0 0 0 1 1 force

#hitしてたら弾を削除
execute if score #hit-flag reg1 >= #1 Num run kill @s

#弾の寿命を1減らし、0なら消す
scoreboard players remove @s age 1
kill @s[scores={age=..0}]

#タグ削除
execute at @s run tag @e[tag=hit-gun,distance=..2] remove hit-gun
execute at @s run tag @s remove gun-move-executer
tag @e[tag=gunner,distance=..25] remove gunner
