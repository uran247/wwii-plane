#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[spitfire-root,spitfire,spitfire-init,plane-root,plane],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[spitfire,spitfire-init,plane,plane-seat]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["spitfire-body","spitfire",spitfire-init,plane,model-changeable],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:16,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["spitfire-indicator","spitfire",spitfire-init,plane,plane-indicator],NoGravity:1b,Invisible:1,Marker:1}

#ID付与
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] plane-id 0
scoreboard players operation @e[tag=spitfire-init,tag=spitfire-root,limit=1] plane-id > @e[tag=plane-root] plane-id
scoreboard players operation @e[tag=spitfire-init] plane-id = @e[tag=spitfire-init,tag=spitfire-root,limit=1] plane-id
scoreboard players add @e[tag=spitfire-init] plane-id 1

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] speed 0
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] rolling 0
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] accelerate 5
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] max-speed 2260
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] takeoff-speed 560
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] landing-pitch -1200
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] AngX -1200
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] AngY 0
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] AngZ 0
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] pitch-speed 200
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] yaw-speed 400
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] roll-speed 500
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] parking-udvm 16
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] rolling-udvm 17
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] flying-udvm 18
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] propeller-start 150
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] propeller-stop 140
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] gear-retracting 800
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] gear-pull-out 790
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] w1-reload 0
scoreboard players set @e[tag=spitfire-init,tag=spitfire-root] w2-reload 0

execute store result score @e[tag=spitfire-init,tag=spitfire-root,limit=1] PosX run data get entity @e[tag=spitfire-init,tag=spitfire-root,limit=1] Pos[0] 100000
execute store result score @e[tag=spitfire-init,tag=spitfire-root,limit=1] PosY run data get entity @e[tag=spitfire-init,tag=spitfire-root,limit=1] Pos[1] 100000
execute store result score @e[tag=spitfire-init,tag=spitfire-root,limit=1] PosZ run data get entity @e[tag=spitfire-init,tag=spitfire-root,limit=1] Pos[2] 100000

#処理終了
tag @e[tag=spitfire-init] remove spitfire-init
