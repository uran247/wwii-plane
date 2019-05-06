#ki-21の爆弾召喚
#実行者：機体
#使用可能タグ ki21-position-target ki21-position-executer

#### 50kg爆弾1個目召喚 ####
execute if entity @s run summon armor_stand ~ ~ ~ {Tags:["ki21-bomb-1","ki21",ki21-init,plane,plane-bomb,plane-parts,entity-nohit,50kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:84,Unbreakable:1}},{}],Pose:{1Arm:[0f,0f,0f]},DisabledSlots:256}
#スコアセット
scoreboard players set @e[tag=ki21-bomb-1,tag=ki21-init] offsetX -1500
scoreboard players set @e[tag=ki21-bomb-1,tag=ki21-init] offsetY 300
scoreboard players set @e[tag=ki21-bomb-1,tag=ki21-init] offsetZ 0
scoreboard players set @e[tag=ki21-bomb-1,tag=ki21-init] damage 250
scoreboard players operation @e[tag=ki21-bomb-1,tag=ki21-init] plane-id = @s plane-id
tag @e[tag=ki21-bomb-1,tag=ki21-init] remove ki21-init

#### 50kg爆弾2個目召喚 ####
execute if entity @s run summon armor_stand ~ ~ ~ {Tags:["ki21-bomb-2","ki21",ki21-init,plane,plane-bomb,plane-parts,entity-nohit,50kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:84,Unbreakable:1}},{}],Pose:{1Arm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=ki21-bomb-2,tag=ki21-init] offsetX -1500
scoreboard players set @e[tag=ki21-bomb-2,tag=ki21-init] offsetY 300
scoreboard players set @e[tag=ki21-bomb-2,tag=ki21-init] offsetZ 0
scoreboard players set @e[tag=ki21-bomb-2,tag=ki21-init] damage 250
scoreboard players operation @e[tag=ki21-bomb-2,tag=ki21-init] plane-id = @s plane-id
tag @e[tag=ki21-bomb-2,tag=ki21-init] remove ki21-init

#### 50kg爆弾3個目召喚 ####
execute if entity @s run summon armor_stand ~ ~ ~ {Tags:["ki21-bomb-3","ki21",ki21-init,plane,plane-bomb,plane-parts,entity-nohit,50kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:84,Unbreakable:1}},{}],Pose:{1Arm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=ki21-bomb-3,tag=ki21-init] offsetX -1500
scoreboard players set @e[tag=ki21-bomb-3,tag=ki21-init] offsetY 300
scoreboard players set @e[tag=ki21-bomb-3,tag=ki21-init] offsetZ 0
scoreboard players set @e[tag=ki21-bomb-3,tag=ki21-init] damage 250
scoreboard players operation @e[tag=ki21-bomb-3,tag=ki21-init] plane-id = @s plane-id
tag @e[tag=ki21-bomb-3,tag=ki21-init] remove ki21-init

#### 50kg爆弾4個目召喚 ####
execute if entity @s run summon armor_stand ~ ~ ~ {Tags:["ki21-bomb-4","ki21",ki21-init,plane,plane-bomb,plane-parts,entity-nohit,50kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:84,Unbreakable:1}},{}],Pose:{1Arm:[0f,0f,0f]},DisabledSlots:256}
#スコアセット
scoreboard players set @e[tag=ki21-bomb-4,tag=ki21-init] offsetX 1500
scoreboard players set @e[tag=ki21-bomb-4,tag=ki21-init] offsetY 300
scoreboard players set @e[tag=ki21-bomb-4,tag=ki21-init] offsetZ 0
scoreboard players set @e[tag=ki21-bomb-4,tag=ki21-init] damage 250
scoreboard players operation @e[tag=ki21-bomb-4,tag=ki21-init] plane-id = @s plane-id
tag @e[tag=ki21-bomb-4,tag=ki21-init] remove ki21-init

#### 50kg爆弾5個目召喚 ####
execute if entity @s run summon armor_stand ~ ~ ~ {Tags:["ki21-bomb-5","ki21",ki21-init,plane,plane-bomb,plane-parts,entity-nohit,50kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:84,Unbreakable:1}},{}],Pose:{1Arm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=ki21-bomb-5,tag=ki21-init] offsetX 1500
scoreboard players set @e[tag=ki21-bomb-5,tag=ki21-init] offsetY 300
scoreboard players set @e[tag=ki21-bomb-5,tag=ki21-init] offsetZ 0
scoreboard players set @e[tag=ki21-bomb-5,tag=ki21-init] damage 250
scoreboard players operation @e[tag=ki21-bomb-5,tag=ki21-init] plane-id = @s plane-id
tag @e[tag=ki21-bomb-5,tag=ki21-init] remove ki21-init

#### 50kg爆弾6個目召喚 ####
execute if entity @s run summon armor_stand ~ ~ ~ {Tags:["ki21-bomb-6","ki21",ki21-init,plane,plane-bomb,plane-parts,entity-nohit,50kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:84,Unbreakable:1}},{}],Pose:{1Arm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=ki21-bomb-6,tag=ki21-init] offsetX 1500
scoreboard players set @e[tag=ki21-bomb-6,tag=ki21-init] offsetY 300
scoreboard players set @e[tag=ki21-bomb-6,tag=ki21-init] offsetZ 0
scoreboard players set @e[tag=ki21-bomb-6,tag=ki21-init] damage 250
scoreboard players operation @e[tag=ki21-bomb-6,tag=ki21-init] plane-id = @s plane-id
tag @e[tag=ki21-bomb-6,tag=ki21-init] remove ki21-init

#残弾スコア付与
scoreboard players set @s ammunition1 20
