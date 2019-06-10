#読み込み範囲内のすべての航空機を削除
execute as @e[tag=plane-root] run function item:plane2item/plane2item

#ロビーへ移動
tp @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}}] 0 140 0