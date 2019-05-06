#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[d3a-root,d3a,d3a-init,plane-root,plane,entity-nohit,bombed,normal,250kg,60kg],CustomName:"{\"text\":\"d3a\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256,NoGravity:0b}
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[d3a,d3a-init,plane,entity-nohit,plane-seat],CustomName:"{\"text\":\"seat\"}",Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,DeathLootTable:"minecraft:entities/bat",SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[d3a,d3a-init,plane,plane-seat,entity-nohit]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["d3a-body","d3a",d3a-init,plane,model-changeable,plane-parts,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:73,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["d3a-rightwing","d3a",d3a-init,plane,plane-parts,entity-nohit],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:75,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256}

#hitbox召喚
summon armor_stand ~ ~ ~ {Tags:["d3a-hitbox","d3a",d3a-init,plane,plane-hitbox,body],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"body\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["d3a-hitbox","d3a",d3a-init,plane,plane-hitbox,engine],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"engine\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["d3a-hitbox","d3a",d3a-init,plane,plane-hitbox,aileron-r,aileron],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["d3a-hitbox","d3a",d3a-init,plane,plane-hitbox,aileron-l,aileron],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"aileron-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["d3a-hitbox","d3a",d3a-init,plane,plane-hitbox,elevator-r,elevetor],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-right\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["d3a-hitbox","d3a",d3a-init,plane,plane-hitbox,elevator-l,elevetor],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"elevator-left\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}
summon armor_stand ~ ~ ~ {Tags:["d3a-hitbox","d3a",d3a-init,plane,plane-hitbox,radder],NoGravity:1b,Invisible:1,Marker:1,Glowing:1,CustomName:"{\"text\":\"radder\"}",Health:80f,Attributes:[{Name:generic.maxHealth,Base:80}]}

#ID付与
#scoreboard players set @e[tag=d3a-init,tag=d3a-root] plane-id 0
execute as @e[tag=d3a-init,tag=d3a-root,limit=1] store result score @s plane-id run data get entity @s UUIDMost 0.000000000233
scoreboard players operation @e[tag=d3a-init,tag=d3a-root,limit=1,scores={plane-id=..-1}] plane-id *= #-1 Num
scoreboard players operation @e[tag=d3a-init] plane-id = @e[tag=d3a-init,tag=d3a-root,limit=1] plane-id
execute as @e[tag=d3a-init] store result entity @s Attributes[1].Base double 1 run scoreboard players get @s plane-id
#scoreboard players operation @e[tag=d3a-init,tag=d3a-root,limit=1] plane-id > @e[tag=d3a-root] plane-id
#scoreboard players add @e[tag=d3a-init] plane-id 1

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=d3a-init,tag=d3a-root] speed 0
scoreboard players set @e[tag=d3a-init,tag=d3a-root] rolling 0
scoreboard players set @e[tag=d3a-init,tag=d3a-root] accelerate 3
scoreboard players set @e[tag=d3a-init,tag=d3a-root] deaccelerate 8
scoreboard players set @e[tag=d3a-init,tag=d3a-root] max-speed 1490
scoreboard players set @e[tag=d3a-init,tag=d3a-root] cruise-speed 1110
scoreboard players set @e[tag=d3a-init,tag=d3a-root] takeoff-speed 500
scoreboard players set @e[tag=d3a-init,tag=d3a-root] stall-speed 480
scoreboard players set @e[tag=d3a-init,tag=d3a-root] landing-pitch -1250
scoreboard players set @e[tag=d3a-init,tag=d3a-root] AngX -1250
scoreboard players set @e[tag=d3a-init,tag=d3a-root] AngY 0
scoreboard players set @e[tag=d3a-init,tag=d3a-root] AngZ 0
scoreboard players set @e[tag=d3a-init,tag=d3a-root] AngY-old 0
scoreboard players set @e[tag=d3a-init,tag=d3a-root] pitch-speed 200
scoreboard players set @e[tag=d3a-init,tag=d3a-root] yaw-speed 120
scoreboard players set @e[tag=d3a-init,tag=d3a-root] roll-speed 300
scoreboard players set @e[tag=d3a-init,tag=d3a-root] parking-udvm 73
scoreboard players set @e[tag=d3a-init,tag=d3a-root] rolling-udvm 74
scoreboard players set @e[tag=d3a-init,tag=d3a-root] flying-udvm 74
scoreboard players set @e[tag=d3a-init,tag=d3a-root] plpr-start-min 150
scoreboard players set @e[tag=d3a-init,tag=d3a-root] plpr-start-max 152
scoreboard players set @e[tag=d3a-init,tag=d3a-root] plpr-stop-min 140
scoreboard players set @e[tag=d3a-init,tag=d3a-root] plpr-stop-max 142
scoreboard players set @e[tag=d3a-init,tag=d3a-root] gear-retract-min 520
scoreboard players set @e[tag=d3a-init,tag=d3a-root] gear-retract-max 522
scoreboard players set @e[tag=d3a-init,tag=d3a-root] gear-pullout-min 510
scoreboard players set @e[tag=d3a-init,tag=d3a-root] gear-pullout-max 512
scoreboard players set @e[tag=d3a-init,tag=d3a-root] w1-reload 0
scoreboard players set @e[tag=d3a-init,tag=d3a-root] w2-reload 0
scoreboard players set @e[tag=d3a-init,tag=d3a-root] w3-reload 0
scoreboard players set @e[tag=d3a-init,tag=d3a-root] ammunition1 500
scoreboard players set @e[tag=d3a-init,tag=d3a-root] ammunition2 0
scoreboard players set @e[tag=d3a-init,tag=d3a-root] ammunition3 500

