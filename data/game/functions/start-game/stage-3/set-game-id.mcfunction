#UUID取得用エンティティ召喚
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[uuid,entity-nohit],Duration:1}

#UUID取得
execute as @e[tag=uuid,distance=..0.1] store result score #global game-id run data get entity @s UUIDMost 0.000000000233
