#入力　entity:plane-root
#処理　プレイヤーが乗っている航空機を削除

#アイテム化
scoreboard players set #flag reg1 0
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @a if score @s plane-id = #plane-id reg1 run scoreboard players set #flag reg1 1
execute if score #flag reg1 matches 1 run function item:plane2item/plane2item

#ロビーへ移動
tp @e[type=item,nbt={Item:{id:"minecraft:bat_spawn_egg"}}] 0 140 0