execute store result score @e[tag=d3a-init,tag=d3a-root,limit=1] PosX run data get entity @e[tag=d3a-init,tag=d3a-root,limit=1] Pos[0] 100000
execute store result score @e[tag=d3a-init,tag=d3a-root,limit=1] PosY run data get entity @e[tag=d3a-init,tag=d3a-root,limit=1] Pos[1] 100000
execute store result score @e[tag=d3a-init,tag=d3a-root,limit=1] PosZ run data get entity @e[tag=d3a-init,tag=d3a-root,limit=1] Pos[2] 100000

#hitboxのスコア設定
scoreboard players set @e[tag=body,tag=d3a-init] offsetX 0
scoreboard players set @e[tag=body,tag=d3a-init] offsetY 0
scoreboard players set @e[tag=body,tag=d3a-init] offsetZ 0
scoreboard players set @e[tag=engine,tag=d3a-init] offsetX 0
scoreboard players set @e[tag=engine,tag=d3a-init] offsetY -500
scoreboard players set @e[tag=engine,tag=d3a-init] offsetZ 0
scoreboard players set @e[tag=aileron-r,tag=d3a-init] offsetX -4000
scoreboard players set @e[tag=aileron-r,tag=d3a-init] offsetY -400
scoreboard players set @e[tag=aileron-r,tag=d3a-init] offsetZ 0
scoreboard players set @e[tag=aileron-l,tag=d3a-init] offsetX 4000
scoreboard players set @e[tag=aileron-l,tag=d3a-init] offsetY -400
scoreboard players set @e[tag=aileron-l,tag=d3a-init] offsetZ 0
scoreboard players set @e[tag=elevator-r,tag=d3a-init] offsetX -1500
scoreboard players set @e[tag=elevator-r,tag=d3a-init] offsetY -200
scoreboard players set @e[tag=elevator-r,tag=d3a-init] offsetZ 0
scoreboard players set @e[tag=elevator-l,tag=d3a-init] offsetX 1500
scoreboard players set @e[tag=elevator-l,tag=d3a-init] offsetY -200
scoreboard players set @e[tag=elevator-l,tag=d3a-init] offsetZ 0
scoreboard players set @e[tag=radder,tag=d3a-init] offsetX 0
scoreboard players set @e[tag=radder,tag=d3a-init] offsetY -1000
scoreboard players set @e[tag=radder,tag=d3a-init] offsetZ 0


#プレイヤーと同じAngYにする
execute at @e[tag=d3a-init,tag=d3a-root,limit=1] store result score @p reg1 run data get entity @p Rotation[0] 100
scoreboard players remove @s[scores={reg1=18100..}] reg1 36000
scoreboard players add @s[scores={reg1=..-18100}] reg1 36000
execute at @e[tag=d3a-init,tag=d3a-root,limit=1] run scoreboard players operation @e[tag=d3a-init,tag=d3a-root,limit=1] AngY = @p reg1

#処理終了
tag @e[tag=d3a-init] remove d3a-init
