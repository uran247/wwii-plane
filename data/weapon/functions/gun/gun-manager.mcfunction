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

#hitしたか確認
function weapon:gun/hit/hit

#ダメージ処理
execute if score #hit-flag reg1 matches 2 run function weapon:gun/damage/damage

#命中エンティティにパーティクル
execute if score #hit-flag reg1 matches 2 at @e[tag=hit-gun,distance=..20] run particle minecraft:explosion ^ ^ ^ 0.1 0.1 0.1 0 1 force

#命中エンティティがいないなら衝突位置のブロックか到達地点まで移動
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
execute as @s[tag=tracer,tag=tracer-red] at @s run particle minecraft:dust 1 0 0 2 ~ ~ ~ 0 0 0 20000 1 force
execute as @s[tag=tracer,tag=tracer-lightblue] at @s run particle minecraft:dust 0 1 1 2 ~ ~ ~ 0 0 0 20000 1 force
execute as @s[tag=tracer,tag=tracer-orange] at @s run particle minecraft:dust 1 0.547 0 2 ~ ~ ~ 0 0 0 20000 1 force

#hitしてたら弾を削除
execute if score #hit-flag reg1 >= #1 Num run kill @s

#タグ削除
tag @e[tag=hit-gun] remove hit-gun
execute at @s run tag @s remove gun-move-executer
tag @e[tag=gunner,distance=..25] remove gunner
