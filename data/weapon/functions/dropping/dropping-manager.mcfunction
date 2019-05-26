#爆弾の落下処理
#実行者：爆弾

#実行者にタグ付け
tag @s add bomb-move-executer

#自分と同じID持ちのエンティティにタグ付け
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[distance=..20] if score @s plane-id = #plane-id reg1 run tag @s add bomber

#移動と判定のため一時的に向きを90度回転
execute at @s run tp @s ~ ~ ~ ~-90 ~

#### 移動&ヒット判定 ####
#小数点以下の移動量決定
scoreboard players operation #speed-decimal reg1 = @s speed
scoreboard players operation #speed-decimal reg1 %= #10 Num
#整数部の移動量決定
scoreboard players operation #speed reg1 = @s speed
scoreboard players operation #speed reg1 /= #10 Num

#hitしたか確認
execute if score #speed-decimal reg1 matches 0 at @s run function weapon:dropping/hit/hit
execute if score #speed-decimal reg1 matches 1 at @s positioned ^ ^ ^0.1 run function weapon:dropping/hit/hit
execute if score #speed-decimal reg1 matches 2 at @s positioned ^ ^ ^0.2 run function weapon:dropping/hit/hit
execute if score #speed-decimal reg1 matches 3 at @s positioned ^ ^ ^0.3 run function weapon:dropping/hit/hit
execute if score #speed-decimal reg1 matches 4 at @s positioned ^ ^ ^0.4 run function weapon:dropping/hit/hit
execute if score #speed-decimal reg1 matches 5 at @s positioned ^ ^ ^0.5 run function weapon:dropping/hit/hit
execute if score #speed-decimal reg1 matches 6 at @s positioned ^ ^ ^0.6 run function weapon:dropping/hit/hit
execute if score #speed-decimal reg1 matches 7 at @s positioned ^ ^ ^0.7 run function weapon:dropping/hit/hit
execute if score #speed-decimal reg1 matches 8 at @s positioned ^ ^ ^0.8 run function weapon:dropping/hit/hit
execute if score #speed-decimal reg1 matches 9 at @s positioned ^ ^ ^0.9 run function weapon:dropping/hit/hit

#移動　エンティティ命中無の場合
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 0 at @s run function weapon:dropping/move
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 1 at @s positioned ^ ^ ^0.1 run function weapon:dropping/move
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 2 at @s positioned ^ ^ ^0.2 run function weapon:dropping/move
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 3 at @s positioned ^ ^ ^0.3 run function weapon:dropping/move
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 4 at @s positioned ^ ^ ^0.4 run function weapon:dropping/move
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 5 at @s positioned ^ ^ ^0.5 run function weapon:dropping/move
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 6 at @s positioned ^ ^ ^0.6 run function weapon:dropping/move
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 7 at @s positioned ^ ^ ^0.7 run function weapon:dropping/move
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 8 at @s positioned ^ ^ ^0.8 run function weapon:dropping/move
execute unless score #hit-flag reg1 matches 2 if score #speed-decimal reg1 matches 9 at @s positioned ^ ^ ^0.9 run function weapon:dropping/move

#命中したエンティティ位置に移動　エンティティ命中有の場合
execute at @s positioned as @e[tag=hit-bomb,distance=..20,limit=1,sort=nearest] run tp @s ~ ~ ~

#### ダメージ処理 ####
#ダメージを与える
execute if score #hit-flag reg1 >= #1 Num at @s run function weapon:dropping/damage/damage

#tellraw @a [{"text":"speed:"},{"score":{"name":"@s","objective":"speed"}},{"text":"Rotation[1]:"},{"score":{"name":"@s","objective":"reg10"}},{"text":"Pos[1]:"},{"score":{"name":"@s","objective":"reg11"}}]

#向き修正
execute at @s run tp @s ~ ~ ~ ~90 ~0.2
execute store result score #x-ang reg1 run data get entity @s Rotation[1] 1
scoreboard players remove #x-ang reg1 90
execute store result entity @s Pose.RightArm[2] float 1 run scoreboard players get #x-ang reg1

#speedを上げる
scoreboard players operation #accelerate-decimal reg1 = @s age
scoreboard players operation #accelerate-decimal reg1 %= #10 Num
execute if score #accelerate-decimal reg1 matches 0 run scoreboard players add @s[scores={speed=..99}] speed 1

#age更新
scoreboard players remove @s age 1

#終了処理
tag @e[tag=hit-bomb,distance=..20] remove hit-bomb
tag @e[tag=bomber,distance=..40] add bomber
tag @s remove bomb-move-executer
kill @s[scores={age=0}]
execute if score #hit-flag reg1 >= #1 Num run kill @s