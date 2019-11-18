#入力　entity:ki21-root pos:@s
#処理　ki21をアイテム化

#アイテムをsummon
execute if entity @s[tag=!torpedo] run loot spawn ~ ~ ~ loot loot:planes/japan/g4m1

#torpedoがついてたらアイテムに反映
execute if entity @s[tag=torpedo] run loot spawn ~ ~ ~ loot loot:craft/equip-weapon/g4m1-with-torpedo
