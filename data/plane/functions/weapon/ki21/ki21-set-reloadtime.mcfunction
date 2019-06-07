#入力：機体enthity
#処理：
#弾薬数が0のEntityにリロード時間をセット
#ammunitionに-1を入れてリロード中とわかるようにする
#帰り値：なし
execute if entity @s[scores={ammunition1=0}] unless score @s ammo-reload1 > #0 Num run scoreboard players set @s ammo-reload1 600
execute if entity @s[scores={ammunition2=0}] unless score @s ammo-reload2 > #0 Num run scoreboard players set @s ammo-reload2 140
execute if entity @s[scores={ammunition3=0}] unless score @s ammo-reload3 > #0 Num run scoreboard players set @s ammo-reload3 140
execute if entity @s[scores={ammunition4=0}] unless score @s ammo-reload4 > #0 Num run scoreboard players set @s ammo-reload4 140

execute if entity @s[scores={ammunition1=0}] if score @s ammo-reload1 > #0 Num run scoreboard players set @s ammunition1 -1
execute if entity @s[scores={ammunition2=0}] if score @s ammo-reload2 > #0 Num run scoreboard players set @s ammunition2 -1
execute if entity @s[scores={ammunition3=0}] if score @s ammo-reload3 > #0 Num run scoreboard players set @s ammunition3 -1
execute if entity @s[scores={ammunition4=0}] if score @s ammo-reload4 > #0 Num run scoreboard players set @s ammunition4 -1

