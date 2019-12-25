#敵の数が０になったら召喚
execute store result score #enemy-num reg1 if entity @e[tag=enemy-target]
execute if score #enemy-num reg1 matches 0 run function game:in-game-event/stage-1/summon-target

#目印セット
execute as @e[tag=stage1,tag=mark,x=-1788,y=255,z=-1884,distance=..1] at @s run function game:in-game-event/util/set-circle

#撃墜スコアをクリアスコアに代入
scoreboard players operation #now-score clear-score = #global shootdown

#clear-rank設定
execute if score #game time matches ..4000 run scoreboard players set #clear-rank clear-score 0
execute if score #game time matches 4001..5000 run scoreboard players set #clear-rank clear-score 1
execute if score #game time matches 5001..6000 run scoreboard players set #clear-rank clear-score 2
execute if score #game time matches 6001.. run scoreboard players set #clear-rank clear-score 3
