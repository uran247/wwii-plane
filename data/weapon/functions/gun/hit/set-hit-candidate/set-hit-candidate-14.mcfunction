#入力　rotation position
#処理　半径√(7^2+0.5^2)の範囲内のエンティティにタグ付け　^z方向14ブロック以遠のタグを剥がす
#戻り　エンティティ：hit-candidateタグ付き
tag @e[tag=!gun,tag=!gunner,distance=..7.018,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
execute as @e[tag=hit-candidate,distance=..7.018] positioned ^ ^ ^1007 run tag @s[distance=..1000] remove hit-candidate
execute as @e[tag=hit-candidate,distance=..7.018] positioned ^ ^ ^-1007 run tag @s[distance=..1000] remove hit-candidate
