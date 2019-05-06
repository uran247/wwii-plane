#機銃の命中判定
#なんブロック先で命中するか判定、その値をreg1に入れる
#命中したらダメージを与える
#gun/moveから呼び出される
#実行前提条件：reg1に移動距離の値が入ってる　単位：block/tick　スケール：1倍
#使えるタグ　gun-move-executer：弾体  gunner:発射母体
#実行者：弾体

#衝突判定フラグを0に
scoreboard players set @s reg2 0

#ブロック衝突判定、衝突判定が出たら衝突判定フラグが1に
function weapon:gun/hit/hit-block

#エンティティ衝突判定
#機銃口径に応じて衝突判定幅が変わる
execute at @s[tag=7p7mm] run function weapon:gun/hit/hit-entity-7p7mm
execute at @s[tag=20mm] run function weapon:gun/hit/hit-entity-20mm

#命中エンティティがいたらhitフラグを立てる
execute if entity @e[tag=hit-gun,distance=..20] run scoreboard players set @s reg2 1

#命中エンティティにパーティクル
execute at @e[tag=hit-gun,distance=..20] run particle minecraft:explosion ^ ^ ^ 0.1 0.1 0.1 0 1 force

#ダメージ判定
function weapon:gun/hit/damage

#hit-gunタグ除去
tag @e[tag=hit-gun] remove hit-gun

