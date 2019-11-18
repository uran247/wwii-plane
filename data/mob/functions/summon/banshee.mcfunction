#召喚
summon phantom ~ ~ ~ {Health:60f,Attributes:[{Name:generic.maxHealth,Base:60}],Glowing:0,CustomName:"{\"text\":\"バンシー\"}",Tags:[banshee,no-burn,banshee-init,enemy-plane,enemy,has-size,size30],Size:35,PersistenceRequired:1b,Passengers:[{id:"minecraft:skeleton",PersistenceRequired:1b,Glowing:0,Tags:[banshee-rider,banshee-init,enemy],ArmorItems:[{},{},{},{id:"minecraft:diamond_helmet",Count:1b}]}]}

#パラメータ代入
scoreboard players set @e[tag=banshee-init] AngX 0
scoreboard players set @e[tag=banshee-init] AngY 0
scoreboard players set @e[tag=banshee-init] speed 11000
scoreboard players set @e[tag=banshee-init] pitch-speed 160
scoreboard players set @e[tag=banshee-init] yaw-speed 160
scoreboard players set @e[tag=banshee-init] plane-id -1
scoreboard players set @e[tag=banshee-init,tag=banshee] ammunition1 600
scoreboard players set @e[tag=banshee-init,tag=banshee] w1-reload 0
scoreboard players operation @e[tag=banshee-init,tag=banshee] game-id = #global game-id

#初期化タグ除去
tag @e[tag=banshee-init] remove banshee-init

