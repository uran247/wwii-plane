#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[ki43-root,ki43,ki43-init,plane-root,plane,entity-nohit],CustomName:"{\"text\":\"ki43\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256,NoGravity:0b}
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[ki43,ki43-init,plane,entity-nohit,plane-seat],CustomName:"{\"text\":\"seat\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,DeathLootTable:"minecraft:entities/bat",SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[ki43,ki43-init,plane,plane-seat,entity-nohit]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["ki43-body","ki43",ki43-init,plane,has-model,model-changeable,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:7,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["ki43-hitbox","ki43",ki43-init,plane,plane-hitbox,has-offset,body],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"body\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki43-hitbox","ki43",ki43-init,plane,plane-hitbox,has-offset,engine],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"engine\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki43-hitbox","ki43",ki43-init,plane,plane-hitbox,has-offset,aileron-r,aileron],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki43-hitbox","ki43",ki43-init,plane,plane-hitbox,has-offset,aileron-l,aileron],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki43-hitbox","ki43",ki43-init,plane,plane-hitbox,has-offset,elevator-r,elevetor],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki43-hitbox","ki43",ki43-init,plane,plane-hitbox,has-offset,elevator-l,elevetor],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["ki43-hitbox","ki43",ki43-init,plane,plane-hitbox,has-offset,radder],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}

#ID付与
execute as @e[tag=ki43-init,tag=ki43-root,limit=1] store result score @s plane-id run data get entity @s UUIDMost 0.000000000233
scoreboard players operation @e[tag=ki43-init,tag=ki43-root,limit=1,scores={plane-id=..-1}] plane-id *= #-1 Num
scoreboard players operation @e[tag=ki43-init] plane-id = @e[tag=ki43-init,tag=ki43-root,limit=1] plane-id
execute as @e[tag=ki43-init] store result entity @s Attributes[1].Base double 1 run scoreboard players get @s plane-id

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=ki43-init,tag=ki43-root] rolling 0
scoreboard players set @e[tag=ki43-init,tag=ki43-root] speed 0
scoreboard players set @e[tag=ki43-init,tag=ki43-root] max-speed 17900
scoreboard players set @e[tag=ki43-init,tag=ki43-root] cruise-speed 12300
scoreboard players set @e[tag=ki43-init,tag=ki43-root] takeoff-speed 4300
scoreboard players set @e[tag=ki43-init,tag=ki43-root] stall-speed 4100
scoreboard players set @e[tag=ki43-init,tag=ki43-root] accelerate 71
scoreboard players set @e[tag=ki43-init,tag=ki43-root] resistance 44
scoreboard players set @e[tag=ki43-init,tag=ki43-root] deaccelerate 56
scoreboard players set @e[tag=ki43-init,tag=ki43-root] plpr-start-min 1600
scoreboard players set @e[tag=ki43-init,tag=ki43-root] plpr-start-max 1700
scoreboard players set @e[tag=ki43-init,tag=ki43-root] plpr-stop-min 1400
scoreboard players set @e[tag=ki43-init,tag=ki43-root] plpr-stop-max 1500
scoreboard players set @e[tag=ki43-init,tag=ki43-root] gear-retract-min 5600
scoreboard players set @e[tag=ki43-init,tag=ki43-root] gear-retract-max 5800
scoreboard players set @e[tag=ki43-init,tag=ki43-root] gear-pullout-min 5300
scoreboard players set @e[tag=ki43-init,tag=ki43-root] gear-pullout-max 5500

scoreboard players set @e[tag=ki43-init,tag=ki43-root] landing-pitch -1200
scoreboard players set @e[tag=ki43-init,tag=ki43-root] AngX -1250
scoreboard players set @e[tag=ki43-init,tag=ki43-root] AngY 0
scoreboard players set @e[tag=ki43-init,tag=ki43-root] AngZ 0
scoreboard players set @e[tag=ki43-init,tag=ki43-root] AngY-old 0
scoreboard players set @e[tag=ki43-init,tag=ki43-root] pitch-speed 230
scoreboard players set @e[tag=ki43-init,tag=ki43-root] yaw-speed 260
scoreboard players set @e[tag=ki43-init,tag=ki43-root] roll-speed 650

scoreboard players set @e[tag=ki43-init,tag=ki43-root] parking-udvm 67
scoreboard players set @e[tag=ki43-init,tag=ki43-root] rolling-udvm 68
scoreboard players set @e[tag=ki43-init,tag=ki43-root] flying-udvm 69

scoreboard players set @e[tag=ki43-init,tag=ki43-root] w1-reload 0
scoreboard players set @e[tag=ki43-init,tag=ki43-root] w2-reload 0
scoreboard players set @e[tag=ki43-init,tag=ki43-root] ammunition1 270
scoreboard players set @e[tag=ki43-init,tag=ki43-root] plane-weapon 1

execute store result score @e[tag=ki43-init,tag=ki43-root,limit=1] PosX run data get entity @e[tag=ki43-init,tag=ki43-root,limit=1] Pos[0] 100000
execute store result score @e[tag=ki43-init,tag=ki43-root,limit=1] PosY run data get entity @e[tag=ki43-init,tag=ki43-root,limit=1] Pos[1] 100000
execute store result score @e[tag=ki43-init,tag=ki43-root,limit=1] PosZ run data get entity @e[tag=ki43-init,tag=ki43-root,limit=1] Pos[2] 100000

#hitbocのスコア設定
scoreboard players set @e[tag=body,tag=ki43-init] offsetX 0
scoreboard players set @e[tag=body,tag=ki43-init] offsetY 0
scoreboard players set @e[tag=body,tag=ki43-init] offsetZ 0
scoreboard players set @e[tag=engine,tag=ki43-init] offsetX 0
scoreboard players set @e[tag=engine,tag=ki43-init] offsetY -700
scoreboard players set @e[tag=engine,tag=ki43-init] offsetZ 0
scoreboard players set @e[tag=aileron-r,tag=ki43-init] offsetX -3000
scoreboard players set @e[tag=aileron-r,tag=ki43-init] offsetY -700
scoreboard players set @e[tag=aileron-r,tag=ki43-init] offsetZ 0
scoreboard players set @e[tag=aileron-l,tag=ki43-init] offsetX 3000
scoreboard players set @e[tag=aileron-l,tag=ki43-init] offsetY -700
scoreboard players set @e[tag=aileron-l,tag=ki43-init] offsetZ 0
scoreboard players set @e[tag=elevator-r,tag=ki43-init] offsetX -1500
scoreboard players set @e[tag=elevator-r,tag=ki43-init] offsetY -900
scoreboard players set @e[tag=elevator-r,tag=ki43-init] offsetZ 0
scoreboard players set @e[tag=elevator-l,tag=ki43-init] offsetX 1500
scoreboard players set @e[tag=elevator-l,tag=ki43-init] offsetY -900
scoreboard players set @e[tag=elevator-l,tag=ki43-init] offsetZ 0
scoreboard players set @e[tag=radder,tag=ki43-init] offsetX 0
scoreboard players set @e[tag=radder,tag=ki43-init] offsetY -2000
scoreboard players set @e[tag=radder,tag=ki43-init] offsetZ 0


#プレイヤーと同じAngYにする
execute at @e[tag=ki43-init,tag=ki43-root,limit=1] store result score @p reg1 run data get entity @p Rotation[0] 100
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
execute at @e[tag=ki43-init,tag=ki43-root,limit=1] run scoreboard players operation @e[tag=ki43-init,tag=ki43-root,limit=1] AngY = @p reg1

#処理終了
tag @e[tag=ki43-init] remove ki43-init
