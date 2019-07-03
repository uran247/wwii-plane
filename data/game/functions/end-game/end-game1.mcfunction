#game終了処理を実行
execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0
function game:end-game/show-message
function game:end-game/delete-bossbar

#end-game2を遅延実行
schedule function game:end-game/end-game2 80
