#入力：機体entity
#処理：リロード時間を迎えたEntityの弾薬数をリセット
#帰り値：なし
execute if entity @s[scores={ammunition1=..0,ammo-reload1=..0}] run scoreboard players set @s ammunition1 20
execute if entity @s[scores={ammunition2=..0,ammo-reload2=..0}] run scoreboard players set @s ammunition2 500
execute if entity @s[scores={ammunition3=..0,ammo-reload3=..0}] run scoreboard players set @s ammunition3 500
execute if entity @s[scores={ammunition4=..0,ammo-reload4=..0}] run scoreboard players set @s ammunition4 500
