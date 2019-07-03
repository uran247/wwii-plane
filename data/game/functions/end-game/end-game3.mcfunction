#stageごと処理
execute if score #global stage-id matches 1 run function game:end-game/stage-1/transport-items
execute if score #global stage-id matches 2 run function game:end-game/stage-1/transport-items
execute if score #global stage-id matches 3 run function game:end-game/stage-1/transport-items

#共通処理
function game:end-game/move-to-lobby
function game:end-game/reset-stage-id

