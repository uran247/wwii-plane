#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=g4m1-root] at @s run function plane:position/g4m1-position
#実行者：機体　実行位置：機体

#seatの位置修正
execute at @s[tag=has-rider] run tp @e[tag=plane-seat,tag=target-parts,type=armor_stand] ^ ^2.5 ^-5
execute at @s[tag=!has-rider] run tp @e[tag=plane-seat,tag=target-parts] ^0.5 ^0.7 ^8

#爆弾装備タグがついていて爆弾が0なら召喚 爆弾召喚無しのため機動力補正のみつける
#execute store result score @s[tag=bombed] reg1 if entity @e[tag=target-parts,tag=plane-bomb] 
#execute as @s[tag=torpedo,tag=bombed,scores={ammunition1=1,reg1=0}] at @s run function plane:summon/g4m1/torpedo
execute as @s[tag=250kg,tag=bombed,scores={ammunition1=4}] at @s run scoreboard players set @e[tag=body,tag=target-parts,limit=1] accelerate-cor -4
execute as @s[tag=250kg,tag=bombed,scores={ammunition1=4}] at @s run scoreboard players set @e[tag=body,tag=target-parts,limit=1] pitch-speed-cor -8
execute as @s[tag=250kg,tag=bombed,scores={ammunition1=4}] at @s run scoreboard players set @e[tag=body,tag=target-parts,limit=1] yaw-speed-cor -8
execute as @s[tag=800kg,tag=bombed,scores={ammunition1=1}] at @s run scoreboard players set @e[tag=body,tag=target-parts,limit=1] accelerate-cor -3
execute as @s[tag=800kg,tag=bombed,scores={ammunition1=1}] at @s run scoreboard players set @e[tag=body,tag=target-parts,limit=1] pitch-speed-cor -6
execute as @s[tag=800kg,tag=bombed,scores={ammunition1=1}] at @s run scoreboard players set @e[tag=body,tag=target-parts,limit=1] yaw-speed-cor -6

#tellraw @p [{"nbt":"Pos","entity":"@s"}] 

