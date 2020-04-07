#入力：entity @e[tag=big-phantom1,tag=has-skill]
#処理：ビッグファントムのスキルを使用

#対空砲個数カウント
execute store result score #aa-count reg1 if entity @e[tag=aerial-aa]

#対空砲が指定個数以下なら召喚
execute if score #aa-count reg1 matches ..8 positioned ^ ^ ^20 run function mob:summon/aerial-aa
execute if score #aa-count reg1 matches ..8 positioned ^ ^ ^-20 run function mob:summon/aerial-aa
execute if score #aa-count reg1 matches ..8 positioned ^20 ^ ^ run function mob:summon/aerial-aa
execute if score #aa-count reg1 matches ..8 positioned ^-20 ^ ^ run function mob:summon/aerial-aa

#対空砲が指定個数以上なら遠くの対空砲を近くに寄せる
execute unless score #aa-count reg1 matches ..8 positioned ^ ^ ^20 run tp @e[tag=aerial-aa,sort=furthest,limit=1] ~ ~ ~
execute unless score #aa-count reg1 matches ..8 positioned ^ ^ ^-20 run tp @e[tag=aerial-aa,sort=furthest,limit=1] ~ ~ ~
execute unless score #aa-count reg1 matches ..8 positioned ^20 ^ ^ run tp @e[tag=aerial-aa,sort=furthest,limit=1] ~ ~ ~
execute unless score #aa-count reg1 matches ..8 positioned ^-20 ^ ^ run tp @e[tag=aerial-aa,sort=furthest,limit=1] ~ ~ ~


#game-idを付与
execute as @e[tag=aerial-aa,tag=!has-gameid] store result score @s game-id run scoreboard players get #global game-id
execute as @e[tag=aerial-aa,tag=!has-gameid] run tag @s add has-gameid

#スキルct設定
scoreboard players operation @s skill-ct = @s max-skill-ct

