#入力　座標：dropper座標
#処理　ki-43-12p7mmをドロッパーに入れる

#nbt作成
execute positioned ~ ~-100 ~ run function item:give/plane/give-ki43-spawn
execute positioned ~ ~-99 ~ as @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1] run data modify entity @s Item.tag.EntityTag.Tags append value "12p7mm"
execute positioned ~ ~-99 ~ as @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1] run data modify entity @s Item.tag.display.Lore[2] set value "{\"translate\":\"  ホ103 12.7mm機銃×2\",\"color\":\"blue\"}"
execute positioned ~ ~-99 ~ as @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1] run data modify entity @s Item.tag.weapon set value "12p7mm"

#dispenserに書き込み
data merge block ~ ~ ~ {Items:{}}
execute positioned ~ ~-99 ~ run data modify block ~ ~99 ~ Items append from entity @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1,limit=1] Item

#nbt kill
execute positioned ~ ~-99 ~ run kill @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1]