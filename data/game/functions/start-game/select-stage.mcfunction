#選択されるステージを決定

#ステージを選択
scoreboard players set #global stage-id 1

#mob最大数をセット
scoreboard players set #max max-entity 10

#プレイ時間リセット
scoreboard players set #game time 0

#stageに応じたfunction実行
execute if score #global stage-id matches 1 run function game:start-game/stage-1/start-game
execute if score #global stage-id matches 2 run function game:start-game/stage-2/start-game
execute if score #global stage-id matches 3 run function game:start-game/stage-3/start-game