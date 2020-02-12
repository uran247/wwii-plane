#武器使用操作を検知し、機体に応じてweaponfunctionを呼び分け
#実行者：プレイヤー
#入力：エンティティ：プレイヤー　座標：機体
#利用可能タグ controll-target:機体

#武器使用者にタグ付け
tag @s[nbt={Inventory:[{Slot:-106b,tag:{item-type:controll-rod}}]}] add weapon-user

#使用武器選択判定
#execute if entity @s[scores={drop-cont-stick=1..}] at @s run function plane:controll/weapon/switch-weapon
execute if entity @s[nbt=!{Inventory:[{Slot:-106b,tag:{item-type:controll-rod}}]}] at @s run function plane:controll/weapon/switch-weapon

#右クリック判定
execute if score @s rightClick matches 2.. run scoreboard players set @s rightClick 0

#weaponfunctionを実行
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=a6m] at @s run function plane:weapon/a6m-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=d3a] at @s run function plane:weapon/d3a-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=ki21] at @s run function plane:weapon/ki21-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=ki43] at @s run function plane:weapon/ki43-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=a5m] at @s run function plane:weapon/a5m-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=a6m2] at @s run function plane:weapon/a6m2-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=ki44] at @s run function plane:weapon/ki44-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=d4y2] at @s run function plane:weapon/d4y2-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=j2m3] at @s run function plane:weapon/j2m3-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=g4m1] at @s run function plane:weapon/g4m1-weapon-manager
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=spitfire] at @s run function plane:weapon/spitfire-weapon
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=ju87] at @s run function plane:weapon/ju87-weapon
execute as @e[tag=controll-target,distance=..1] if entity @s[tag=f4u] at @s run function plane:weapon/f4u-weapon

#残弾補充時間減算
execute as @e[tag=controll-target,distance=..1] run function plane:controll/weapon/decrease-reload-time

#使用者タグ削除
tag @s remove weapon-user
