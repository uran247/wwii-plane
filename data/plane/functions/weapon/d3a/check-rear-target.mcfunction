###射程内に敵がいるか判定###
#実行者：機体

#以前の実行でついてたタグ除去
tag @e[tag=rear-gun-target-candidate,distance=..32] remove rear-gun-target-candidate
tag @e[tag=rear-gun-targe,distance=..32] remove rear-gun-target

#indicator召喚
summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[d3a-rear-gun-indicator,entity-nohit],Duration:1}

#スコア付与
scoreboard players set @e[tag=d3a-rear-gun-indicator,distance=..5] offsetX 0
scoreboard players set @e[tag=d3a-rear-gun-indicator,distance=..5] offsetY 1000
scoreboard players set @e[tag=d3a-rear-gun-indicator,distance=..5] offsetZ 0

#位置移動
execute at @s positioned ~ ~ ~ as @e[tag=d3a-rear-gun-indicator,distance=..5] run function plane:position/calc-offset

#後方32B以内に敵がいるか判定
execute at @s run tag @e[tag=enemy-plane,distance=..32] add rear-gun-target-candidate
execute at @s as @e[tag=rear-gun-target-candidate,distance=..32] positioned ^ ^ ^-512 run tag @s[distance=512..] remove rear-gun-target-candidate

#機体上側方向に敵がいるか判定
execute at @s facing entity @e[tag=d3a-rear-gun-indicator,distance=..5] feet as @e[tag=rear-gun-target-candidate,distance=..32] positioned ^ ^ ^512 run tag @s[distance=..512] remove rear-gun-target-candidate

#判定内にいて一番近い敵にタグ付け
tag @e[tag=rear-gun-target-candidate,distance=..32,limit=1,sort=nearest] add rear-gun-target

#AEC削除
kill @e[tag=d3a-rear-gun-indicator,distance=..5]

