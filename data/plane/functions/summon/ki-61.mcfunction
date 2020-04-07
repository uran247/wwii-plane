#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[ki61-root,ki61,plane-init,plane-root,plane,entity-nohit,has-weapon1,tier2,main-weapon1],CustomName:"{\"text\":\"ki61\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256,NoGravity:0b,HandItems:[{id:"snowball",Count:1b,tag:{CustomModelData:1,weapons:["12.7mm gun"]}},{}]}
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[ki61,plane-init,plane,entity-nohit,plane-seat],CustomName:"{\"text\":\"seat\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,Invulnerable:1b,DeathLootTable:"minecraft:entities/bat",SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[ki61,plane-init,plane,plane-seat,entity-nohit]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["ki61-body","ki61",plane-init,plane,has-model,model-changeable,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:102,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["ki61-hitbox","ki61",plane-init,plane,plane-hitbox,has-offset,body,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"body\"}",Health:160f,Attributes:[{Name:generic.maxHealth,Base:160}]}
summon armor_stand ~ ~ ~ {Tags:["ki61-hitbox","ki61",plane-init,plane,plane-hitbox,has-offset,engine,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"engine\"}",Health:160f,Attributes:[{Name:generic.maxHealth,Base:160}]}
summon armor_stand ~ ~ ~ {Tags:["ki61-hitbox","ki61",plane-init,plane,plane-hitbox,has-offset,aileron-r,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-right\"}",Health:160f,Attributes:[{Name:generic.maxHealth,Base:160}]}
summon armor_stand ~ ~ ~ {Tags:["ki61-hitbox","ki61",plane-init,plane,plane-hitbox,has-offset,aileron-l,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-left\"}",Health:160f,Attributes:[{Name:generic.maxHealth,Base:160}]}
summon armor_stand ~ ~ ~ {Tags:["ki61-hitbox","ki61",plane-init,plane,plane-hitbox,has-offset,elevator-r,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-right\"}",Health:160f,Attributes:[{Name:generic.maxHealth,Base:160}]}
summon armor_stand ~ ~ ~ {Tags:["ki61-hitbox","ki61",plane-init,plane,plane-hitbox,has-offset,elevator-l,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-left\"}",Health:160f,Attributes:[{Name:generic.maxHealth,Base:160}]}
summon armor_stand ~ ~ ~ {Tags:["ki61-hitbox","ki61",plane-init,plane,plane-hitbox,has-offset,radder,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:160f,Attributes:[{Name:generic.maxHealth,Base:160}]}
summon armor_stand ~ ~ ~ {Tags:["ki61-hitbox","ki61",plane-init,plane,plane-hitbox,has-offset,cockpit,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:160f,Attributes:[{Name:generic.maxHealth,Base:160}]}

#ID付与
execute as @e[tag=plane-init,tag=ki61-root,limit=1] store result score @s plane-id run data get entity @s UUIDMost 0.000000000233
scoreboard players operation @e[tag=plane-init,tag=ki61-root,limit=1,scores={plane-id=..-1}] plane-id *= #-1 Num
scoreboard players operation @e[tag=plane-init] plane-id = @e[tag=plane-init,tag=ki61-root,limit=1] plane-id
execute as @e[tag=plane-init] store result entity @s Attributes[{Name:"generic.knockbackResistance"}].Base double 1 run scoreboard players get @s plane-id

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=plane-init,tag=ki61-root] rolling 0
scoreboard players set @e[tag=plane-init,tag=ki61-root] speed 0
scoreboard players set @e[tag=plane-init,tag=ki61-root] max-speed 21000
scoreboard players set @e[tag=plane-init,tag=ki61-root] cruise-speed 13900
scoreboard players set @e[tag=plane-init,tag=ki61-root] takeoff-speed 5300
scoreboard players set @e[tag=plane-init,tag=ki61-root] stall-speed 5100
scoreboard players set @e[tag=plane-init,tag=ki61-root] accelerate 79
scoreboard players set @e[tag=plane-init,tag=ki61-root] resistance 52
scoreboard players set @e[tag=plane-init,tag=ki61-root] energy-loss 10
scoreboard players set @e[tag=plane-init,tag=ki61-root] deaccelerate 79
scoreboard players set @e[tag=plane-init,tag=ki61-root] plpr-start-min 1600
scoreboard players set @e[tag=plane-init,tag=ki61-root] plpr-start-max 1700
scoreboard players set @e[tag=plane-init,tag=ki61-root] plpr-stop-min 1400
scoreboard players set @e[tag=plane-init,tag=ki61-root] plpr-stop-max 1500
scoreboard players set @e[tag=plane-init,tag=ki61-root] gear-retract-min 6600
scoreboard players set @e[tag=plane-init,tag=ki61-root] gear-retract-max 6800
scoreboard players set @e[tag=plane-init,tag=ki61-root] gear-pullout-min 6300
scoreboard players set @e[tag=plane-init,tag=ki61-root] gear-pullout-max 6500

scoreboard players set @e[tag=plane-init,tag=ki61-root] landing-pitch -1300
scoreboard players set @e[tag=plane-init,tag=ki61-root] AngX -1300
scoreboard players set @e[tag=plane-init,tag=ki61-root] AngY 0
scoreboard players set @e[tag=plane-init,tag=ki61-root] AngZ 0
scoreboard players set @e[tag=plane-init,tag=ki61-root] AngY-old 0
scoreboard players set @e[tag=plane-init,tag=ki61-root] pitch-speed 180
scoreboard players set @e[tag=plane-init,tag=ki61-root] yaw-speed 180
scoreboard players set @e[tag=plane-init,tag=ki61-root] roll-speed 1300

scoreboard players set @e[tag=plane-init,tag=ki61-root] parking-udvm 102
scoreboard players set @e[tag=plane-init,tag=ki61-root] rolling-udvm 103
scoreboard players set @e[tag=plane-init,tag=ki61-root] flying-udvm 104

scoreboard players set @e[tag=plane-init,tag=ki61-root] w1-reload 0
scoreboard players set @e[tag=plane-init,tag=ki61-root] ammunition1 250
scoreboard players set @e[tag=plane-init,tag=ki61-root] max-ammunition1 250
scoreboard players set @e[tag=plane-init,tag=ki61-root] max-ammo-reload1 140
scoreboard players set @e[tag=plane-init,tag=ki61-root] plane-weapon 1
scoreboard players set @e[tag=plane-init,tag=ki61-root] weapon-types 1

scoreboard players set @e[tag=plane-init,tag=ki61-root] max-engine 1

execute store result score @e[tag=plane-init,tag=ki61-root,limit=1] PosX run data get entity @e[tag=plane-init,tag=ki61-root,limit=1] Pos[0] 10000
execute store result score @e[tag=plane-init,tag=ki61-root,limit=1] PosY run data get entity @e[tag=plane-init,tag=ki61-root,limit=1] Pos[1] 10000
execute store result score @e[tag=plane-init,tag=ki61-root,limit=1] PosZ run data get entity @e[tag=plane-init,tag=ki61-root,limit=1] Pos[2] 10000

#hitboxのスコア設定
scoreboard players set @e[tag=body,tag=plane-init] offsetX 0
scoreboard players set @e[tag=body,tag=plane-init] offsetY 0
scoreboard players set @e[tag=body,tag=plane-init] offsetZ 0
scoreboard players set @e[tag=engine,tag=plane-init] offsetX 0
scoreboard players set @e[tag=engine,tag=plane-init] offsetY 0
scoreboard players set @e[tag=engine,tag=plane-init] offsetZ -2900
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetX -3000
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetY 400
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetZ -1400
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetX 3000
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetY 400
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetZ -1400
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetX -1000
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetY 100
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetZ 3500
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetX 1000
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetY 100
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetZ 3500
scoreboard players set @e[tag=radder,tag=plane-init] offsetX 0
scoreboard players set @e[tag=radder,tag=plane-init] offsetY -700
scoreboard players set @e[tag=radder,tag=plane-init] offsetZ 4300
scoreboard players set @e[tag=cockpit,tag=plane-init] offsetX 0
scoreboard players set @e[tag=cockpit,tag=plane-init] offsetY -700
scoreboard players set @e[tag=cockpit,tag=plane-init] offsetZ -700


#プレイヤーと同じAngYにする
execute at @e[tag=plane-init,tag=ki61-root,limit=1] store result score @p reg1 run data get entity @p Rotation[0] 100
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
execute at @e[tag=plane-init,tag=ki61-root,limit=1] run scoreboard players operation @e[tag=plane-init,tag=ki61-root,limit=1] AngY = @p reg1

#処理終了
tag @e[tag=plane-init] remove plane-init
