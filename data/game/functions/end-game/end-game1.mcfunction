execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 200 0
function game:end-game/show-message
function game:end-game/delete-bossbar

#delay用AEC召喚
summon minecraft:area_effect_cloud 0 1 0 {Tags:[end-game-delay],Duration:80}
