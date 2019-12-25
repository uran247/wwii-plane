#Tier2以上の航空機を持ってるか判定
scoreboard players set @a reg1 0
scoreboard players set @a reg2 0
execute as @a if score @s reg1 matches 0 store result score @s reg1 if data entity @s EnderItems[{id:"minecraft:bat_spawn_egg",tag:{tier:2}}]
execute as @a if score @s reg2 matches 0 store result score @s reg2 if data entity @s Inventory[{id:"minecraft:bat_spawn_egg",tag:{tier:2}}]
execute as @a if score @s reg1 matches 0 store result score @s reg1 if data entity @s EnderItems[{id:"minecraft:bat_spawn_egg",tag:{tier:3}}]
execute as @a if score @s reg2 matches 0 store result score @s reg2 if data entity @s Inventory[{id:"minecraft:bat_spawn_egg",tag:{tier:3}}]
execute as @a if score @s reg1 matches 0 store result score @s reg1 if data entity @s EnderItems[{id:"minecraft:bat_spawn_egg",tag:{tier:4}}]
execute as @a if score @s reg2 matches 0 store result score @s reg2 if data entity @s Inventory[{id:"minecraft:bat_spawn_egg",tag:{tier:4}}]
execute as @a if score @s reg1 matches 0 store result score @s reg1 if data entity @s EnderItems[{id:"minecraft:bat_spawn_egg",tag:{tier:5}}]
execute as @a if score @s reg2 matches 0 store result score @s reg2 if data entity @s Inventory[{id:"minecraft:bat_spawn_egg",tag:{tier:5}}]

#持ってたらフラグをNGに
execute as @a if score @s reg1 matches 1.. run scoreboard players set #chk-prepare return 0
execute as @a if score @s reg2 matches 1.. run scoreboard players set #chk-prepare return 0

#メッセージ
execute if score @s reg1 matches 1.. run tellraw @a [{"text":"Tier2以上の航空機は持ち込めません","color":"yellow"}]