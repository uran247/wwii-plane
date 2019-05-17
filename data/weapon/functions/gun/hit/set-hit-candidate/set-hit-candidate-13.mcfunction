#入力　rotation position
#処理　半径√(6.5^2+0.5^2)の範囲内のエンティティにタグ付け　^z方向13ブロック以遠のタグを剥がす
#戻り　エンティティ：hit-candidateタグ付き
tag @e[tag=!gun,tag=!gunner,distance=..6.519,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
execute as @e[tag=hit-candidate,distance=..6.519] positioned ^ ^ ^1006.5 run tag @s[distance=..1000] remove hit-candidate
execute as @e[tag=hit-candidate,distance=..6.519] positioned ^ ^ ^-1006.5 run tag @s[distance=..1000] remove hit-candidate
