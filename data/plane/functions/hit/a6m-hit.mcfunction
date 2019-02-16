#機体当たり判定内にエンティティが存在しているか確認して、いたらタグ付けする
#胴体命中と翼命中で違うタグを付けること
#hit/hitから呼び出される
#実行者：機体　実行位置：機体
#利用可能タグ：a6m-hit-executer→機体

#実行者にタグ付け
tag @s add a6m-hit-executer

#胴体命中判定
#半径9B以内を候補とする
execute positioned ^0.3 ^1.2 ^ as @e[distance=..4] unless score @s plane-id = @e[tag=a6m-hit-executer,limit=1,distance=..11] plane-id run tag @s add hit-body-candidate

#胴に重なってない部分を除く
execute positioned ^0.3 ^1.2 ^ as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..11] positioned ^500.5 ^ ^ run tag @s[distance=..500] remove hit-body-candidate
execute positioned ^0.3 ^1.2 ^ as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..11] positioned ^-500.5 ^ ^ run tag @s[distance=..500] remove hit-body-candidate
execute positioned ^0.3 ^1.2 ^ as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..11] positioned ^ ^501 ^ run tag @s[distance=..500] remove hit-body-candidate
execute positioned ^0.3 ^1.2 ^ as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..11] positioned ^ ^-501 ^ run tag @s[distance=..500] remove hit-body-candidate

#重なってたやつはタグ付け
execute as @e[distance=..11,tag=hit-body-candidate] run scoreboard players operation @s plane-id = @e[tag=a6m-hit-executer,limit=1,distance=..11] plane-id
tag @e[distance=..11,tag=hit-body-candidate] add hit-body

execute as @e[tag=hit-body] run say 胴体


#主翼命中判定
#半径10B以内で胴体に当たってないやつを候補とする
execute positioned ^0.3 ^1.3 ^1.8 as @e[distance=..6,tag=!hit-body] unless score @s plane-id = @e[tag=a6m-hit-executer,limit=1,distance=..12] plane-id run tag @s add hit-wing-candidate

#主翼に重なってない部分を除く
execute positioned ^0.3 ^1.3 ^1.8 as @e[distance=..6] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..12] positioned ^ ^ ^501 run tag @s[distance=..500] remove hit-wing-candidate
execute positioned ^0.3 ^1.3 ^1.8 as @e[distance=..6] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..12] positioned ^ ^ ^-501 run tag @s[distance=..500] remove hit-wing-candidate
execute positioned ^0.3 ^1.3 ^1.8 as @e[distance=..6] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..12] positioned ^ ^500.5 ^ run tag @s[distance=..500] remove hit-wing-candidate
execute positioned ^0.3 ^1.3 ^1.8 as @e[distance=..6] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..12] positioned ^ ^-500.5 ^ run tag @s[distance=..500] remove hit-wing-candidate

#重なってたやつはタグ付け
execute as @e[distance=..11,tag=hit-wing-candidate] run scoreboard players operation @s plane-id = @e[tag=a6m-hit-executer,limit=1,distance=..11] plane-id
tag @e[distance=..11,tag=hit-wing-candidate] add hit-wing

execute as @e[tag=hit-wing] run say 主翼


#水平尾翼命中判定
#半径4B以内で胴体に当たってないやつを候補とする
execute positioned ^0.3 ^1.4 ^-3.3 as @e[distance=..4,tag=!hit-body] unless score @s plane-id = @e[tag=a6m-hit-executer,limit=1,distance=..8] plane-id run tag @s add hit-hrtail-candidate

#水平尾翼に重なってない部分を除く
execute positioned ^0.3 ^1.4 ^-3.3 as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..9] positioned ^ ^ ^501 run tag @s[distance=..500] remove hit-hrtail-candidate
execute positioned ^0.3 ^1.4 ^-3.3 as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..9] positioned ^ ^ ^-500.5 run tag @s[distance=..500] remove hit-hrtail-candidate
execute positioned ^0.3 ^1.4 ^-3.3 as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..9] positioned ^ ^500.5 ^ run tag @s[distance=..500] remove hit-hrtail-candidate
execute positioned ^0.3 ^1.4 ^-3.3 as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..9] positioned ^ ^-500.5 ^ run tag @s[distance=..500] remove hit-hrtail-candidate

#重なってたやつはタグ付け
execute as @e[distance=..9,tag=hit-hrtail-candidate] run scoreboard players operation @s plane-id = @e[tag=a6m-hit-executer,limit=1,distance=..9] plane-id
tag @e[distance=..9,tag=hit-hrtail-candidate] add hit-hrtail

execute as @e[tag=hit-hrtail] run say 水平尾翼


#垂直尾翼命中判定
#半径4B以内で胴体に当たってないやつを候補とする
execute positioned ^0.3 ^2 ^-3.5 as @e[distance=..4,tag=!hit-body] unless score @s plane-id = @e[tag=a6m-hit-executer,limit=1,distance=..8] plane-id run tag @s add hit-vrtail-candidate

#水平尾翼に重なってない部分を除く
execute positioned ^0.3 ^2 ^-3.5 as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..9] positioned ^500.5 ^ ^ run tag @s[distance=..500] remove hit-vrtail-candidate
execute positioned ^0.3 ^2 ^-3.5 as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..9] positioned ^-500.5 ^ ^ run tag @s[distance=..500] remove hit-vrtail-candidate
execute positioned ^0.3 ^2 ^-3.5 as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..9] positioned ^ ^501 ^ run tag @s[distance=..500] remove hit-vrtail-candidate
execute positioned ^0.3 ^2 ^-3.5 as @e[distance=..4] rotated as @e[tag=a6m-hit-executer,limit=1,distance=..9] positioned ^ ^-501 ^ run tag @s[distance=..500] remove hit-vrtail-candidate

#重なってたやつはタグ付け
execute as @e[distance=..9,tag=hit-vrtail-candidate] run scoreboard players operation @s plane-id = @e[tag=a6m-hit-executer,limit=1,distance=..9] plane-id
tag @e[distance=..9,tag=hit-vrtail-candidate] add hit-vrtail

execute as @e[tag=hit-vrtail] run say 垂直尾翼


#タグ外し
tag @e[distance=..20,tag=hit-body-candidate] add hit-body-candidate
tag @e[distance=..20,tag=hit-body] remove hit-body
tag @e[distance=..20,tag=hit-wing-candidate] add hit-wing-candidate
tag @e[distance=..20,tag=hit-wing] remove hit-wing
tag @e[distance=..20,tag=hit-hrtail-candidate] add hit-hrtail-candidate
tag @e[distance=..20,tag=hit-hrtail] remove hit-hrtail
tag @e[distance=..20,tag=hit-vrtail-candidate] add hit-vrtail-candidate
tag @e[distance=..20,tag=hit-vrtail] remove hit-vrtail
tag @s remove a6m-hit-executer
