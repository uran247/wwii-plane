#入力　entity:villager position:at @s
#処理　入力村人に最近プレイヤーの進捗に応じたショップ内容をセット

#参照プレイヤーにタグ付け
tag @p add shop-target

#ショップ内容書き換え
data merge entity @s {Offers:{Recipes:[]}}
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/a5m=true}] run data modify entity @s Offers.Recipes append value {buy:{id:emerald,Count:1},sell:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{item-type:"a5m",tier:1,CustomModelData:1,display:{Name:"{\"text\":\"九六式艦上戦闘機\"}",Lore:["{\"translate\":\"戦闘機\",\"color\":\"green\",\"bold\":true}","{\"translate\":\" 武装\"}","{\"translate\":\"  九七式7.7mm機銃×2\",\"color\":\"blue\"}"]},EntityTag:{Silent:1b,Tags:["a5m-spawner","plane-spawner"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:100,ShowParticles:0b}]}}},maxUses:1,xp:0}
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/ki-43=true}] run data modify entity @s Offers.Recipes append value {buy:{id:emerald,Count:1},sell:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{item-type:"ki-43",tier:1,weapon:"7p7mm",CustomModelData:2,display:{Name:"{\"text\":\"一式戦闘機 隼\"}",Lore:["{\"translate\":\"戦闘機\",\"color\":\"green\",\"bold\":true}","{\"translate\":\" 武装\"}","{\"translate\":\"  八九式7.7mm固定機関銃×2\",\"color\":\"blue\"}"]},EntityTag:{Silent:1b,Tags:["ki43-spawner","plane-spawner"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:100,ShowParticles:0b}]}}},maxUses:1,xp:0}
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/d3a=true}] run data modify entity @s Offers.Recipes append value {buy:{id:emerald,Count:1},sell:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{item-type:"d3a",tier:1,CustomModelData:3,display:{Name:"{\"text\":\"九九式艦上爆撃機\"}",Lore:["{\"translate\":\"爆撃機\",\"color\":\"red\",\"bold\":true}","{\"translate\":\" 武装\"}","{\"translate\":\"  7.7mm機銃×2\",\"color\":\"blue\"}","{\"translate\":\"  60kg爆弾×2\",\"color\":\"blue\"}","{\"translate\":\"  250kg爆弾×1\",\"color\":\"blue\"}"]},EntityTag:{Silent:1b,Tags:["d3a-spawner","plane-spawner"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:100,ShowParticles:0b}]}}},maxUses:1,xp:0}
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/ki-21=true}] run data modify entity @s Offers.Recipes append value {buy:{id:emerald,Count:1},sell:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{item-type:"ki-21",tier:1,CustomModelData:4,display:{Name:"{\"text\":\"九七式重爆撃機\"}",Lore:["{\"translate\":\"爆撃機\",\"color\":\"red\",\"bold\":true}","{\"translate\":\" 武装\"}","{\"translate\":\"  50kg爆弾×20\",\"color\":\"blue\"}"]},EntityTag:{Silent:1b,Tags:["ki21-spawner","plane-spawner"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:100,ShowParticles:0b}]}}},maxUses:1,xp:0}

#UUID書き込み
function shop:set-items/set-shop-uuid

#タグ解除
tag @p[tag=shop-target] add shop-target