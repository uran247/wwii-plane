#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=g4m1-root] at @s run function plane:position/g4m1-position
#実行者：機体　実行位置：機体

#seatの位置修正
execute at @s[tag=has-rider] run tp @e[tag=plane-seat,tag=position-target,type=armor_stand] ^ ^2.5 ^-5
execute at @s[tag=!has-rider] run tp @e[tag=plane-seat,tag=position-target] ^0.5 ^1.7 ^8

#爆弾装備タグがついていて爆弾が0なら召喚
#execute store result score @s[tag=bombed] reg1 if entity @e[tag=position-target,tag=plane-bomb] 
#execute as @s[tag=torpedo,tag=bombed,scores={ammunition1=1,reg1=0}] at @s run function plane:summon/g4m1/torpedo
#execute as @s[tag=250kg,tag=bombed,scores={ammunition1=4,reg1=0}] at @s run function plane:summon/g4m1/g4m1-250kg-bomb

#tellraw @p [{"nbt":"Pos","entity":"@s"}] 

