#入力　rotation position
#処理　半径√(6^2+0.5^2)の範囲内のエンティティにタグ付け　^z方向12ブロック以遠のタグを剥がす
#戻り　エンティティ：hit-candidateタグ付き
tag @e[tag=!gun,tag=!gunner,distance=..6.021,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
execute as @e[tag=hit-candidate,distance=..6.021] positioned ^ ^ ^1006 run tag @s[distance=..1000] remove hit-candidate
execute as @e[tag=hit-candidate,distance=..6.021] positioned ^ ^ ^-1006 run tag @s[distance=..1000] remove hit-candidate
