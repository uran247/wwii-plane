#爆弾の命中判

#torpedo/moveから呼び出される

#何ブロック先で命中するか判定、その値を#speedに入れる
#エンティティに命中するか判定　命中エンティティにhit-torpedoをつける
#ブロックに当たった場合#hit-flagが1になる
#エンティティに当たった場合#hit-flagが1になる

#実行前提条件：#speedに移動距離の値が入ってる　単位：block/tick　スケール：1倍
#使えるタグ　torpedo-move-executer：弾体  torpedoer:発射母体
#実行者：弾体

#衝突判定フラグを0に
scoreboard players set #hit-flag reg1 0

#ブロック衝突判定、衝突判定が出たら衝突判定#hit-flagのフラグが1に
function weapon:torpedo/hit/hit-block

#エンティティ衝突判定
#重量に応じて衝突判定幅が変わる
execute at @s[tag=torpedo-normal] run function weapon:torpedo/hit/hit-entity-torpedo

#命中エンティティがいたら#hit-flagのフラグを立てる
execute if entity @e[tag=hit-torpedo,distance=..20] run scoreboard players set #hit-flag reg1 2
