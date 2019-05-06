#入力：実行者としてプレイヤー
#出力：#selected-slot returnに1~9のスロット番号の値が入る
execute if entity @s[nbt={SelectedItemSlot:0}] run scoreboard players set #selected-slot return 1
execute if entity @s[nbt={SelectedItemSlot:1}] run scoreboard players set #selected-slot return 2
execute if entity @s[nbt={SelectedItemSlot:2}] run scoreboard players set #selected-slot return 3
execute if entity @s[nbt={SelectedItemSlot:3}] run scoreboard players set #selected-slot return 4
execute if entity @s[nbt={SelectedItemSlot:4}] run scoreboard players set #selected-slot return 5
execute if entity @s[nbt={SelectedItemSlot:5}] run scoreboard players set #selected-slot return 6
execute if entity @s[nbt={SelectedItemSlot:6}] run scoreboard players set #selected-slot return 7
execute if entity @s[nbt={SelectedItemSlot:7}] run scoreboard players set #selected-slot return 8
execute if entity @s[nbt={SelectedItemSlot:8}] run scoreboard players set #selected-slot return 9
