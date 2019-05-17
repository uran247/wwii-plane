#入力　rotation position
#処理　半径√(19.5^2+0.5^2)の範囲内のエンティティにタグ付け　^z方向19ブロック以遠のタグを剥がす
#戻り　エンティティ：hit-candidateタグ付き
tag @e[tag=!gun,tag=!gunner,distance=..9.513,tag=!entity-nohit,tag=!plane-rider] add hit-candidate
execute as @e[tag=hit-candidate,distance=..9.513] positioned ^ ^ ^1009.5 run tag @s[distance=..1000] remove hit-candidate
execute as @e[tag=hit-candidate,distance=..9.513] positioned ^ ^ ^-1009.5 run tag @s[distance=..1000] remove hit-candidate
