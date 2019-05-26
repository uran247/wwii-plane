#ヨーの変化量を設定
#input: entity:機体
#return: スコア:#max-yaw return
scoreboard players operation #max-yaw return = @s yaw-speed
execute if entity @s[scores={radder=0}] run scoreboard players operation #max-yaw return /= #2 Num
execute if entity @s[tag=destroyed] run scoreboard players set #max-yaw return 0
