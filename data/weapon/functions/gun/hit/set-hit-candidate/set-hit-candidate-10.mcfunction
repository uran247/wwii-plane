#入力　rotation position
#処理　半径√(5^2+0.5^2)の範囲内のエンティティにタグ付け　^z方向10ブロック以遠のタグを剥がす
#戻り　エンティティ：hit-candidateタグ付き
tag @e[tag=!gun,tag=!gunner,distance=..5.025,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
execute as @e[tag=hit-candidate,distance=..5.025] positioned ^ ^ ^1005 run tag @s[distance=..1000] remove hit-candidate
execute as @e[tag=hit-candidate,distance=..5.025] positioned ^ ^ ^-1005 run tag @s[distance=..1000] remove hit-candidate
