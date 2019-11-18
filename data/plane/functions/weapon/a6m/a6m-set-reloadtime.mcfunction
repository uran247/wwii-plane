#弾薬数が0のEntityにリロード時間をセット
#ammunitionに-1を入れてリロード中とわかるようにする
#入力：機体enthity
#帰り値：なし
execute if entity @s[scores={ammunition1=0}] unless score @s ammo-reload1 matches 1.. run scoreboard players set @s ammo-reload1 280
execute if entity @s[scores={ammunition2=0}] unless score @s ammo-reload2 matches 1.. run scoreboard players set @s ammo-reload2 140
execute if entity @s[scores={ammunition1=0}] if score @s ammo-reload1 matches 1.. run scoreboard players set @s ammunition1 -1
execute if entity @s[scores={ammunition2=0}] if score @s ammo-reload2 matches 1.. run scoreboard players set @s ammunition2 -1
