#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[a5m-root,a5m,plane-init,plane-root,plane,entity-nohit,has-weapon1,tier1,main-weapon1],CustomName:"{\"text\":\"a5m\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256,NoGravity:0b,HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{weapons:["7.7mm gun"]}},{}]}
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[a5m,plane-init,plane,entity-nohit,plane-seat],CustomName:"{\"text\":\"seat\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,Invulnerable:1b,DeathLootTable:"minecraft:entities/bat",SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[a5m,plane-init,plane,plane-seat,entity-nohit]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["a5m-body","a5m",plane-init,plane,has-model,model-changeable,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:85,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["a5m-hitbox","a5m",plane-init,plane,plane-hitbox,has-offset,body,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"body\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a5m-hitbox","a5m",plane-init,plane,plane-hitbox,has-offset,engine,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"engine\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a5m-hitbox","a5m",plane-init,plane,plane-hitbox,has-offset,aileron-r,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a5m-hitbox","a5m",plane-init,plane,plane-hitbox,has-offset,aileron-l,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a5m-hitbox","a5m",plane-init,plane,plane-hitbox,has-offset,elevator-r,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a5m-hitbox","a5m",plane-init,plane,plane-hitbox,has-offset,elevator-l,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a5m-hitbox","a5m",plane-init,plane,plane-hitbox,has-offset,radder,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a5m-hitbox","a5m",plane-init,plane,plane-hitbox,has-offset,cockpit,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}

#ID付与
execute as @e[tag=plane-init,tag=a5m-root,limit=1] store result score @s plane-id run data get entity @s UUIDMost 0.000000000233
scoreboard players operation @e[tag=plane-init,tag=a5m-root,limit=1,scores={plane-id=..-1}] plane-id *= #-1 Num
scoreboard players operation @e[tag=plane-init] plane-id = @e[tag=plane-init,tag=a5m-root,limit=1] plane-id
execute as @e[tag=plane-init] store result entity @s Attributes[{Name:"generic.knockbackResistance"}].Base double 1 run scoreboard players get @s plane-id

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=plane-init,tag=a5m-root] rolling 0
scoreboard players set @e[tag=plane-init,tag=a5m-root] speed 0
scoreboard players set @e[tag=plane-init,tag=a5m-root] max-speed 15100
scoreboard players set @e[tag=plane-init,tag=a5m-root] cruise-speed 9375
scoreboard players set @e[tag=plane-init,tag=a5m-root] takeoff-speed 4600
scoreboard players set @e[tag=plane-init,tag=a5m-root] stall-speed 4400
scoreboard players set @e[tag=plane-init,tag=a5m-root] accelerate 66
scoreboard players set @e[tag=plane-init,tag=a5m-root] resistance 41
scoreboard players set @e[tag=plane-init,tag=a5m-root] energy-loss 8
scoreboard players set @e[tag=plane-init,tag=a5m-root] deaccelerate 73
scoreboard players set @e[tag=plane-init,tag=a5m-root] plpr-start-min 1600
scoreboard players set @e[tag=plane-init,tag=a5m-root] plpr-start-max 1700
scoreboard players set @e[tag=plane-init,tag=a5m-root] plpr-stop-min 1400
scoreboard players set @e[tag=plane-init,tag=a5m-root] plpr-stop-max 1500
scoreboard players set @e[tag=plane-init,tag=a5m-root] gear-retract-min 5900
scoreboard players set @e[tag=plane-init,tag=a5m-root] gear-retract-max 6100
scoreboard players set @e[tag=plane-init,tag=a5m-root] gear-pullout-min 5600
scoreboard players set @e[tag=plane-init,tag=a5m-root] gear-pullout-max 5800

scoreboard players set @e[tag=plane-init,tag=a5m-root] landing-pitch -1400
scoreboard players set @e[tag=plane-init,tag=a5m-root] AngX -1400
scoreboard players set @e[tag=plane-init,tag=a5m-root] AngY 0
scoreboard players set @e[tag=plane-init,tag=a5m-root] AngZ 0
scoreboard players set @e[tag=plane-init,tag=a5m-root] AngY-old 0
scoreboard players set @e[tag=plane-init,tag=a5m-root] pitch-speed 250
scoreboard players set @e[tag=plane-init,tag=a5m-root] yaw-speed 290
scoreboard players set @e[tag=plane-init,tag=a5m-root] roll-speed 480

scoreboard players set @e[tag=plane-init,tag=a5m-root] parking-udvm 85
scoreboard players set @e[tag=plane-init,tag=a5m-root] rolling-udvm 86
scoreboard players set @e[tag=plane-init,tag=a5m-root] flying-udvm 86

scoreboard players set @e[tag=plane-init,tag=a5m-root] w1-reload 0
scoreboard players set @e[tag=plane-init,tag=a5m-root] w2-reload 0
scoreboard players set @e[tag=plane-init,tag=a5m-root] ammunition1 500
scoreboard players set @e[tag=plane-init,tag=a5m-root] max-ammunition1 500
scoreboard players set @e[tag=plane-init,tag=a5m-root] max-ammo-reload1 140
scoreboard players set @e[tag=plane-init,tag=a5m-root] plane-weapon 1
scoreboard players set @e[tag=plane-init,tag=a5m-root] weapon-types 1

execute store result score @e[tag=plane-init,tag=a5m-root,limit=1] PosX run data get entity @e[tag=plane-init,tag=a5m-root,limit=1] Pos[0] 10000
execute store result score @e[tag=plane-init,tag=a5m-root,limit=1] PosY run data get entity @e[tag=plane-init,tag=a5m-root,limit=1] Pos[1] 10000
execute store result score @e[tag=plane-init,tag=a5m-root,limit=1] PosZ run data get entity @e[tag=plane-init,tag=a5m-root,limit=1] Pos[2] 10000

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
execute at @e[tag=plane-init,tag=a5m-root,limit=1] store result score @p reg1 run data get entity @p Rotation[0] 100
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
execute at @e[tag=plane-init,tag=a5m-root,limit=1] run scoreboard players operation @e[tag=plane-init,tag=a5m-root,limit=1] AngY = @p reg1

#処理終了
tag @e[tag=plane-init] remove plane-init