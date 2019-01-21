#武器使用操作を検知し、機体に応じてweaponfunctionを呼び分け
#実行者：プレイヤー

#武器使用者にタグ付け
tag @s add weapon-user

#使用武器選択判定
execute if entity @s[nbt={SelectedItemSlot:0}] run scoreboard players set @e[tag=controll-target] plane-weapon 1
execute if entity @s[nbt={SelectedItemSlot:2}] run scoreboard players set @e[tag=controll-target] plane-weapon 2
execute as @e[tag=controll-target] unless score @s plane-weapon matches 1 unless score @s plane-weapon matches 2 run scoreboard players set @s plane-weapon 1

#右クリック判定
execute if score @s rightClick >= #2 Num run scoreboard players set @s rightClick 0

#weaponfunctionを実行
execute if score @s rightClick > #0 Num as @e[tag=controll-target] if entity @s[tag=a6m] at @s run function plane:weapon/a6m-weapon
execute if score @s rightClick > #0 Num as @e[tag=controll-target] if entity @s[tag=spitfire] at @s run function plane:weapon/spitfire-weapon
execute if score @s rightClick > #0 Num as @e[tag=controll-target] if entity @s[tag=ju87] at @s run function plane:weapon/ju87-weapon
execute if score @s rightClick > #0 Num as @e[tag=controll-target] if entity @s[tag=f4u] at @s run function plane:weapon/f4u-weapon

#使用者タグ削除
tag @s remove weapon-user