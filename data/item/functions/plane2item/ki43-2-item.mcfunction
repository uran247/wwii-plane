#入力　entity:ki43-root pos:@s
#処理　ki43をアイテム化

#アイテムをsummon
function item:give/plane/give-ki43-spawn

#12p7mmがついてたらアイテムに反映
execute if entity @s[tag=12p7mm] positioned ~ ~1 ~ run data modify entity @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1,limit=1] Item.tag.EntityTag.Tags append value "12p7mm"
execute if entity @s[tag=12p7mm] positioned ~ ~1 ~ run data modify entity @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1,limit=1] Item.tag.display.Lore[2] set value "{\"translate\":\"  ホ103 12.7mm機銃×2\",\"color\":\"blue\"}"
execute if entity @s[tag=12p7mm] positioned ~ ~1 ~ run data modify entity @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1,limit=1] Item.tag.weapon set value "12p7mm"
