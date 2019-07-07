#爆弾投下 ki-21
#実行者：機体

#実行者タグ付け
tag @s add bombing-executer

#投下対象判定
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[tag=plane-bomb,tag=plane,distance=..20,limit=1] if score @s plane-id = #plane-id reg1 run tag @s add drop-init
tag @e[tag=drop-init,distance=..20] add dropping

#ki21タグ削除
tag @e[tag=drop-init,distance=..20] remove plane

#対象がいなかったら召喚
scoreboard players operation #offset reg1 = @s ammunition1
scoreboard players operation #offset reg1 %= #3 Num
execute as @s[tag=50kg] unless entity @e[tag=drop-init,distance=..20] if score #offset reg1 matches 0 run summon armor_stand ^-0.5 ^-1 ^ {Tags:["ki21-bomb-7",drop-init,dropping,plane,plane-bomb,plane-parts,entity-nohit,50kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:84,Unbreakable:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
execute as @s[tag=50kg] unless entity @e[tag=drop-init,distance=..20] if score #offset reg1 matches 1 run summon armor_stand ^ ^-1 ^ {Tags:["ki21-bomb-7",drop-init,dropping,plane,plane-bomb,plane-parts,entity-nohit,50kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:84,Unbreakable:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
execute as @s[tag=50kg] unless entity @e[tag=drop-init,distance=..20] if score #offset reg1 matches 2 run summon armor_stand ^0.5 ^-1 ^ {Tags:["ki21-bomb-7",drop-init,dropping,plane,plane-bomb,plane-parts,entity-nohit,50kg,bomb-normal],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:84,Unbreakable:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
scoreboard players set @e[tag=ki21-bomb-7,tag=drop-init] damage 250

#スコア付与
scoreboard players operation @e[tag=drop-init,distance=..20] speed = @s speed
scoreboard players operation @e[tag=drop-init,distance=..20] speed /= #1000 Num
scoreboard players set @e[tag=drop-init,distance=..20] age 1200

#角度代入
execute store result entity @e[tag=drop-init,distance=..20,limit=1] Rotation[1] float 0.01 run scoreboard players get @s AngX
execute store result entity @e[tag=drop-init,distance=..20,limit=1] Rotation[0] float 0.01 run scoreboard players get @s AngY
scoreboard players operation #ang-x reg1 = @s AngX
scoreboard players remove #ang-x reg1 9000
execute store result entity @e[tag=drop-init,distance=..20,limit=1] Pose.RightArm[2] float 0.01 run scoreboard players get #ang-x reg1
execute as @e[tag=drop-init,distance=..20,limit=1] at @s run tp @s ~ ~ ~ ~90 ~

#発射したならreload時間設定
execute if entity @e[tag=gun-init,distance=..20] run scoreboard players set @s w1-reload 2

#残弾数減算
scoreboard players remove @s ammunition1 1

#音
playsound minecraft:block.piston.contract ambient @a ~ ~ ~ 1 1.5

#終了処理
tag @s remove bombing-executer
tag @e[tag=drop-init,distance=..20] remove drop-init
scoreboard players set @p[scores={rightClick=1..}] rightClick 0
