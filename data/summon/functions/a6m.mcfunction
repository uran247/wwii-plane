#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[a6m-root,a6m,a6m-init,plane-root,plane,entity-nohit],CustomName:"{\"text\":\"a6m\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256,NoGravity:0b}
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[a6m,a6m-init,plane,entity-nohit,plane-seat],CustomName:"{\"text\":\"seat\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,DeathLootTable:"minecraft:entities/bat",SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[a6m,a6m-init,plane,plane-seat,entity-nohit]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["a6m-body","a6m",a6m-init,plane,model-changeable,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:7,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["a6m-hitbox","a6m",a6m-init,plane,plane-hitbox,body],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"body\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a6m-hitbox","a6m",a6m-init,plane,plane-hitbox,engine],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"engine\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a6m-hitbox","a6m",a6m-init,plane,plane-hitbox,aileron-r,aileron],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a6m-hitbox","a6m",a6m-init,plane,plane-hitbox,aileron-l,aileron],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a6m-hitbox","a6m",a6m-init,plane,plane-hitbox,elevator-r,elevetor],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a6m-hitbox","a6m",a6m-init,plane,plane-hitbox,elevator-l,elevetor],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["a6m-hitbox","a6m",a6m-init,plane,plane-hitbox,radder],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}

#ID付与
#scoreboard players set @e[tag=a6m-init,tag=a6m-root] plane-id 0
execute as @e[tag=a6m-init,tag=a6m-root,limit=1] store result score @s plane-id run data get entity @s UUIDMost 0.000000000233
scoreboard players operation @e[tag=a6m-init,tag=a6m-root,limit=1,scores={plane-id=..-1}] plane-id *= #-1 Num
scoreboard players operation @e[tag=a6m-init] plane-id = @e[tag=a6m-init,tag=a6m-root,limit=1] plane-id
execute as @e[tag=a6m-init] store result entity @s Attributes[1].Base double 1 run scoreboard players get @s plane-id
#scoreboard players operation @e[tag=a6m-init,tag=a6m-root,limit=1] plane-id > @e[tag=a6m-root] plane-id
#scoreboard players add @e[tag=a6m-init] plane-id 1

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=a6m-init,tag=a6m-root] speed 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] rolling 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] accelerate 3
scoreboard players set @e[tag=a6m-init,tag=a6m-root] deaccelerate 8
scoreboard players set @e[tag=a6m-init,tag=a6m-root] max-speed 1960
scoreboard players set @e[tag=a6m-init,tag=a6m-root] cruise-speed 1215
scoreboard players set @e[tag=a6m-init,tag=a6m-root] takeoff-speed 520
scoreboard players set @e[tag=a6m-init,tag=a6m-root] stall-speed 500
scoreboard players set @e[tag=a6m-init,tag=a6m-root] landing-pitch -1200
scoreboard players set @e[tag=a6m-init,tag=a6m-root] AngX -1250
scoreboard players set @e[tag=a6m-init,tag=a6m-root] AngY 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] AngZ 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] AngY-old 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] pitch-speed 200
scoreboard players set @e[tag=a6m-init,tag=a6m-root] yaw-speed 220
scoreboard players set @e[tag=a6m-init,tag=a6m-root] roll-speed 400
scoreboard players set @e[tag=a6m-init,tag=a6m-root] parking-udvm 7
scoreboard players set @e[tag=a6m-init,tag=a6m-root] rolling-udvm 8
scoreboard players set @e[tag=a6m-init,tag=a6m-root] flying-udvm 9
scoreboard players set @e[tag=a6m-init,tag=a6m-root] plpr-start-min 150
scoreboard players set @e[tag=a6m-init,tag=a6m-root] plpr-start-max 154
scoreboard players set @e[tag=a6m-init,tag=a6m-root] plpr-stop-min 140
scoreboard players set @e[tag=a6m-init,tag=a6m-root] plpr-stop-max 144
scoreboard players set @e[tag=a6m-init,tag=a6m-root] gear-retract-min 540
scoreboard players set @e[tag=a6m-init,tag=a6m-root] gear-retract-max 544
scoreboard players set @e[tag=a6m-init,tag=a6m-root] gear-pullout-min 530
scoreboard players set @e[tag=a6m-init,tag=a6m-root] gear-pullout-max 534
scoreboard players set @e[tag=a6m-init,tag=a6m-root] w1-reload 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] w2-reload 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] ammunition1 100
scoreboard players set @e[tag=a6m-init,tag=a6m-root] ammunition2 500

execute store result score @e[tag=a6m-init,tag=a6m-root,limit=1] PosX run data get entity @e[tag=a6m-init,tag=a6m-root,limit=1] Pos[0] 100000
execute store result score @e[tag=a6m-init,tag=a6m-root,limit=1] PosY run data get entity @e[tag=a6m-init,tag=a6m-root,limit=1] Pos[1] 100000
execute store result score @e[tag=a6m-init,tag=a6m-root,limit=1] PosZ run data get entity @e[tag=a6m-init,tag=a6m-root,limit=1] Pos[2] 100000

#hitbocのスコア設定
scoreboard players set @e[tag=body,tag=a6m-init] offsetX 0
scoreboard players set @e[tag=body,tag=a6m-init] offsetY 0
scoreboard players set @e[tag=body,tag=a6m-init] offsetZ 0
scoreboard players set @e[tag=engine,tag=a6m-init] offsetX 0
scoreboard players set @e[tag=engine,tag=a6m-init] offsetY -700
scoreboard players set @e[tag=engine,tag=a6m-init] offsetZ 0
scoreboard players set @e[tag=aileron-r,tag=a6m-init] offsetX -3000
scoreboard players set @e[tag=aileron-r,tag=a6m-init] offsetY -700
scoreboard players set @e[tag=aileron-r,tag=a6m-init] offsetZ 0
scoreboard players set @e[tag=aileron-l,tag=a6m-init] offsetX 3000
scoreboard players set @e[tag=aileron-l,tag=a6m-init] offsetY -700
scoreboard players set @e[tag=aileron-l,tag=a6m-init] offsetZ 0
scoreboard players set @e[tag=elevator-r,tag=a6m-init] offsetX -1500
scoreboard players set @e[tag=elevator-r,tag=a6m-init] offsetY -900
scoreboard players set @e[tag=elevator-r,tag=a6m-init] offsetZ 0
scoreboard players set @e[tag=elevator-l,tag=a6m-init] offsetX 1500
scoreboard players set @e[tag=elevator-l,tag=a6m-init] offsetY -900
scoreboard players set @e[tag=elevator-l,tag=a6m-init] offsetZ 0
scoreboard players set @e[tag=radder,tag=a6m-init] offsetX 0
scoreboard players set @e[tag=radder,tag=a6m-init] offsetY -2000
scoreboard players set @e[tag=radder,tag=a6m-init] offsetZ 0


#プレイヤーと同じAngYにする
execute at @e[tag=a6m-init,tag=a6m-root,limit=1] store result score @p reg1 run data get entity @p Rotation[0] 100
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
execute at @e[tag=a6m-init,tag=a6m-root,limit=1] run scoreboard players operation @e[tag=a6m-init,tag=a6m-root,limit=1] AngY = @p reg1

#処理終了
tag @e[tag=a6m-init] remove a6m-init
