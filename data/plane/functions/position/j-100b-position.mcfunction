#角度スコアを航空機に反映する、パーツの位置を調整する
#実行方法:execute as @e[tag=a5m-root] at @s run function plane:position/a5m-position
#実行者：機体　実行位置：機体

#seatの位置修正
execute at @s[tag=has-rider] run tp @e[tag=plane-seat,tag=target-parts] ^ ^ ^-2.5
execute at @s[tag=!has-rider] run tp @e[tag=plane-seat,tag=target-parts] ^ ^0.3 ^0.8

#爆弾装備タグがついていて爆弾が0なら召喚
execute store result score @s[tag=missiled] reg1 if entity @e[tag=target-parts,tag=plane-missile]
execute as @s[tag=missiled,scores={ammunition2=2..,reg1=0}] at @s run function plane:summon/j-100b/j-100b-aam
execute if entity @s[tag=missiled,scores={ammunition2=2..,reg1=0}] as @e[tag=j100b,tag=!dropping,tag=plane-missile,distance=..10] if score @s plane-id = #plane-id reg1 run tag @s add target-parts
