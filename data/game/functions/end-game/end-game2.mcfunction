#共通処理
execute if score #global stage-id matches 1 run function game:end-game/stage-1/move-to-runway
execute if score #global stage-id matches 2 run function game:end-game/stage-1/move-to-runway
execute if score #global stage-id matches 3 run function game:end-game/stage-1/move-to-runway

#end-game3を遅延実行
schedule function game:end-game/end-game3 20
