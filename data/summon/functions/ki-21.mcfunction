#実行条件無し

#機体召喚
summon armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[ki21-root,ki21,plane-init,plane-root,plane,entity-nohit,bombed,normal,50kg,has-weapon1],CustomName:"{\"text\":\"ki21\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[ki21,plane-init,plane,entity-nohit,plane-seat],CustomName:"{\"text\":\"seat\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,DeathLootTable:"minecraft:entities/bat",SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[ki21,plane-init,plane,plane-seat,entity-nohit]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["ki21-body","ki21",plane-init,plane,has-model,model-changeable,plane-parts,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:78,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["ki21-tail","ki21",plane-init,plane,has-model,plane-parts,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:83,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["ki21-rightwing","ki21",plane-init,plane,has-model,has-offset,plane-parts,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:81,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["ki21-leftwing","ki21",plane-init,plane,has-model,has-offset,plane-parts,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:82,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256}

#hitbox召喚
summon armor_stand ~ ~ ~ {Tags:["ki21-hitbox","ki21",plane-init,plane,has-offset,plane-hitbox,body,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"body\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki21-hitbox","ki21",plane-init,plane,has-offset,plane-hitbox,engine-r,engine,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"engine\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki21-hitbox","ki21",plane-init,plane,has-offset,plane-hitbox,engine-l,engine,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"engine\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki21-hitbox","ki21",plane-init,plane,has-offset,plane-hitbox,aileron-r,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki21-hitbox","ki21",plane-init,plane,has-offset,plane-hitbox,aileron-l,aileron,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki21-hitbox","ki21",plane-init,plane,has-offset,plane-hitbox,elevator-r,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki21-hitbox","ki21",plane-init,plane,has-offset,plane-hitbox,elevator-l,elevetor,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki21-hitbox","ki21",plane-init,plane,has-offset,plane-hitbox,radder,offset-base],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}

#ID付与
execute as @e[tag=plane-init,tag=plane-root,limit=1] at @s run function summon:set-plane-id

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=plane-init,tag=ki21-root] speed 0
scoreboard players set @e[tag=plane-init,tag=ki21-root] rolling 0
scoreboard players set @e[tag=plane-init,tag=ki21-root] accelerate 36
scoreboard players set @e[tag=plane-init,tag=ki21-root] resistance 28
scoreboard players set @e[tag=plane-init,tag=ki21-root] deaccelerate 130
scoreboard players set @e[tag=plane-init,tag=ki21-root] max-speed 16600
scoreboard players set @e[tag=plane-init,tag=ki21-root] cruise-speed 13200
scoreboard players set @e[tag=plane-init,tag=ki21-root] takeoff-speed 4600
scoreboard players set @e[tag=plane-init,tag=ki21-root] stall-speed 4400
scoreboard players set @e[tag=plane-init,tag=ki21-root] plpr-start-min 1500
scoreboard players set @e[tag=plane-init,tag=ki21-root] plpr-start-max 1530
scoreboard players set @e[tag=plane-init,tag=ki21-root] plpr-stop-min 1400
scoreboard players set @e[tag=plane-init,tag=ki21-root] plpr-stop-max 1430
scoreboard players set @e[tag=plane-init,tag=ki21-root] gear-retract-min 5700
scoreboard players set @e[tag=plane-init,tag=ki21-root] gear-retract-max 5900
scoreboard players set @e[tag=plane-init,tag=ki21-root] gear-pullout-min 5400
scoreboard players set @e[tag=plane-init,tag=ki21-root] gear-pullout-max 5600

scoreboard players set @e[tag=plane-init,tag=ki21-root] landing-pitch -750
scoreboard players set @e[tag=plane-init,tag=ki21-root] AngX -750
scoreboard players set @e[tag=plane-init,tag=ki21-root] AngY 0
scoreboard players set @e[tag=plane-init,tag=ki21-root] AngZ 0
scoreboard players set @e[tag=plane-init,tag=ki21-root] AngY-old 0
scoreboard players set @e[tag=plane-init,tag=ki21-root] pitch-speed 300
scoreboard players set @e[tag=plane-init,tag=ki21-root] yaw-speed 260
scoreboard players set @e[tag=plane-init,tag=ki21-root] roll-speed 240

