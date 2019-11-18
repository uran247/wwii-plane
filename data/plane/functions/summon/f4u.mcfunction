#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[f4u-root,f4u,f4u-init,plane-root,plane],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,Invulnerable:1b,SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[f4u,f4u-init,plane,plane-seat]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["f4u-body","f4u",f4u-init,plane,model-changeable],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:1,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-wing-r","f4u",f4u-init,plane,plane-parts,f4u-wing],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:64,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-wing-l","f4u",f4u-init,plane,plane-parts,f4u-wing],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:65,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["f4u-indicator","f4u",f4u-init,plane,plane-indicator],NoGravity:1b,Invisible:1,Marker:1}
#ID付与
scoreboard players set @e[tag=f4u-init,tag=f4u-root] plane-id 0
scoreboard players operation @e[tag=f4u-init,tag=f4u-root,limit=1] plane-id > @e[tag=f4u-root] plane-id
scoreboard players operation @e[tag=f4u-init] plane-id = @e[tag=f4u-init,tag=f4u-root,limit=1] plane-id
scoreboard players add @e[tag=f4u-init] plane-id 1

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=f4u-init,tag=f4u-root] speed 0
scoreboard players set @e[tag=f4u-init,tag=f4u-root] rolling 0
scoreboard players set @e[tag=f4u-init,tag=f4u-root] accelerate 5
scoreboard players set @e[tag=f4u-init,tag=f4u-root] max-speed 2280
scoreboard players set @e[tag=f4u-init,tag=f4u-root] takeoff-speed 520
scoreboard players set @e[tag=f4u-init,tag=f4u-root] landing-pitch -1200
scoreboard players set @e[tag=f4u-init,tag=f4u-root] AngX -1200
scoreboard players set @e[tag=f4u-init,tag=f4u-root] AngY 0
scoreboard players set @e[tag=f4u-init,tag=f4u-root] AngZ 0
scoreboard players set @e[tag=f4u-init,tag=f4u-root] pitch-speed 200
scoreboard players set @e[tag=f4u-init,tag=f4u-root] yaw-speed 400
scoreboard players set @e[tag=f4u-init,tag=f4u-root] roll-speed 400
scoreboard players set @e[tag=f4u-init,tag=f4u-root] parking-udvm 1
scoreboard players set @e[tag=f4u-init,tag=f4u-root] rolling-udvm 2
scoreboard players set @e[tag=f4u-init,tag=f4u-root] flying-udvm 3
scoreboard players set @e[tag=f4u-init,tag=f4u-root] propeller-start 150
scoreboard players set @e[tag=f4u-init,tag=f4u-root] propeller-stop 140
scoreboard players set @e[tag=f4u-init,tag=f4u-root] gear-retracting 540
scoreboard players set @e[tag=f4u-init,tag=f4u-root] gear-pull-out 530
scoreboard players set @e[tag=f4u-init,tag=f4u-root] w1-reload 0
scoreboard players set @e[tag=f4u-init,tag=f4u-root] w2-reload 0
scoreboard players set @e[tag=f4u-init,tag=f4u-root] ammunition1 400
scoreboard players set @e[tag=f4u-init,tag=f4u-root] ammunition2 8

#パーツのオフセット位置設定
scoreboard players set @e[tag=f4u-wing-r,tag=f4u-init] offsetX -1870
scoreboard players set @e[tag=f4u-wing-r,tag=f4u-init] offsetY 20
scoreboard players set @e[tag=f4u-wing-r,tag=f4u-init] offsetZ 0
scoreboard players set @e[tag=f4u-wing-l,tag=f4u-init] offsetX 2630
scoreboard players set @e[tag=f4u-wing-l,tag=f4u-init] offsetY 30
scoreboard players set @e[tag=f4u-wing-l,tag=f4u-init] offsetZ 0

execute store result score @e[tag=f4u-init,tag=f4u-root,limit=1] PosX run data get entity @e[tag=f4u-init,tag=f4u-root,limit=1] Pos[0] 10000
execute store result score @e[tag=f4u-init,tag=f4u-root,limit=1] PosY run data get entity @e[tag=f4u-init,tag=f4u-root,limit=1] Pos[1] 10000
execute store result score @e[tag=f4u-init,tag=f4u-root,limit=1] PosZ run data get entity @e[tag=f4u-init,tag=f4u-root,limit=1] Pos[2] 10000

#処理終了
tag @e[tag=f4u-init] remove f4u-init
