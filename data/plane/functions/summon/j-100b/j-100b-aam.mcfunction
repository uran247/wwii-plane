#j100bの爆弾召喚
#実行者：機体
#使用可能タグ j100b-position-target j100b-position-executer

#### aam爆弾1個目召喚 ####
execute if entity @s[tag=aam] run summon armor_stand ~ ~ ~ {Tags:["j100b-missile-right","j100b",j100b-init,plane,has-offset,has-model,plane-missile,plane-parts,entity-nohit,aam,missile-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:gunpowder",Count:1b,tag:{CustomModelData:3}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
#スコアセット
scoreboard players set @e[tag=j100b-missile-right,tag=j100b-init] offsetX -2800
scoreboard players set @e[tag=j100b-missile-right,tag=j100b-init] offsetY 580
scoreboard players set @e[tag=j100b-missile-right,tag=j100b-init] offsetZ 500
scoreboard players set @e[tag=j100b-missile-right,tag=j100b-init] damage 300
scoreboard players operation @e[tag=j100b-missile-right,tag=j100b-init] plane-id = @s plane-id
execute as @e[tag=j100b-missile-right,tag=j100b-init] store result entity @s Attributes[{Name:"generic.knockbackResistance"}].Base double 1 run scoreboard players get @s plane-id
tag @e[tag=j100b-missile-right,tag=j100b-init] remove j100b-init


#### aam爆弾2個目召喚 ####
execute if entity @s[tag=aam] run summon armor_stand ~ ~ ~ {Tags:["j100b-missile-left","j100b",j100b-init,plane,has-offset,has-model,plane-missile,plane-parts,entity-nohit,aam,missile-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:gunpowder",Count:1b,tag:{CustomModelData:3}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=j100b-missile-left,tag=j100b-init] offsetX 2800
scoreboard players set @e[tag=j100b-missile-left,tag=j100b-init] offsetY 580
scoreboard players set @e[tag=j100b-missile-left,tag=j100b-init] offsetZ 500
scoreboard players set @e[tag=j100b-missile-left,tag=j100b-init] damage 300
scoreboard players operation @e[tag=j100b-missile-left,tag=j100b-init] plane-id = @s plane-id
execute as @e[tag=j100b-missile-left,tag=j100b-init] store result entity @s Attributes[{Name:"generic.knockbackResistance"}].Base double 1 run scoreboard players get @s plane-id
tag @e[tag=j100b-missile-left,tag=j100b-init] remove j100b-init

#残弾スコア付与
scoreboard players set @s ammunition2 2

#tellraw @p [{"score" : {"name":"@e[tag=plane-missile,limit=1]", "objective":"plane-id"}}, {"text":" "}, {"score" : {"name":"@s", "objective":"plane-id"}}]
