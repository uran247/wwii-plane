#入力　rotation position
#処理　半径√(2.5^2+0.5^2)の範囲内のエンティティにタグ付け　^z方向5ブロック以遠のタグを剥がす
#戻り　エンティティ：hit-candidateタグ付き
tag @e[tag=!gun,tag=!gunner,distance=..2.55,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
execute as @e[tag=hit-candidate,distance=..2.55] positioned ^ ^ ^1002.5 run tag @s[distance=..1000] remove hit-candidate
execute as @e[tag=hit-candidate,distance=..2.55] positioned ^ ^ ^-1002.5 run tag @s[distance=..1000] remove hit-candidate
