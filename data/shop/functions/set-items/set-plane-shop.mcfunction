#入力　entity:villager position:at @s
#処理　入力村人に最近プレイヤーの進捗に応じたショップ内容をセット

#参照プレイヤーにタグ付け
tag @p add shop-target

#ショップ内容書き換え
data merge entity @s {Offers:{Recipes:[]}}

execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/a5m=true}] run loot replace block ~ ~-2 ~ container.0 loot loot:planes/japan/a5m
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/a5m=true}] run data modify entity @s Offers.Recipes prepend value {buy:{id:emerald,Count:1},sell:{id:"minecraft:bat_spawn_egg",Count:1b},maxUses:1,xp:0}
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/a5m=true}] run data modify entity @s Offers.Recipes[0].sell.tag set from block ~ ~-2 ~ Items[0].tag

execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/ki-43=true}] run loot replace block ~ ~-2 ~ container.0 loot loot:planes/japan/ki-43
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/ki-43=true}] run data modify entity @s Offers.Recipes prepend value {buy:{id:emerald,Count:1},sell:{id:"minecraft:bat_spawn_egg",Count:1b},maxUses:1,xp:0}
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/ki-43=true}] run data modify entity @s Offers.Recipes[0].sell.tag set from block ~ ~-2 ~ Items[0].tag

execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/d3a=true}] run loot replace block ~ ~-2 ~ container.0 loot loot:planes/japan/d3a
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/d3a=true}] run data modify entity @s Offers.Recipes prepend value {buy:{id:emerald,Count:1},sell:{id:"minecraft:bat_spawn_egg",Count:1b},maxUses:1,xp:0}
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/d3a=true}] run data modify entity @s Offers.Recipes[0].sell.tag set from block ~ ~-2 ~ Items[0].tag

execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/ki-21=true}] run loot replace block ~ ~-2 ~ container.0 loot loot:planes/japan/ki-21
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/ki-21=true}] run data modify entity @s Offers.Recipes prepend value {buy:{id:emerald,Count:1},sell:{id:"minecraft:bat_spawn_egg",Count:1b},maxUses:1,xp:0}
execute if entity @p[tag=shop-target,tag=japan,advancements={advancements:japan/ki-21=true}] run data modify entity @s Offers.Recipes[0].sell.tag set from block ~ ~-2 ~ Items[0].tag

#タグ解除
tag @p[tag=shop-target] add shop-target