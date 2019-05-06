#武器を使用　controll:weapon経由で実行
#実行者：機体

#選択に応じて武器ファンクション実行
execute if entity @a[tag=weapon-user,scores={rightClick=1..}] if entity @s[scores={plane-weapon=1,w1-reload=..0,ammunition1=1..}] at @s run function plane:weapon/a6m/20mm
execute if entity @a[tag=weapon-user,scores={rightClick=1..}] if entity @s[scores={plane-weapon=2,w2-reload=..0,ammunition2=1..}] at @s run function plane:weapon/a6m/7p7mm

#reload時間減算
scoreboard players remove @s w1-reload 1

#残弾数が0になったら補充時間をセット
execute if entity @s[scores={ammunition1=0}] unless score @s ammo-reload1 > #0 Num run scoreboard players set @s ammo-reload1 280
execute if entity @s[scores={ammunition2=0}] unless score @s ammo-reload2 > #0 Num run scoreboard players set @s ammo-reload2 140

execute if entity @s[scores={ammunition1=..0,ammo-reload1=..0}] run scoreboard players set @s ammunition1 100
execute if entity @s[scores={ammunition2=..0,ammo-reload2=..0}] run scoreboard players set @s ammunition2 500

