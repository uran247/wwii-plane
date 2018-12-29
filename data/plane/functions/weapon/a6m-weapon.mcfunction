#武器を使用
#実行者：機体

#選択に応じて武器ファンクション実行
execute if entity @s[scores={plane-weapon=1,w1-reload=..0}] at @s run function plane:weapon/a6m/20mm
execute if entity @s[scores={plane-weapon=2,w2-reload=..0}] at @s run function plane:weapon/a6m/7p7mm

#reload時間減算
scoreboard players remove @s w1-reload 1

#残弾数減算
scoreboard players remove @s[scores={plane-weapon=1,w1-reload=..0}] ammunition1 1
scoreboard players remove @s[scores={plane-weapon=2,w2-reload=..0}] ammunition2 1

execute if score @s ammunition1 matches 0 run scoreboard players set @s ammunition1 200
execute if score @s ammunition2 matches 0 run scoreboard players set @s ammunition2 1000



