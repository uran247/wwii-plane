#武器を使用
#実行者：機体

#選択に応じて武器ファンクション実行
execute if entity @s[scores={plane-weapon=1,w1-reload=..0}] at @s run function plane:weapon/spitfire/20mm
execute if entity @s[scores={plane-weapon=2,w2-reload=..0}] at @s run function plane:weapon/spitfire/7p7mm

#reload時間減算
scoreboard players remove @s w1-reload 1



