#ピッチの変化量を設定
#input: entity:機体
#return: スコア:#max-pitch return
scoreboard players operation #max-pitch return = @s pitch-speed
execute if entity @s[scores={elevetor=0}] run scoreboard players operation #max-pitch return /= #2 Num
execute if entity @s[tag=destroyed] run scoreboard players set #max-pitch return 0
