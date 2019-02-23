#ゲームの状態を監視してアクション

#進捗度をバーに反映
execute store result bossbar minecraft:game-progress value run scoreboard players get #global shootdown

#クリアスコアに達したらゲーム終了
execute if score #global shootdown >= #global clear-score run function game:end-game/end-game1
execute if entity @e[type=minecraft:area_effect_cloud,tag=end-game-delay,x=0,y=1,z=0,nbt={Age:79}] run function game:end-game/end-game2
