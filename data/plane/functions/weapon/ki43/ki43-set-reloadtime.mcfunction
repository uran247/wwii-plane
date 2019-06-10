#弾薬数が0のEntityにリロード時間をセット
#ammunitionに-1を入れてリロード中とわかるようにする
#入力：機体enthity
#帰り値：なし
execute if entity @s[scores={ammunition1=0},tag=12p7mm] unless score @s ammo-reload1 > #0 Num run scoreboard players set @s ammo-reload1 210
execute if entity @s[scores={ammunition1=0},tag=7p7mm] unless score @s ammo-reload1 > #0 Num run scoreboard players set @s ammo-reload1 140
execute if entity @s[scores={ammunition1=0}] if score @s ammo-reload1 > #0 Num run scoreboard players set @s ammunition1 -1
