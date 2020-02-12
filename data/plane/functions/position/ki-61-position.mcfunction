#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=ki61-root] at @s run function plane:position/ki61-position
#実行者：機体　実行位置：機体

#seatの位置修正
execute at @s[tag=has-rider] run tp @e[tag=plane-seat,tag=target-parts] ^ ^-0.7 ^-1.3
execute at @s[tag=!has-rider] run tp @e[tag=plane-seat,tag=target-parts] ^ ^0.7 ^0.5
