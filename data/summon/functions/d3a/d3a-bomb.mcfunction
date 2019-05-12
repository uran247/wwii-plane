#d3aの爆弾召喚
#実行者：機体
#使用可能タグ d3a-position-target d3a-position-executer

#### 60kg爆弾1個目召喚 ####
execute if entity @s[tag=60kg,tag=normal] run summon armor_stand ~ ~ ~ {Tags:["d3a-bomb-right","d3a",d3a-init,plane,has-offset,has-model,plane-bomb,plane-parts,entity-nohit,60kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:76,Unbreakable:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
#スコアセット
scoreboard players set @e[tag=d3a-bomb-right,tag=d3a-init] offsetX -4650
scoreboard players set @e[tag=d3a-bomb-right,tag=d3a-init] offsetY 650
scoreboard players set @e[tag=d3a-bomb-right,tag=d3a-init] offsetZ 0
scoreboard players set @e[tag=d3a-bomb-right,tag=d3a-init] damage 300
scoreboard players operation @e[tag=d3a-bomb-right,tag=d3a-init] plane-id = @s plane-id
execute as @e[tag=d3a-bomb-right,tag=d3a-init] store result entity @s Attributes[1].Base double 1 run scoreboard players get @s plane-id
tag @e[tag=d3a-bomb-right,tag=d3a-init] remove d3a-init


#### 60kg爆弾2個目召喚 ####
execute if entity @s[tag=60kg,tag=normal] run summon armor_stand ~ ~ ~ {Tags:["d3a-bomb-left","d3a",d3a-init,plane,has-offset,has-model,plane-bomb,plane-parts,entity-nohit,60kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:76,Unbreakable:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=d3a-bomb-left,tag=d3a-init] offsetX 4700
scoreboard players set @e[tag=d3a-bomb-left,tag=d3a-init] offsetY 450
scoreboard players set @e[tag=d3a-bomb-left,tag=d3a-init] offsetZ 0
scoreboard players set @e[tag=d3a-bomb-left,tag=d3a-init] damage 300
scoreboard players operation @e[tag=d3a-bomb-left,tag=d3a-init] plane-id = @s plane-id
execute as @e[tag=d3a-bomb-left,tag=d3a-init] store result entity @s Attributes[1].Base double 1 run scoreboard players get @s plane-id
tag @e[tag=d3a-bomb-left,tag=d3a-init] remove d3a-init

#### 250kg爆弾1個目召喚 ####
execute if entity @s[tag=250kg,tag=normal] run summon armor_stand ~ ~ ~ {Tags:["d3a-bomb-center","d3a",d3a-init,plane,has-offset,has-model,plane-bomb,plane-parts,entity-nohit,250kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:77,Unbreakable:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=d3a-bomb-center,tag=d3a-init] offsetX 0
scoreboard players set @e[tag=d3a-bomb-center,tag=d3a-init] offsetY 1200
scoreboard players set @e[tag=d3a-bomb-center,tag=d3a-init] offsetZ 0
scoreboard players set @e[tag=d3a-bomb-center,tag=d3a-init] damage 1250
scoreboard players operation @e[tag=d3a-bomb-center,tag=d3a-init] plane-id = @s plane-id
execute as @e[tag=d3a-bomb-center,tag=d3a-init] store result entity @s Attributes[1].Base double 1 run scoreboard players get @s plane-id
tag @e[tag=d3a-bomb-center,tag=d3a-init] remove d3a-init

#残弾スコア付与
scoreboard players set @s ammunition2 3
