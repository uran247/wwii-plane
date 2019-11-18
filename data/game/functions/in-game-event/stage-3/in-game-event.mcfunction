#目印セット
execute as @e[tag=stage2,tag=mark,x=-1913,y=255,z=-1766,distance=..1] at @s run function game:in-game-event/util/set-circle

#基地HPをクリアスコアに代入
execute as @e[tag=enemy-base] store result score #now-score reg1 run data get entity @s HandItems[0].tag.BaseHP
scoreboard players operation #now-score clear-score = #global clear-score
scoreboard players operation #now-score clear-score -= #now-score reg1

#clear-rank設定
execute if score #game time matches ..7000 run scoreboard players set #clear-rank clear-score 0
execute if score #game time matches 7001..8500 run scoreboard players set #clear-rank clear-score 1
execute if score #game time matches 8501..10000 run scoreboard players set #clear-rank clear-score 2
execute if score #game time matches 10001.. run scoreboard players set #clear-rank clear-score 3