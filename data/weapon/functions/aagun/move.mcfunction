#爆弾の落下処理
#実行者：砲弾

#実行者にタグ付け
tag @s add aagun-move-executer

#自分と同じID持ちのエンティティにタグ付け
execute as @e[distance=..20] if score @s plane-id = @e[tag=aagun-move-executer,distance=..20,limit=1] plane-id run tag @s add aaguner

#### 移動&ヒット判定 ####
#0.1-0.9移動
scoreboard players operation #speed reg1 = @s speed
scoreboard players operation #speed reg1 %= #10 Num
execute if score #speed reg1 matches 1 at @s run tp @s ^ ^ ^0.1
execute if score #speed reg1 matches 2 at @s run tp @s ^ ^ ^0.2
execute if score #speed reg1 matches 3 at @s run tp @s ^ ^ ^0.3
execute if score #speed reg1 matches 4 at @s run tp @s ^ ^ ^0.4
execute if score #speed reg1 matches 5 at @s run tp @s ^ ^ ^0.5
execute if score #speed reg1 matches 6 at @s run tp @s ^ ^ ^0.6
execute if score #speed reg1 matches 7 at @s run tp @s ^ ^ ^0.7
execute if score #speed reg1 matches 8 at @s run tp @s ^ ^ ^0.8
execute if score #speed reg1 matches 9 at @s run tp @s ^ ^ ^0.9

#1-20移動
scoreboard players operation #speed reg1 = @s speed
scoreboard players operation #speed reg1 /= #10 Num

#ブロック、エンティティ衝突判定
execute at @s run function weapon:aagun/hit/hit

#移動　エンティティ命中無の場合
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #1 Num at @s rotated ~ ~ run tp @s ^ ^ ^1
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #2 Num at @s rotated ~ ~ run tp @s ^ ^ ^2
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #3 Num at @s rotated ~ ~ run tp @s ^ ^ ^3
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #4 Num at @s rotated ~ ~ run tp @s ^ ^ ^4
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #5 Num at @s rotated ~ ~ run tp @s ^ ^ ^5
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #6 Num at @s rotated ~ ~ run tp @s ^ ^ ^6
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #7 Num at @s rotated ~ ~ run tp @s ^ ^ ^7
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #8 Num at @s rotated ~ ~ run tp @s ^ ^ ^8
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #9 Num at @s rotated ~ ~ run tp @s ^ ^ ^9
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #10 Num at @s rotated ~ ~ run tp @s ^ ^ ^10
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #11 Num at @s rotated ~ ~ run tp @s ^ ^ ^11
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #12 Num at @s rotated ~ ~ run tp @s ^ ^ ^12
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #13 Num at @s rotated ~ ~ run tp @s ^ ^ ^13
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #14 Num at @s rotated ~ ~ run tp @s ^ ^ ^14
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #15 Num at @s rotated ~ ~ run tp @s ^ ^ ^15
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #16 Num at @s rotated ~ ~ run tp @s ^ ^ ^16
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #17 Num at @s rotated ~ ~ run tp @s ^ ^ ^17
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #18 Num at @s rotated ~ ~ run tp @s ^ ^ ^18
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #19 Num at @s rotated ~ ~ run tp @s ^ ^ ^19
execute unless entity @e[tag=hit-aagun,distance=..20] if score #speed reg1 = #20 Num at @s rotated ~ ~ run tp @s ^ ^ ^20

#命中したエンティティ位置に移動　エンティティ命中有の場合
execute at @s positioned as @e[tag=hit-aagun,distance=..20,limit=1,sort=nearest] run tp @s ~ ~ ~

#tellraw @a [{"text":"speed:"},{"score":{"name":"@s","objective":"speed"}},{"text":"Rotation[1]:"},{"score":{"name":"@s","objective":"reg10"}},{"text":"Pos[1]:"},{"score":{"name":"@s","objective":"reg11"}}]

#### age更新 + ダメージ処理 ####
scoreboard players remove @s age 1
#y座標がfuse-heightを超えたらageを0に
execute store result score @s reg4 run data get entity @s Pos[1] 1
execute if score @s reg4 > @s fuse-height run scoreboard players set @s age 0
#block/entityへhitしてたらageを0に
execute if score #hit-flag reg1 matches 1 run scoreboard players set @s age 0
#ageが0になったらダメージ処理発生
execute at @s[scores={age=..0}] run function weapon:aagun/hit/damage

#終了処理
tag @e[tag=hit-aagun,distance=..20] remove hit-aagun
tag @e[tag=aaguner,distance=..40] add aaguner
tag @s remove aagun-move-executer
kill @s[scores={age=0}]
execute if score #hit-flag reg1 matches 1 run kill @s