#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=a6m2-root] at @s run function plane:position/a6m2-position
#実行者：機体　実行位置：機体

#seatの位置修正
execute at @s[tag=has-rider] run tp @e[tag=plane-seat,tag=position-target] ^ ^ ^-2.5
execute at @s[tag=!has-rider] run tp @e[tag=plane-seat,tag=position-target] ^ ^0.5 ^0.8
