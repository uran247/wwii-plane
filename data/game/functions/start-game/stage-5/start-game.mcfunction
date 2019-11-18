#startgame1→2の順で実行　1,2は6tick開ける
function game:start-game/util/set-game-id
function game:start-game/stage-5/forceload
function game:start-game/stage-5/set-bossbar
function game:start-game/stage-5/set-score
function game:start-game/stage-5/summon-target
function game:start-game/stage-5/move-to-stage
function game:start-game/stage-5/show-message
execute as @a run function bgm:bunretsu/play

#開始効果音
execute as @a at @s run playsound minecraft:entity.ender_dragon.ambient master @s ~ ~ ~ 200 0.5