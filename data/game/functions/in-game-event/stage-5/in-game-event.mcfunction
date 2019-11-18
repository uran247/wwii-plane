execute as 0-0-1e-0-0 at @s run function game:in-game-event/util/set-circle

#味方基地破壊でゲームオーバー
execute store result bossbar minecraft:game-life value as @e[tag=friend-target] run data get entity @s HandItems[0].tag.BaseHP
execute as @e[tag=friend-target] store result score #base-hp reg1 run data get entity @s HandItems[0].tag.BaseHP
execute if score #base-hp reg1 matches ..0 run scoreboard players set #game-over clear-score 1

#撃墜スコアをクリアスコアに代入
scoreboard players operation #now-score clear-score = #global shootdown

#榴弾砲の向き強制変更
execute as @e[tag=howitzer152] at @s run tp @s ~ ~ ~ 160 -17

#榴弾の数調整
execute store result score #he-num reg1 if entity @e[tag=he]
execute if score #he-num reg1 > #30 Num run kill @e[limit=1,tag=he,sort=random]

#clear-rank設定
execute if score #game time matches ..7000 run scoreboard players set #clear-rank clear-score 0
execute if score #game time matches 7001..8500 run scoreboard players set #clear-rank clear-score 1
execute if score #game time matches 8501..10000 run scoreboard players set #clear-rank clear-score 2
execute if score #game time matches 10001.. run scoreboard players set #clear-rank clear-score 3