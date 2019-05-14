#武器を使用　controll:weapon経由で実行
#実行者：機体

#選択に応じて武器ファンクション実行
execute if entity @a[tag=weapon-user,scores={rightClick=1..}] if entity @s[tag=20mm,scores={plane-weapon=1,w1-reload=..0,ammunition1=1..}] at @s run function plane:weapon/ki43/20mm
execute if entity @a[tag=weapon-user,scores={rightClick=1..}] if entity @s[tag=12p7mm,scores={plane-weapon=1,w1-reload=..0,ammunition1=1..}] at @s run function plane:weapon/ki43/12p7mm
execute if entity @a[tag=weapon-user,scores={rightClick=1..}] if entity @s[tag=7p7mm,scores={plane-weapon=1,w1-reload=..0,ammunition1=1..}] at @s run function plane:weapon/ki43/7p7mm

#reload時間減算
function plane:weapon/ki43/ki43-cooltime-weapon

#残弾数が0になったら補充時間をセット
execute unless entity @s[scores={ammunition1=1..,ammunition2=1..}] as @s run function plane:weapon/ki43/ki43-set-reloadtime

#execute if entity @s[scores={ammunition1=..0,ammo-reload1=..0}] run scoreboard players set @s ammunition1 100
execute unless entity @s[scores={ammunition1=1..,ammunition2=1..}] unless entity @s[scores={ammo-reload1=1..,ammo-reload2=1..}] as @s run function plane:weapon/ki43/ki43-reset-ammunition

