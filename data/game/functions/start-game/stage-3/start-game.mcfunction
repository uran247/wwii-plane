#startgame1→2の順で実行　1,2は6tick開ける
function game:start-game/stage-3/set-game-id
function game:start-game/stage-3/summon-spawner
function game:start-game/stage-3/summon-enemy
function game:start-game/stage-3/move-to-stage
function game:start-game/stage-3/show-message
function game:start-game/stage-3/set-bossbar

#開始効果音
execute as @a at @s run playsound minecraft:entity.ender_dragon.ambient master @s ~ ~ ~ 200 0.5