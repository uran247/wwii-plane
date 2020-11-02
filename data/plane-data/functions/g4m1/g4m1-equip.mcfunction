#処理：装備の変更処理
#入力：entity plane-root

#装備品チェック
execute store success score #800kg reg1 if entity @e[distance=..30,type=minecraft:donkey,tag=target-parts,nbt={Items:[{tag:{item-type:800kg-bomb}}]}]

#初期タグ設定
execute store success score #remove-800kg reg1 run tag @s remove 800kg
tag @s add 250kg

#装備
execute if score #800kg reg1 matches 1.. run tag @s add 800kg
execute if score #800kg reg1 matches 1.. store success score #remove-250kg reg1 run tag @s remove 250kg

#装備種別変更
#weapon-id
# 2: bomb

#装備済み爆弾削除 爆弾召喚無しのためキルはしない
#scoreboard players set #kill-weapon reg1 0
#execute if entity @s[tag=!250kg] run scoreboard players set #kill-weapon reg1 1
#execute if entity @s[tag=!800kg] run scoreboard players set #kill-weapon reg1 1
#execute if score #kill-weapon reg1 matches 1.. run kill @e[tag=target-parts,tag=plane-bomb]
#execute if score #kill-weapon reg1 matches 1.. run kill @e[tag=target-parts,tag=plane-rocket]

#最大弾薬変更
scoreboard players set @s[tag=250kg] max-ammunition1 4
scoreboard players set @s[tag=800kg] max-ammunition1 1

#弾薬リセット
execute if score #remove-800kg reg1 matches 1.. run scoreboard players operation @s[tag=bombed] ammunition1 = @s max-ammunition1
execute if score #remove-250kg reg1 matches 1.. run scoreboard players operation @s[tag=bombed] ammunition1 = @s max-ammunition1

#ステータス変更
#装備に応じて右記ステータス変更：最高速度　巡航速度　旋回力

