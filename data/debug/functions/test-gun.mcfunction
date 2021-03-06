#機銃テスト
#実行者：コンソール、コマブロ

#召喚
summon armor_stand ~ ~ ~ {NoGravity:1,Tags:[projectile,gun,12p7mm,gun-init,tracer-orange,entity-nohit,tracer,offset-base,offset-base],Invisible:1}

#スコア付与
scoreboard players set @e[tag=gun-init,distance=..5] speed 100
scoreboard players set @e[tag=gun-init,distance=..5] damage 8
scoreboard players set @e[tag=gun-init,distance=..5,type=armor_stand] max-age 25
scoreboard players set @e[tag=gun-init,distance=..5] plane-id 1

#向きを機体方向に向ける
execute at @s run summon minecraft:area_effect_cloud ^ ^ ^150 {Duration:0,Tags:[gun-indicator,entity-nohit]}
execute as @e[tag=gun-init,distance=..20] at @s run tp @s ~ ~ ~ facing entity @e[tag=cockpit,distance=..220,limit=1]

#音
execute if score #sound reg1 matches 0 run playsound minecraft:weapon.gun-7p7m.fire master @a ~ ~ ~ 1 1 1

#終了処理
kill @e[tag=gun-indicator,distance=..220]
tag @e[tag=gun-init,distance=..20] remove gun-init
#scoreboard players set @p rightClick 0


