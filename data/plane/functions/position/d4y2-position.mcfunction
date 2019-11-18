#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=d4y2-root] at @s run function plane:position/d4y2-position
#実行者：機体　実行位置：機体

#seatの位置修正
execute at @s[tag=has-rider] run tp @e[tag=plane-seat,tag=position-target] ^ ^ ^-2.2
execute at @s[tag=!has-rider] run tp @e[tag=plane-seat,tag=position-target] ^0.5 ^0.6 ^3

#爆弾装備タグがついていて爆弾が0なら召喚
execute store result score @s[tag=bombed] reg1 if entity @e[tag=position-target,tag=plane-bomb] 
execute as @s[tag=bombed,scores={ammunition2=3,reg1=0}] at @s run function plane:summon/d4y2/d4y2-bomb
execute if entity @s[tag=bombed,scores={ammunition2=3,reg1=0}] as @e[tag=d4y2,tag=!dropping,tag=plane-bomb,distance=..10] if score @s plane-id = #plane-id reg1 run tag @s add position-target

