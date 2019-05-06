summon minecraft:shulker ~ ~ ~ {NoAI:1b,Tags:[aa88,aa88-init]}

scoreboard players set @e[tag=aa88-init] ammunition1 1000
scoreboard players set @e[tag=aa88-init] w1-reload 0
scoreboard players set @e[tag=aa88-init] plane-id -1

tag @e[tag=aa88-init] remove aa88-init
