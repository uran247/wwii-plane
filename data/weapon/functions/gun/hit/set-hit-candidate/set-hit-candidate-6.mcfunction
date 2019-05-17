#入力　rotation position
#処理　半径√(3^2+0.5^2)の範囲内のエンティティにタグ付け　^z方向6ブロック以遠のタグを剥がす
#戻り　エンティティ：hit-candidateタグ付き
tag @e[tag=!gun,tag=!gunner,distance=..3.041,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
execute as @e[tag=hit-candidate,distance=..3.041] positioned ^ ^ ^1003 run tag @s[distance=..1000] remove hit-candidate
execute as @e[tag=hit-candidate,distance=..3.041] positioned ^ ^ ^-1003 run tag @s[distance=..1000] remove hit-candidate
