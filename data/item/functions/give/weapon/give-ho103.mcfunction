summon item ~ ~1 ~ {Item:{id:"minecraft:tipped_arrow",Count:1b,tag:{CustomPotionColor:0,item-type:"ho103",display:{Name:"{\"text\":\"ホ103 一式十二・七粍固定機関砲\",\"bold\":true}",Lore:["{\"translate\":\"航空機関銃\",\"color\":\"gray\",\"bold\":true}","{\"translate\":\"帝国陸軍の航空機関銃、ブローニングM2機関銃をコピーして作られた\",\"color\":\"gray\"}"]}}}}
execute positioned ~ ~1 ~ as @e[type=item,nbt={Item:{id:"minecraft:tipped_arrow"}},distance=..1] store result entity @s Item.tag.uuid int 1 run data get entity @s UUIDMost 0.000000000233
