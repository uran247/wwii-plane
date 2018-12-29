#爆弾の落下処理
#実行者：爆弾

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
#tellraw @p [{"score" : {"name":"@s", "objective":"reg1"}}, {"text":" "}, {"score" : {"name":"@e[tag=bombed,distance=..5,limit=1]", "objective":"age"}}]

#entity衝突判定
execute if score @s[tag=!hit-executer] reg1 >= #1 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #2 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #3 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #4 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #5 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #6 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #7 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #8 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #9 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #10 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #11 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #12 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #13 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #14 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #15 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #16 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #17 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #18 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #19 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer
execute if score @s[tag=!hit-executer] reg1 >= #20 Num at @s unless entity @e[tag=hit-bomb,distance=..1.5] at @s run tp @s ^ ^ ^1
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] run tag @e[tag=!bomb,distance=..1.5] add hit-bomb
execute at @s[tag=!hit-executer,tag=!bomb-nohit] unless entity @e[tag=hit-bomb,distance=..1.5] unless block ~ ~ ~ minecraft:air run tag @s add hit-executer

#speedを上げる
scoreboard players add @s[scores={speed=..199}] speed 1
execute at @s run tp @s ~ ~ ~ ~ ~2
execute store result entity @s Pose.RightArm[0] float 1 run data get entity @s Rotation[1] -1

#hitしたら弾を消す
execute if entity @e[tag=hit-bomb,distance=..1.5] run tag @s[tag=!bomb-nohit] add hit-executer

#ダメージ処理
execute at @s[tag=hit-executer] run summon minecraft:creeper ~ ~ ~ {Tags:[bomb-exp],ExplosionRadius:3b,Fuse:0,ActiveEffects:[{Id:14b,Amplifier:1b,Duration:1000000,ShowParticles:0b}]}
execute at @s[tag=hit-executer] store result entity @e[tag=bomb-exp,distance=..1,limit=1] ExplosionRadius byte 1 run scoreboard players get @s damage
execute at @s[tag=hit-executer] run say hit

#age更新
scoreboard players remove @s age 1

#当たり判定発生処理
execute if score @s age = @s no-hit run tag @s[tag=bomb-nohit] remove bomb-nohit
#execute as @s[tag=bomb-nohit] run say nohit 
#execute if score @s age = @s no-hit run say unlock

#終了処理
kill @s[scores={age=0}]
kill @s[tag=hit-executer]