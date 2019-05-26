###射程内に敵がいるか判定###
#実行者：機体

#以前の実行でついてたタグ除去
tag @e[tag=rear-gun-target-candidate,distance=..40] remove rear-gun-target-candidate
tag @e[tag=rear-gun-target,distance=..40] remove rear-gun-target

#indicator召喚
#summon minecraft:area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:[ki21-rear-gun-indicator,entity-nohit],Duration:1}
execute as @s at @s run tp 0-0-3-0-0 ^ ^ ^ ~90 ~

#スコア付与
execute as 0-0-3-0-0 run scoreboard players set @s offsetX 0
execute as 0-0-3-0-0 run scoreboard players set @s offsetY 23227
execute as 0-0-3-0-0 run scoreboard players set @s offsetZ 0

#位置移動
execute as 0-0-3-0-0 at @s rotated ~-90 ~ run function plane:position/calc-offset
execute as 0-0-3-0-0 at 0-0-3-0-0 rotated ~-90 ~ run tp 0-0-3-0-0 ^ ^ ^32.627

#機銃32B以内に敵がいるか判定
execute as @e[tag=enemy-plane,distance=..40] at 0-0-3-0-0 run tag @s[distance=..32] add rear-gun-target-candidate

#機体上側方向に敵がいるか判定
#execute at @s facing entity 0-0-3-0-0 feet as @e[tag=rear-gun-target-candidate,distance=..40] positioned ^ ^ ^512 run tag @s[distance=..512] remove rear-gun-target-candidate

#判定内にいて一番近い敵にタグ付け
tag @e[tag=rear-gun-target-candidate,distance=..40,limit=1,sort=nearest] add rear-gun-target

#AEC削除
#kill @e[tag=ki21-rear-gun-indicator,distance=..5]

#タグ除去
tag @e[tag=rear-gun-target-candidate,distance=..40] remove rear-gun-target-candidate
