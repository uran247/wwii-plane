#入力　rotation position
#処理　半径√(3.5^2+0.5^2)の範囲内のエンティティにタグ付け　^z方向7ブロック以遠のタグを剥がす
#戻り　エンティティ：hit-candidateタグ付き
tag @e[tag=!gun,tag=!gunner,distance=..3.536,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
execute as @e[tag=hit-candidate,distance=..3.536] positioned ^ ^ ^1003.5 run tag @s[distance=..1000] remove hit-candidate
execute as @e[tag=hit-candidate,distance=..3.536] positioned ^ ^ ^-1003.5 run tag @s[distance=..1000] remove hit-candidate
