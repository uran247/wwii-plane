#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[fw190d-root,fw190d,plane-init,plane-root,plane,entity-nohit,"7p7mm",has-weapon1,tier1,main-weapon1],CustomName:"{\"text\":\"fw190d\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256,NoGravity:0b,HandItems:[{id:"snowball",Count:1b,tag:{CustomModelData:1,weapons:["7.7mm gun"]}},{}]}
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[fw190d,plane-init,plane,entity-nohit,plane-seat],CustomName:"{\"text\":\"seat\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,Invulnerable:1b,DeathLootTable:"minecraft:entities/bat",SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[fw190d,plane-init,plane,plane-seat,entity-nohit]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["fw190d-body","fw190d",plane-init,plane,has-model,model-changeable,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:4,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["fw190d-hitbox","fw190d",plane-init,plane,plane-hitbox,has-offset,body,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"body\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["fw190d-hitbox","fw190d",plane-init,plane,plane-hitbox,has-offset,engine,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"engine\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["fw190d-hitbox","fw190d",plane-init,plane,plane-hitbox,has-offset,aileron-r,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["fw190d-hitbox","fw190d",plane-init,plane,plane-hitbox,has-offset,aileron-l,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["fw190d-hitbox","fw190d",plane-init,plane,plane-hitbox,has-offset,elevator-r,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["fw190d-hitbox","fw190d",plane-init,plane,plane-hitbox,has-offset,elevator-l,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["fw190d-hitbox","fw190d",plane-init,plane,plane-hitbox,has-offset,radder,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["fw190d-hitbox","fw190d",plane-init,plane,plane-hitbox,has-offset,cockpit,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}

#武装種別変更
execute if entity @e[tag=fw190d-spawner,distance=..0.1,tag=12p7mm] run tag @e[tag=plane-init,tag=fw190d-root] remove 7p7mm
execute if entity @e[tag=fw190d-spawner,distance=..0.1,tag=12p7mm] run tag @e[tag=plane-init,tag=fw190d-root] add 12p7mm
execute if entity @e[tag=fw190d-spawner,distance=..0.1,tag=12p7mm] run data modify entity @e[tag=plane-init,tag=fw190d-root,limit=1] HandItems[0].tag.weapons[0] set value "12.7mm gun"

#ID付与
execute as @e[tag=plane-init,tag=fw190d-root,limit=1] store result score @s plane-id run data get entity @s UUIDMost 0.000000000233
scoreboard players operation @e[tag=plane-init,tag=fw190d-root,limit=1,scores={plane-id=..-1}] plane-id *= #-1 Num
scoreboard players operation @e[tag=plane-init] plane-id = @e[tag=plane-init,tag=fw190d-root,limit=1] plane-id
execute as @e[tag=plane-init] store result entity @s Attributes[{Name:"generic.knockbackResistance"}].Base double 1 run scoreboard players get @s plane-id

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=plane-init,tag=fw190d-root] rolling 0
scoreboard players set @e[tag=plane-init,tag=fw190d-root] speed 0
scoreboard players set @e[tag=plane-init,tag=fw190d-root] max-speed 17900
scoreboard players set @e[tag=plane-init,tag=fw190d-root] cruise-speed 12300
scoreboard players set @e[tag=plane-init,tag=fw190d-root] takeoff-speed 4300
scoreboard players set @e[tag=plane-init,tag=fw190d-root] stall-speed 4100
scoreboard players set @e[tag=plane-init,tag=fw190d-root] accelerate 64
scoreboard players set @e[tag=plane-init,tag=fw190d-root] resistance 44
scoreboard players set @e[tag=plane-init,tag=fw190d-root] energy-loss 9
scoreboard players set @e[tag=plane-init,tag=fw190d-root] deaccelerate 57
scoreboard players set @e[tag=plane-init,tag=fw190d-root] plpr-start-min 1600
scoreboard players set @e[tag=plane-init,tag=fw190d-root] plpr-start-max 1700
scoreboard players set @e[tag=plane-init,tag=fw190d-root] plpr-stop-min 1400
scoreboard players set @e[tag=plane-init,tag=fw190d-root] plpr-stop-max 1500
scoreboard players set @e[tag=plane-init,tag=fw190d-root] gear-retract-min 5600
scoreboard players set @e[tag=plane-init,tag=fw190d-root] gear-retract-max 5800
scoreboard players set @e[tag=plane-init,tag=fw190d-root] gear-pullout-min 5300
scoreboard players set @e[tag=plane-init,tag=fw190d-root] gear-pullout-max 5500