scoreboard players set @e[tag=plane-init,tag=ki21-root] parking-udvm 78
scoreboard players set @e[tag=plane-init,tag=ki21-root] rolling-udvm 79
scoreboard players set @e[tag=plane-init,tag=ki21-root] flying-udvm 80

scoreboard players set @e[tag=plane-init,tag=ki21-root] w1-reload 0
scoreboard players set @e[tag=plane-init,tag=ki21-root] w2-reload 0
scoreboard players set @e[tag=plane-init,tag=ki21-root] w3-reload 0
scoreboard players set @e[tag=plane-init,tag=ki21-root] ammunition1 20
scoreboard players set @e[tag=plane-init,tag=ki21-root] ammunition2 500
scoreboard players set @e[tag=plane-init,tag=ki21-root] ammunition3 500
scoreboard players set @e[tag=plane-init,tag=ki21-root] ammunition4 500
scoreboard players set @e[tag=plane-init,tag=ki21-root] plane-weapon 1

execute store result score @e[tag=plane-init,tag=ki21-root,limit=1] PosX run data get entity @e[tag=plane-init,tag=ki21-root,limit=1] Pos[0] 100000
execute store result score @e[tag=plane-init,tag=ki21-root,limit=1] PosY run data get entity @e[tag=plane-init,tag=ki21-root,limit=1] Pos[1] 100000
execute store result score @e[tag=plane-init,tag=ki21-root,limit=1] PosZ run data get entity @e[tag=plane-init,tag=ki21-root,limit=1] Pos[2] 100000

#offset設定
scoreboard players set @e[tag=body,tag=plane-init] offsetX 0
scoreboard players set @e[tag=body,tag=plane-init] offsetY 0
scoreboard players set @e[tag=body,tag=plane-init] offsetZ 0
scoreboard players set @e[tag=ki21-rightwing,tag=plane-init] offsetX -5740
scoreboard players set @e[tag=ki21-rightwing,tag=plane-init] offsetY 0
scoreboard players set @e[tag=ki21-rightwing,tag=plane-init] offsetZ 0
scoreboard players set @e[tag=ki21-leftwing,tag=plane-init] offsetX 5660
scoreboard players set @e[tag=ki21-leftwing,tag=plane-init] offsetY 0
scoreboard players set @e[tag=ki21-leftwing,tag=plane-init] offsetZ 0
scoreboard players set @e[tag=engine-l,tag=plane-init] offsetX 3000
scoreboard players set @e[tag=engine-l,tag=plane-init] offsetY -250
scoreboard players set @e[tag=engine-l,tag=plane-init] offsetZ -6800
scoreboard players set @e[tag=engine-r,tag=plane-init] offsetX -3000
scoreboard players set @e[tag=engine-r,tag=plane-init] offsetY -250
scoreboard players set @e[tag=engine-r,tag=plane-init] offsetZ -6800
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetX -7400
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetY -700
scoreboard players set @e[tag=aileron-r,tag=plane-init] offsetZ -3000
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetX 7300
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetY -700
scoreboard players set @e[tag=aileron-l,tag=plane-init] offsetZ -3000
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetX -3000
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetY -600
scoreboard players set @e[tag=elevator-r,tag=plane-init] offsetZ 6500
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetX 3000
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetY -600
scoreboard players set @e[tag=elevator-l,tag=plane-init] offsetZ 6500
scoreboard players set @e[tag=radder,tag=plane-init] offsetX -300
scoreboard players set @e[tag=radder,tag=plane-init] offsetY -1000
scoreboard players set @e[tag=radder,tag=plane-init] offsetZ 6500


#プレイヤーと同じAngYにする
execute at @e[tag=plane-init,tag=ki21-root,limit=1] store result score @p reg1 run data get entity @p Rotation[0] 100
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
execute at @e[tag=plane-init,tag=ki21-root,limit=1] run scoreboard players operation @e[tag=plane-init,tag=ki21-root,limit=1] AngY = @p reg1

#処理終了
tag @e[tag=plane-init] remove plane-init
