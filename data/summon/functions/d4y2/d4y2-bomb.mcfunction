#d4y2の爆弾召喚
#実行者：機体
#使用可能タグ d4y2-position-target d4y2-position-executer

#### 60kg爆弾1個目召喚 ####
execute if entity @s[tag=60kg,tag=normal] run summon armor_stand ~ ~ ~ {Tags:["d4y2-bomb-right","d4y2",d4y2-init,plane,has-offset,has-model,plane-bomb,plane-parts,entity-nohit,60kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:76,Unbreakable:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
#スコアセット
scoreboard players set @e[tag=d4y2-bomb-right,tag=d4y2-init] offsetX -3100
scoreboard players set @e[tag=d4y2-bomb-right,tag=d4y2-init] offsetY 800
scoreboard players set @e[tag=d4y2-bomb-right,tag=d4y2-init] offsetZ -3000
scoreboard players set @e[tag=d4y2-bomb-right,tag=d4y2-init] damage 300
scoreboard players operation @e[tag=d4y2-bomb-right,tag=d4y2-init] plane-id = @s plane-id
execute as @e[tag=d4y2-bomb-right,tag=d4y2-init] store result entity @s Attributes[1].Base double 1 run scoreboard players get @s plane-id
tag @e[tag=d4y2-bomb-right,tag=d4y2-init] remove d4y2-init


#### 60kg爆弾2個目召喚 ####
execute if entity @s[tag=60kg,tag=normal] run summon armor_stand ~ ~ ~ {Tags:["d4y2-bomb-left","d4y2",d4y2-init,plane,has-offset,has-model,plane-bomb,plane-parts,entity-nohit,60kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:76,Unbreakable:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=d4y2-bomb-left,tag=d4y2-init] offsetX 3100
scoreboard players set @e[tag=d4y2-bomb-left,tag=d4y2-init] offsetY 800
scoreboard players set @e[tag=d4y2-bomb-left,tag=d4y2-init] offsetZ -3000
scoreboard players set @e[tag=d4y2-bomb-left,tag=d4y2-init] damage 300
scoreboard players operation @e[tag=d4y2-bomb-left,tag=d4y2-init] plane-id = @s plane-id
execute as @e[tag=d4y2-bomb-left,tag=d4y2-init] store result entity @s Attributes[1].Base double 1 run scoreboard players get @s plane-id
tag @e[tag=d4y2-bomb-left,tag=d4y2-init] remove d4y2-init

#### 250kg爆弾1個目召喚 ####
execute if entity @s[tag=250kg,tag=normal] run summon armor_stand ~ ~ ~ {Tags:["d4y2-bomb-center","d4y2",d4y2-init,plane,has-offset,has-model,plane-bomb,plane-parts,entity-nohit,250kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:77,Unbreakable:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=d4y2-bomb-center,tag=d4y2-init] offsetX 0
scoreboard players set @e[tag=d4y2-bomb-center,tag=d4y2-init] offsetY 800
scoreboard players set @e[tag=d4y2-bomb-center,tag=d4y2-init] offsetZ -3000
scoreboard players set @e[tag=d4y2-bomb-center,tag=d4y2-init] damage 1250
scoreboard players operation @e[tag=d4y2-bomb-center,tag=d4y2-init] plane-id = @s plane-id
execute as @e[tag=d4y2-bomb-center,tag=d4y2-init] store result entity @s Attributes[1].Base double 1 run scoreboard players get @s plane-id
tag @e[tag=d4y2-bomb-center,tag=d4y2-init] remove d4y2-init

#残弾スコア付与
scoreboard players set @s ammunition2 3
