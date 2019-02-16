#20mm機銃の命中判定
#なんブロック先で命中するか判定、ヒットしうるエンティティにタグをつける
#gun/moveから呼び出される
#実行前提条件：reg1に移動距離の値が入ってる　単位：block/tick　スケール：1倍
#使えるタグ　gun-move-executer：弾体  gunner:発射母体
#実行者：弾体

#候補にタグ付け　タグ付け範囲はreg1に応じて変化
execute if entity @e[scores={reg1=1}] positioned ^ ^ ^0.5 run tag @e[tag=!gun,tag=!gunner,distance=..0.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=2}] positioned ^ ^ ^1 run tag @e[tag=!gun,tag=!gunner,distance=..1,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=3}] positioned ^ ^ ^1.5 run tag @e[tag=!gun,tag=!gunner,distance=..1.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=4}] positioned ^ ^ ^2 run tag @e[tag=!gun,tag=!gunner,distance=..2,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=5}] positioned ^ ^ ^2.5 run tag @e[tag=!gun,tag=!gunner,distance=..2.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=6}] positioned ^ ^ ^3 run tag @e[tag=!gun,tag=!gunner,distance=..3,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=7}] positioned ^ ^ ^3.5 run tag @e[tag=!gun,tag=!gunner,distance=..3.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=8}] positioned ^ ^ ^4 run tag @e[tag=!gun,tag=!gunner,distance=..4,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=9}] positioned ^ ^ ^4.5 run tag @e[tag=!gun,tag=!gunner,distance=..4.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=10}] positioned ^ ^ ^5 run tag @e[tag=!gun,tag=!gunner,distance=..5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=11}] positioned ^ ^ ^5.5 run tag @e[tag=!gun,tag=!gunner,distance=..5.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=12}] positioned ^ ^ ^6 run tag @e[tag=!gun,tag=!gunner,distance=..6,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=13}] positioned ^ ^ ^6.5 run tag @e[tag=!gun,tag=!gunner,distance=..6.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=14}] positioned ^ ^ ^7 run tag @e[tag=!gun,tag=!gunner,distance=..7,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=15}] positioned ^ ^ ^7.5 run tag @e[tag=!gun,tag=!gunner,distance=..7.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=16}] positioned ^ ^ ^8 run tag @e[tag=!gun,tag=!gunner,distance=..8,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=17}] positioned ^ ^ ^8.5 run tag @e[tag=!gun,tag=!gunner,distance=..8.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=18}] positioned ^ ^ ^9 run tag @e[tag=!gun,tag=!gunner,distance=..9,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=19}] positioned ^ ^ ^9.5 run tag @e[tag=!gun,tag=!gunner,distance=..9.5,tag=!entity-nohit] add hit-candidate
execute if entity @e[scores={reg1=20}] positioned ^ ^ ^10 run tag @e[tag=!gun,tag=!gunner,distance=..10,tag=!entity-nohit] add hit-candidate

#直線上にいないやつのタグを剥がす　幅2B
execute positioned ^ ^ ^10 as @e[tag=hit-candidate,distance=..10] at @e[tag=gun-move-executer] positioned ^501 ^ ^10 run tag @s[distance=..500] remove hit-candidate
execute positioned ^ ^ ^10 as @e[tag=hit-candidate,distance=..10] at @e[tag=gun-move-executer] positioned ^-501 ^ ^10 run tag @s[distance=..500] remove hit-candidate
execute positioned ^ ^ ^10 as @e[tag=hit-candidate,distance=..10] at @e[tag=gun-move-executer] positioned ^ ^501 ^10 run tag @s[distance=..500] remove hit-candidate
execute positioned ^ ^ ^10 as @e[tag=hit-candidate,distance=..10] at @e[tag=gun-move-executer] positioned ^ ^-501 ^10 run tag @s[distance=..500] remove hit-candidate
tag @e[tag=hit-candidate,limit=1,sort=nearest,distance=..20,tag=!gunner] add hit-gun
tag @e[tag=hit-candidate,distance=..20] remove hit-candidate

