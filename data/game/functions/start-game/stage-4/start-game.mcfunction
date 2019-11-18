#startgame1→2の順で実行　1,2は6tick開ける
function game:start-game/util/set-game-id
function game:start-game/stage-4/forceload
function game:start-game/stage-4/set-bossbar
function game:in-game-event/stage-4/summon-target
function game:start-game/stage-4/move-to-stage
function game:start-game/stage-4/show-message
execute as @a run function bgm:bunretsu/play

#開始効果音
execute as @a at @s run playsound minecraft:entity.ender_dragon.ambient master @s ~ ~ ~ 200 0.5