#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=d3a-root] at @s run function plane:position/d3a-position
#実行者：機体　実行位置：機体

#seatの位置修正
execute at @s[tag=has-rider] run tp @e[tag=plane-seat,tag=position-target] ^ ^ ^-3.7
execute at @s[tag=!has-rider] run tp @e[tag=plane-seat,tag=position-target] ^ ^0.6 ^1

#爆弾装備タグがついていて爆弾が0なら召喚
execute store result score @s[tag=bombed] reg1 if entity @e[tag=position-target,tag=plane-bomb] 
execute as @s[tag=bombed,scores={ammunition2=3,reg1=0}] at @s run function summon:d3a/d3a-bomb