scoreboard players set @e[tag=plane-init,tag=fw190d-root] landing-pitch -1250
scoreboard players set @e[tag=plane-init,tag=fw190d-root] AngX -1250
scoreboard players set @e[tag=plane-init,tag=fw190d-root] AngY 0
scoreboard players set @e[tag=plane-init,tag=fw190d-root] AngZ 0
scoreboard players set @e[tag=plane-init,tag=fw190d-root] AngY-old 0
scoreboard players set @e[tag=plane-init,tag=fw190d-root] pitch-speed 230
scoreboard players set @e[tag=plane-init,tag=fw190d-root] yaw-speed 260
scoreboard players set @e[tag=plane-init,tag=fw190d-root] roll-speed 650

scoreboard players set @e[tag=plane-init,tag=fw190d-root] parking-udvm 4
scoreboard players set @e[tag=plane-init,tag=fw190d-root] rolling-udvm 5
scoreboard players set @e[tag=plane-init,tag=fw190d-root] flying-udvm 6

scoreboard players set @e[tag=plane-init,tag=fw190d-root] w1-reload 0
scoreboard players set @e[tag=plane-init,tag=fw190d-root] w2-reload 0
scoreboard players set @e[tag=plane-init,tag=fw190d-root,tag=7p7mm] ammunition1 500
scoreboard players set @e[tag=plane-init,tag=fw190d-root,tag=12p7mm] ammunition1 270
scoreboard players set @e[tag=plane-init,tag=fw190d-root,tag=7p7mm] max-ammunition1 500
scoreboard players set @e[tag=plane-init,tag=fw190d-root,tag=12p7mm] max-ammunition1 270
scoreboard players set @e[tag=plane-init,tag=fw190d-root,tag=7p7mm] max-ammo-reload1 140
scoreboard players set @e[tag=plane-init,tag=fw190d-root,tag=12p7mm] max-ammo-reload1 210
scoreboard players set @e[tag=plane-init,tag=fw190d-root] plane-weapon 1
scoreboard players set @e[tag=plane-init,tag=fw190d-root] weapon-types 1

scoreboard players set @e[tag=plane-init,tag=fw190d-root] max-engine 1

execute store result score @e[tag=plane-init,tag=fw190d-root,limit=1] PosX run data get entity @e[tag=plane-init,tag=fw190d-root,limit=1] Pos[0] 10000
execute store result score @e[tag=plane-init,tag=fw190d-root,limit=1] PosY run data get entity @e[tag=plane-init,tag=fw190d-root,limit=1] Pos[1] 10000
execute store result score @e[tag=plane-init,tag=fw190d-root,limit=1] PosZ run data get entity @e[tag=plane-init,tag=fw190d-root,limit=1] Pos[2] 10000

#hitbocのスコア設定
scoreboard players set @e[tag=body,tag=plane-init] offsetX 0
scoreboard players set @e[tag=body,tag=plane-init] offsetY 0
scoreboard players set @e[tag=body,tag=plane-init] offsetZ 0
scoreboard players set @e[tag=engine,tag=plane-init] offsetX 0
scoreboard players set @e[tag=engine,tag=plane-init] offsetY -100
scoreboard players set @e[tag=engine,tag=plane-init] offsetZ -1500
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetX -3000
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetY 0
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetZ -100
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetX 3000
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetY 0
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetZ -100
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetX -900
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetY -300
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetZ 5400
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetX 900
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetY -300
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetZ 5400
scoreboard players set @e[tag=radder,tag=plane-init] offsetX 0
scoreboard players set @e[tag=radder,tag=plane-init] offsetY -1000
scoreboard players set @e[tag=radder,tag=plane-init] offsetZ 5600
scoreboard players set @e[tag=cockpit,tag=plane-init] offsetX 0
scoreboard players set @e[tag=cockpit,tag=plane-init] offsetY -1000
scoreboard players set @e[tag=cockpit,tag=plane-init] offsetZ 5400


#プレイヤーと同じAngYにする
execute at @e[tag=plane-init,tag=fw190d-root,limit=1] store result score @p reg1 run data get entity @p Rotation[0] 100
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
execute at @e[tag=plane-init,tag=fw190d-root,limit=1] run scoreboard players operation @e[tag=plane-init,tag=fw190d-root,limit=1] AngY = @p reg1

#処理終了
tag @e[tag=plane-init] remove plane-init
