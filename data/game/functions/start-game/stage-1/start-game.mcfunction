#startgame1→2の順で実行　1,2は6tick開ける
function game:start-game/stage-1/set-game-id
function game:start-game/stage-1/summon-spawner
function game:start-game/stage-1/move-to-stage
function game:start-game/stage-1/show-message
function game:start-game/stage-1/set-bossbar

#開始効果音
execute as @a at @s run playsound minecraft:entity.ender_dragon.ambient master @s ~ ~ ~ 200 0.5