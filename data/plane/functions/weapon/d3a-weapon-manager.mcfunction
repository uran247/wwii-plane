#武器を使用　controll:weapon経由で実行
#実行者：機体

#選択に応じて武器ファンクション実行,弾薬選択武器の弾薬が0だったら右クリック値を0に
execute if entity @a[tag=weapon-user,scores={rightClick=1..}] if entity @s[scores={plane-weapon=1,w1-reload=..0,ammunition1=1..}] at @s run function plane:weapon/d3a/7p7mm
execute if entity @a[tag=weapon-user,scores={rightClick=1..}] if entity @s[scores={plane-weapon=2,w2-reload=..0,ammunition2=1..},tag=flying] at @s run function plane:weapon/d3a/bomb
execute if entity @a[tag=weapon-user,scores={rightClick=1..}] if entity @s[scores={plane-weapon=1,w1-reload=..0,ammunition1=..0}] at @s run scoreboard players set @a[tag=weapon-user,scores={rightClick=1..}] rightClick 0

#後部機銃発射（自動発射）
execute if entity @s[scores={w3-reload=..0,ammunition3=1..}] at @s run function plane:weapon/d3a/check-rear-target
execute if entity @s[scores={w3-reload=..0,ammunition3=1..}] if entity @e[tag=rear-gun-target,distance=..32] at @s run function plane:weapon/d3a/rear-gun

#reload時間減算
execute as @s run function plane:weapon/d3a/d3a-cooltime-weapon

#残弾数が0になったら補充時間をセット
execute unless entity @s[scores={ammunition1=1..,ammunition2=1..,ammunition3=1..}] unless entity @s[scores={ammunition1=..-1,ammunition2=..-1,ammunition3=..-1}] as @s run function plane:weapon/d3a/d3a-set-reloadtime

#リロードタイムが経過したらリロード
execute unless entity @s[scores={ammunition1=..-1,ammunition2=..-1,ammunition3=..-1}] unless entity @s[scores={ammo-reload1=1..,ammo-reload2=1..,ammo-reload3=1..}] as @s run function plane:weapon/d3a/da3-reset-ammunition

