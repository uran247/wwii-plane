#ステージIDに応じてチャンクロード　-1888 96 -2112
execute if score @p stage-id matches 1 run summon minecraft:arrow 0 140 0 {xTile:-1888,yTile:96,zTile:-2112}

#ステージIDに応じて起点召喚
execute if score @p stage-id matches 1 run summon area_effect_cloud -1888 97 -2112 {Particle:"ambient_entity_effect",Age:20,Tags:["base-point"]}

#debug
#execute as @e[tag=base-point] run say aec