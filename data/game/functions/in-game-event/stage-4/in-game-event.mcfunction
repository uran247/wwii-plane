#敵の数が０になったら召喚
execute store result score #enemy-num reg1 if entity @e[tag=enemy-target]
execute if score #enemy-num reg1 matches 0 run function game:in-game-event/stage-4/summon-target

#エンティティ数調整
execute if score #enemy-num reg1 > #max max-entity run kill @e[limit=1,tag=enemy-target,sort=random]

#エンティティ最大数変更
execute if score #global shootdown matches ..15 run scoreboard players set #max max-entity 3
execute if score #global shootdown matches 16.. run scoreboard players set #max max-entity 6

#目印セット
execute as 0-0-18-0-0 at @s run function game:in-game-event/util/set-circle
execute as 0-0-19-0-0 at @s run function game:in-game-event/util/set-circle
execute as 0-0-1a-0-0 at @s run function game:in-game-event/util/set-circle
execute as 0-0-1b-0-0 at @s run function game:in-game-event/util/set-circle
execute as 0-0-1c-0-0 at @s run function game:in-game-event/util/set-circle

#撃墜スコアをクリアスコアに代入
scoreboard players operation #now-score clear-score = #global shootdown

#clear-rank設定
execute if score #game time matches ..5000 run scoreboard players set #clear-rank clear-score 0
execute if score #game time matches 5001..6500 run scoreboard players set #clear-rank clear-score 1
execute if score #game time matches 6501..8000 run scoreboard players set #clear-rank clear-score 2
execute if score #game time matches 8001.. run scoreboard players set #clear-rank clear-score 3