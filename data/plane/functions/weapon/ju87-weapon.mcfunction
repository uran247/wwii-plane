#武器を使用　 controll:weapon経由で実行
#実行者：機体

#地上で爆弾使用条件が整っていた場合使わないようにする
execute if entity @s[scores={plane-weapon=1,w1-reload=..0},tag=armed,tag=!flying] run scoreboard players set @p rightClick 0

#選択に応じて武器ファンクション実行
execute if entity @s[scores={plane-weapon=1,w1-reload=..0},tag=armed,tag=flying] at @s run function plane:weapon/ju87/bombing
execute if entity @s[scores={plane-weapon=2,w2-reload=..0}] at @s run function plane:weapon/ju87/7p7mm

#reload時間減算
scoreboard players remove @s w1-reload 1



