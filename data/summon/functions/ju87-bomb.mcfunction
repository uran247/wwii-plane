#実行条件無し

#機体召喚
summon armor_stand ~ ~ ~ {Tags:["ju87-bomb","ju87",ju87-init,plane,plane-parts,bomb-nohit,bomb],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:33,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}

#ID付与
scoreboard players set @e[tag=ju87-init,tag=ju87-bomb] plane-id 0
scoreboard players operation @e[tag=ju87-init] plane-id = @e[tag=ju87-root,tag=!armed,limit=1,sort=nearest] plane-id
tag @e[tag=ju87-root,tag=!armed,limit=1,sort=nearest] add armed
execute if score @e[tag=ju87-init,tag=ju87-bomb,limit=1] plane-id matches 0 run kill @e[tag=ju87-init,tag=ju87-bomb,limit=1]
execute as @e[tag=ju87-init,tag=ju87-bomb] at @s store result entity @s Pose.RightArm[0] float 1 run scoreboard players get @e[tag=ju87-root,tag=!armed,limit=1,sort=nearest] AngX
execute as @e[tag=ju87-init,tag=ju87-bomb] at @s store result entity @s Pose.RightArm[2] float 1 run scoreboard players get @e[tag=ju87-root,tag=!armed,limit=1,sort=nearest] AngZ
execute as @e[tag=ju87-init,tag=ju87-bomb] at @s store result entity @s Rotation[0] float 1 run scoreboard players get @e[tag=ju87-root,tag=!armed,limit=1,sort=nearest] AngY

#処理終了
tag @e[tag=ju87-init] remove ju87-init
