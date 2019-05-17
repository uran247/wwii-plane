#入力　エンティティ：弾丸　スコア：#speed reg1(tick/m)　座標：弾丸　タグ：gunner,gun-move-executer
#処理　命中エンティティにhit-gunをつける
#戻り　hit-gunタグのついた命中対象

#候補にタグ付け　タグ付け範囲は#speedに応じて変化
#execute if score #speed reg1 matches 1 positioned ^ ^ ^0.5 run tag @e[tag=!gun,tag=!gunner,distance=..0.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 2 positioned ^ ^ ^1 run tag @e[tag=!gun,tag=!gunner,distance=..1,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 3 positioned ^ ^ ^1.5 run tag @e[tag=!gun,tag=!gunner,distance=..1.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 4 positioned ^ ^ ^2 run tag @e[tag=!gun,tag=!gunner,distance=..2,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 5 positioned ^ ^ ^2.5 run tag @e[tag=!gun,tag=!gunner,distance=..2.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 6 positioned ^ ^ ^3 run tag @e[tag=!gun,tag=!gunner,distance=..3,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 7 positioned ^ ^ ^3.5 run tag @e[tag=!gun,tag=!gunner,distance=..3.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 8 positioned ^ ^ ^4 run tag @e[tag=!gun,tag=!gunner,distance=..4,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 9 positioned ^ ^ ^4.5 run tag @e[tag=!gun,tag=!gunner,distance=..4.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 10 positioned ^ ^ ^5 run tag @e[tag=!gun,tag=!gunner,distance=..5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 11 positioned ^ ^ ^5.5 run tag @e[tag=!gun,tag=!gunner,distance=..5.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 12 positioned ^ ^ ^6 run tag @e[tag=!gun,tag=!gunner,distance=..6,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 13 positioned ^ ^ ^6.5 run tag @e[tag=!gun,tag=!gunner,distance=..6.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 14 positioned ^ ^ ^7 run tag @e[tag=!gun,tag=!gunner,distance=..7,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 15 positioned ^ ^ ^7.5 run tag @e[tag=!gun,tag=!gunner,distance=..7.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 16 positioned ^ ^ ^8 run tag @e[tag=!gun,tag=!gunner,distance=..8,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 17 positioned ^ ^ ^8.5 run tag @e[tag=!gun,tag=!gunner,distance=..8.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 18 positioned ^ ^ ^9 run tag @e[tag=!gun,tag=!gunner,distance=..9,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 19 positioned ^ ^ ^9.5 run tag @e[tag=!gun,tag=!gunner,distance=..9.5,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
#execute if score #speed reg1 matches 20 positioned ^ ^ ^10 run tag @e[tag=!gun,tag=!gunner,distance=..10,tag=!entity-nohit,tag=!plane-rider] add hit-candidate

#直線上にいないやつのタグを剥がす　幅1B
execute positioned ^ ^ ^10 as @e[tag=hit-candidate,distance=..10] positioned ^1000.8 ^ ^10 run tag @s[distance=..1000] remove hit-candidate
execute positioned ^ ^ ^10 as @e[tag=hit-candidate,distance=..10] positioned ^-1000.8 ^ ^10 run tag @s[distance=..1000] remove hit-candidate
execute positioned ^ ^ ^10 as @e[tag=hit-candidate,distance=..10] positioned ^ ^1000.8 ^10 run tag @s[distance=..1000] remove hit-candidate
execute positioned ^ ^ ^10 as @e[tag=hit-candidate,distance=..10] positioned ^ ^-1000.8 ^10 run tag @s[distance=..1000] remove hit-candidate
tag @e[tag=hit-candidate,limit=1,sort=nearest,distance=..20,tag=!gunner] add hit-gun
execute positioned ^ ^ ^10 run tag @e[tag=hit-candidate,distance=..20] remove hit-candidate