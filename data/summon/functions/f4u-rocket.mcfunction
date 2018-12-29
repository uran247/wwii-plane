#実行条件無し

#ロケット召喚
summon armor_stand ~ ~ ~ {Tags:["f4u-rocket","f4u",f4u-init,plane,plane-parts,rocket-nohit,rocket,hvar,rocket1,rocket-r],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:66,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-rocket","f4u",f4u-init,plane,plane-parts,rocket-nohit,rocket,hvar,rocket2,rocket-l],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:66,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-rocket","f4u",f4u-init,plane,plane-parts,rocket-nohit,rocket,hvar,rocket3,rocket-r],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:66,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-rocket","f4u",f4u-init,plane,plane-parts,rocket-nohit,rocket,hvar,rocket4,rocket-l],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:66,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-rocket","f4u",f4u-init,plane,plane-parts,rocket-nohit,rocket,hvar,rocket5,rocket-r],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:66,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-rocket","f4u",f4u-init,plane,plane-parts,rocket-nohit,rocket,hvar,rocket6,rocket-l],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:66,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-rocket","f4u",f4u-init,plane,plane-parts,rocket-nohit,rocket,hvar,rocket7,rocket-r],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:66,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-rocket","f4u",f4u-init,plane,plane-parts,rocket-nohit,rocket,hvar,rocket8,rocket-l],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:66,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}

#ID付与
scoreboard players set @e[tag=f4u-init,tag=f4u-rocket] plane-id 0
scoreboard players operation @e[tag=f4u-init] plane-id = @e[tag=f4u-root,tag=!armed,limit=1,sort=nearest] plane-id
tag @e[tag=f4u-root,tag=!armed,limit=1,sort=nearest] add armed
execute if score @e[tag=f4u-init,tag=f4u-rocket,limit=1] plane-id matches 0 run kill @e[tag=f4u-init,tag=f4u-rocket]
execute as @e[tag=f4u-init,tag=f4u-rocket] at @s store result entity @s Pose.RightArm[0] float 1 run scoreboard players get @e[tag=f4u-root,tag=!armed,limit=1,sort=nearest] AngX
execute as @e[tag=f4u-init,tag=f4u-rocket] at @s store result entity @s Pose.RightArm[2] float 1 run scoreboard players get @e[tag=f4u-root,tag=!armed,limit=1,sort=nearest] AngZ
execute as @e[tag=f4u-init,tag=f4u-rocket] at @s store result entity @s Rotation[0] float 1 run scoreboard players get @e[tag=f4u-root,tag=!armed,limit=1,sort=nearest] AngY

#基本スコア設定
scoreboard players set @e[tag=f4u-init,tag=f4u-rocket] AngX -1200
scoreboard players set @e[tag=f4u-init,tag=f4u-rocket] AngY 0
scoreboard players set @e[tag=f4u-init,tag=f4u-rocket] AngZ 0

#パーツのオフセット位置設定
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket1] offsetX -2620
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket1] offsetY -780
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init] offsetZ 0
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket2] offsetX 2620
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket2] offsetY -780
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket3] offsetX -3120
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket3] offsetY -680
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket4] offsetX 3120
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket4] offsetY -680
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket5] offsetX -3620
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket5] offsetY -580
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket6] offsetX 3620
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket6] offsetY -580
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket7] offsetX -4120
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket7] offsetY -480
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket8] offsetX 4120
scoreboard players set @e[tag=f4u-rocket,tag=f4u-init,tag=rocket8] offsetY -480

#処理終了
tag @e[tag=f4u-init] remove f4u-init
