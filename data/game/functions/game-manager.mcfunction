#ゲームの状態を監視してアクション

#進捗度をバーに反映
execute store result bossbar minecraft:game-progress value run scoreboard players get #global shootdown

#game-idが異なるenemy-targetをすべてkill
execute as @e[tag=enemy-target] unless score @s game-id = #global game-id run kill @s


#クリアスコアに達したらゲーム終了
execute if score #global shootdown >= #global clear-score run function game:end-game/end-game1
execute if entity @e[type=minecraft:area_effect_cloud,tag=end-game-delay,x=0,y=1,z=0,nbt={Age:75}] run function game:end-game/end-game2
execute if entity @e[type=minecraft:area_effect_cloud,tag=end-game-delay,x=0,y=1,z=0,nbt={Age:76}] run tp @a 0 140 0

