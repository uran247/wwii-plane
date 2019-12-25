#選択されるステージを決定

#ステージを選択
#scoreboard players set #global stage-id 1

#mob最大数をセット
scoreboard players set #max max-entity 10

#プレイ時間リセット
scoreboard players set #game time 0

#game開始フラグセット
scoreboard players set #is-in-game stage-id 1

#フラグセット
scoreboard players set #phase event-flag 0

#stageに応じたfunction実行
execute if score #global stage-id matches 1 run function game:stages/stage1/start-game
execute if score #global stage-id matches 2 run function game:stages/stage2/start-game
execute if score #global stage-id matches 3 run function game:stages/stage3/start-game
execute if score #global stage-id matches 4 run function game:stages/stage4/start-game
execute if score #global stage-id matches 5 run function game:start-game/stage-5/start-game