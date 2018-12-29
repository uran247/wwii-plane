#機体の着陸処理を実行
#controll/flying経由で実行　実行者は機体

#NoGravity復活
data merge entity @s {NoGravity:0b}

#sound管理スコアを0に
scoreboard players set @s sound 0
#stopsound @a * minecraft:plane.engine.recipro-flying

#AngX,Zを初期値にする
scoreboard players set @s AngZ 0
execute unless entity @s[scores={AngX=-90..90}] run scoreboard players set @s AngZ 180
scoreboard players operation @s AngX = @s landing-pitch
execute if score @s AngZ matches 180 run scoreboard players add @s AngX 180

#flyingタグ削除
tag @s remove flying
data merge entity @e[tag=plane-seat,distance=..5,limit=1] {Invulnerable:0b}


