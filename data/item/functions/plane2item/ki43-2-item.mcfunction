#入力　entity:ki43-root pos:@s
#処理　ki43をアイテム化

#アイテムをsummon
execute if entity @s[tag=!12p7mm] run loot spawn ~ ~ ~ loot loot:planes/japan/ki-43

#12p7mmがついてたらアイテムに反映
execute if entity @s[tag=12p7mm] run loot spawn ~ ~ ~ loot loot:craft/equip-weapon/ki43-with-12p7mm
