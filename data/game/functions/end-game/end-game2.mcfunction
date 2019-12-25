#飛行機の移動処理を停止
execute as @e[tag=plane-root] run function game:end-game/util/set-nomove
execute as @e[tag=plane-root] run function game:end-game/util/delete-plane

#ステージ個別処理
execute if score #global stage-id matches 1 run function game:stages/stage1/end-game/move-to-runway
execute if score #global stage-id matches 2 run function game:stages/stage1/end-game/move-to-runway
execute if score #global stage-id matches 3 run function game:stages/stage1/end-game/move-to-runway
execute if score #global stage-id matches 4 run function game:stages/stage4/end-game/move-to-runway
execute if score #global stage-id matches 5 run function game:end-game/stage-5/move-to-runway

#end-game3を遅延実行
schedule function game:end-game/end-game3 20
