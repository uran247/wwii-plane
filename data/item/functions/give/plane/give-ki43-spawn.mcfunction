summon item ~ ~1 ~ {Item:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{item-type:"ki-43",tier:1,weapon:"7p7mm",CustomModelData:68,CanPlaceOn:["minecraft:gold_block"],display:{Name:"{\"text\":\"一式戦闘機 隼\"}",Lore:["{\"translate\":\"戦闘機\",\"color\":\"green\",\"bold\":true}","{\"translate\":\" 武装\"}","{\"translate\":\"  八九式7.7mm固定機関銃×2\",\"color\":\"blue\"}"]},EntityTag:{Silent:1b,Tags:["ki43-spawner","plane-spawner"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:100,ShowParticles:0b}]}}}}
execute positioned ~ ~1 ~ as @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1] store result entity @s Item.tag.uuid int 1 run data get entity @s UUIDMost 0.000000000233

