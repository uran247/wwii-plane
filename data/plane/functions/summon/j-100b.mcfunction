#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[j100b-root,j100b,plane-init,plane-root,plane,entity-nohit,has-weapon1,tier1,main-weapon1,missiled,aam],CustomName:"{\"text\":\"j100b\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256,NoGravity:0b,HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{weapons:["7.7mm gun"]}},{}]}
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[j100b,plane-init,plane,entity-nohit,plane-seat],CustomName:"{\"text\":\"seat\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,Invulnerable:1b,DeathLootTable:"minecraft:entities/bat",SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[j100b,plane-init,plane,plane-seat,entity-nohit]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["j100b-body","j100b",plane-init,plane,has-model,model-changeable-cmd,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:gunpowder",Count:1b,tag:{CustomModelData:1}},{}],Pose:{RightArm:[0f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["j100b-hitbox","j100b",plane-init,plane,plane-hitbox,has-offset,body,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"body\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["j100b-hitbox","j100b",plane-init,plane,plane-hitbox,has-offset,engine,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"engine\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["j100b-hitbox","j100b",plane-init,plane,plane-hitbox,has-offset,aileron-r,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["j100b-hitbox","j100b",plane-init,plane,plane-hitbox,has-offset,aileron-l,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["j100b-hitbox","j100b",plane-init,plane,plane-hitbox,has-offset,elevator-r,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["j100b-hitbox","j100b",plane-init,plane,plane-hitbox,has-offset,elevator-l,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["j100b-hitbox","j100b",plane-init,plane,plane-hitbox,has-offset,radder,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["j100b-hitbox","j100b",plane-init,plane,plane-hitbox,has-offset,cockpit,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}

#ID付与
execute as @e[tag=plane-init,tag=j100b-root,limit=1] store result score @s plane-id run data get entity @s UUIDMost 0.000000000233
scoreboard players operation @e[tag=plane-init,tag=j100b-root,limit=1,scores={plane-id=..-1}] plane-id *= #-1 Num
scoreboard players operation @e[tag=plane-init] plane-id = @e[tag=plane-init,tag=j100b-root,limit=1] plane-id
execute as @e[tag=plane-init] store result entity @s Attributes[{Name:"generic.knockbackResistance"}].Base double 1 run scoreboard players get @s plane-id

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=plane-init,tag=j100b-root] rolling 0
scoreboard players set @e[tag=plane-init,tag=j100b-root] speed 0
scoreboard players set @e[tag=plane-init,tag=j100b-root] max-speed 15100
scoreboard players set @e[tag=plane-init,tag=j100b-root] cruise-speed 9375
scoreboard players set @e[tag=plane-init,tag=j100b-root] takeoff-speed 4600
scoreboard players set @e[tag=plane-init,tag=j100b-root] stall-speed 4400
scoreboard players set @e[tag=plane-init,tag=j100b-root] accelerate 66
scoreboard players set @e[tag=plane-init,tag=j100b-root] resistance 41
scoreboard players set @e[tag=plane-init,tag=j100b-root] energy-loss 8
scoreboard players set @e[tag=plane-init,tag=j100b-root] deaccelerate 73
scoreboard players set @e[tag=plane-init,tag=j100b-root] plpr-start-min 1600
scoreboard players set @e[tag=plane-init,tag=j100b-root] plpr-start-max 1700
scoreboard players set @e[tag=plane-init,tag=j100b-root] plpr-stop-min 1400
scoreboard players set @e[tag=plane-init,tag=j100b-root] plpr-stop-max 1500
scoreboard players set @e[tag=plane-init,tag=j100b-root] gear-retract-min 5900
scoreboard players set @e[tag=plane-init,tag=j100b-root] gear-retract-max 6100
scoreboard players set @e[tag=plane-init,tag=j100b-root] gear-pullout-min 5600
scoreboard players set @e[tag=plane-init,tag=j100b-root] gear-pullout-max 5800

scoreboard players set @e[tag=plane-init,tag=j100b-root] landing-pitch 0
scoreboard players set @e[tag=plane-init,tag=j100b-root] AngX 0
scoreboard players set @e[tag=plane-init,tag=j100b-root] AngY 0
scoreboard players set @e[tag=plane-init,tag=j100b-root] AngZ 0
scoreboard players set @e[tag=plane-init,tag=j100b-root] AngY-old 0
scoreboard players set @e[tag=plane-init,tag=j100b-root] pitch-speed 250
scoreboard players set @e[tag=plane-init,tag=j100b-root] yaw-speed 290
scoreboard players set @e[tag=plane-init,tag=j100b-root] roll-speed 480

scoreboard players set @e[tag=plane-init,tag=j100b-root] parking-udvm 1
scoreboard players set @e[tag=plane-init,tag=j100b-root] rolling-udvm 1
scoreboard players set @e[tag=plane-init,tag=j100b-root] flying-udvm 2

scoreboard players set @e[tag=plane-init,tag=j100b-root] w1-reload 0
scoreboard players set @e[tag=plane-init,tag=j100b-root] w2-reload 0
scoreboard players set @e[tag=plane-init,tag=j100b-root] ammunition1 500
scoreboard players set @e[tag=plane-init,tag=j100b-root] max-ammunition1 500
scoreboard players set @e[tag=plane-init,tag=j100b-root] max-ammo-reload1 140
scoreboard players set @e[tag=plane-init,tag=j100b-root] ammunition2 2
scoreboard players set @e[tag=plane-init,tag=j100b-root] max-ammunition2 2
scoreboard players set @e[tag=plane-init,tag=j100b-root] max-ammo-reload2 300
scoreboard players set @e[tag=plane-init,tag=j100b-root] plane-weapon 1
scoreboard players set @e[tag=plane-init,tag=j100b-root] weapon-types 1

execute store result score @e[tag=plane-init,tag=j100b-root,limit=1] PosX run data get entity @e[tag=plane-init,tag=j100b-root,limit=1] Pos[0] 10000
execute store result score @e[tag=plane-init,tag=j100b-root,limit=1] PosY run data get entity @e[tag=plane-init,tag=j100b-root,limit=1] Pos[1] 10000
execute store result score @e[tag=plane-init,tag=j100b-root,limit=1] PosZ run data get entity @e[tag=plane-init,tag=j100b-root,limit=1] Pos[2] 10000

#hitbocのスコア設定
scoreboard players set @e[tag=body,tag=plane-init] offsetX 0
scoreboard players set @e[tag=body,tag=plane-init] offsetY 0
scoreboard players set @e[tag=body,tag=plane-init] offsetZ 0
scoreboard players set @e[tag=engine,tag=plane-init] offsetX 0
scoreboard players set @e[tag=engine,tag=plane-init] offsetY 200
scoreboard players set @e[tag=engine,tag=plane-init] offsetZ -2700
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetX -3000
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetY 400
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetZ -1400
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetX 3000
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetY 400
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetZ -1400
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetX -900
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetY 300
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetZ 3100
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetX 900
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetY 300
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetZ 3100
scoreboard players set @e[tag=radder,tag=plane-init] offsetX 0
scoreboard players set @e[tag=radder,tag=plane-init] offsetY -500
scoreboard players set @e[tag=radder,tag=plane-init] offsetZ 3500
scoreboard players set @e[tag=cockpit,tag=plane-init] offsetX 0
scoreboard players set @e[tag=cockpit,tag=plane-init] offsetY -500
scoreboard players set @e[tag=cockpit,tag=plane-init] offsetZ -1300


#プレイヤーと同じAngYにする
execute at @e[tag=plane-init,tag=j100b-root,limit=1] store result score @p reg1 run data get entity @p Rotation[0] 100
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
execute at @e[tag=plane-init,tag=j100b-root,limit=1] run scoreboard players operation @e[tag=plane-init,tag=j100b-root,limit=1] AngY = @p reg1

#処理終了
tag @e[tag=plane-init] remove plane-init
