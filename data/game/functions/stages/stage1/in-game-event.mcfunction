#敵の数が０になったら召喚
execute store result score #enemy-num reg1 if entity @e[tag=enemy-target]
execute if score #enemy-num reg1 matches 0 run function game:stages/stage1/in-game-event/summon-target

#目印セット
execute as @e[tag=stage1,tag=mark,x=-1788,y=255,z=-1884,distance=..1] at @s run function game:in-game-event/util/set-circle

#撃墜スコアをクリアスコアに代入
scoreboard players operation #now-score clear-score = #global shootdown

#clear-rank設定
execute if score #game time matches ..4000 run scoreboard players set #clear-rank clear-score 0
execute if score #game time matches 4001..5000 run scoreboard players set #clear-rank clear-score 1
execute if score #game time matches 5001..6000 run scoreboard players set #clear-rank clear-score 2
execute if score #game time matches 6001.. run scoreboard players set #clear-rank clear-score 3


#イベントフラグ
#BGM開始　
execute if score #phase event-flag matches 0 if entity @p[tag=plane-rider] run scoreboard players set #phase event-flag 1
execute if score #phase event-flag matches 1 as @a at @s run function bgm:bunretsu/play
#BGM開始したらフラグを次フェーズへ
execute if score #phase event-flag matches 1 run scoreboard players set #phase event-flag 2

#目標地点まで向かう指示
execute if score #phase event-flag matches 2 run title @a times 0 80 20
execute if score #phase event-flag matches 2 run title @a title {"text":"目標地点へ向かえ","color":"yellow","bold":false}
#目標地点へ到達したらフラグを次フェーズへ
execute if score #phase event-flag matches 2 positioned -1852 0 -1948 if entity @p[dx=128,dy=1024,dz=128] run scoreboard players set #phase event-flag 3
