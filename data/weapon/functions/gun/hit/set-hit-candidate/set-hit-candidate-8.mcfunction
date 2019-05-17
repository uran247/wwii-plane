#入力　rotation position
#処理　半径√(4^2+0.5^2)の範囲内のエンティティにタグ付け　^z方向8ブロック以遠のタグを剥がす
#戻り　エンティティ：hit-candidateタグ付き
tag @e[tag=!gun,tag=!gunner,distance=..4.031,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
execute as @e[tag=hit-candidate,distance=..4.031] positioned ^ ^ ^1004 run tag @s[distance=..1000] remove hit-candidate
execute as @e[tag=hit-candidate,distance=..4.031] positioned ^ ^ ^-1004 run tag @s[distance=..1000] remove hit-candidate
