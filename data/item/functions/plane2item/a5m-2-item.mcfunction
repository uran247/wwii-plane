#入力　entity:a5m-root pos:@s
#処理　a5mをアイテム化

#同じIDのパーツ取得
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[tag=plane] if score @s plane-id = #plane-id reg1 run tag @s add a5m2item-plane-parts

#アイテムをsummon
function item:give/plane/give-a5m-spawn
#summon item ~ ~1 ~ {Item:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{CustomModelData:86,display:{Name:"{\"text\":\"九六式艦上戦闘機\"}",Lore:["{\"translate\":\"戦闘機\",\"color\":\"green\",\"bold\":true}","{\"translate\":\" 武装\"}","{\"translate\":\"  九七式7.7mm機銃×2\",\"color\":\"blue\"}"]},EntityTag:{Silent:1b,Tags:["a5m-spawner","plane-spawner"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:100,ShowParticles:0b}]}}}}
#execute positioned ~ ~1 ~ as @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}},distance=..1] store result entity @s Item.tag.uuid int 1 run scoreboard players get #plane-id reg1

#キル
execute as @e[tag=a5m2item-plane-parts] at @s run tp @s ~ -40 ~
kill @e[tag=a5m2item-plane-parts]
kill @s