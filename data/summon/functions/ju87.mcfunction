#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[ju87-root,ju87,ju87-init,plane-root,plane],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[ju87,ju87-init,plane,plane-seat]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["ju87-body","ju87",ju87-init,plane,plane-body],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:30,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["ju87-parts","ju87",ju87-init,plane,plane-parts],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:32,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["ju87-indicator","ju87",ju87-init,plane,plane-indicator],NoGravity:1b,Invisible:1,Marker:1}

#ID付与
scoreboard players set @e[tag=ju87-init,tag=ju87-root] plane-id 0
scoreboard players operation @e[tag=ju87-init,tag=ju87-root,limit=1] plane-id > @e[tag=plane-root] plane-id
scoreboard players operation @e[tag=ju87-init] plane-id = @e[tag=ju87-init,tag=ju87-root,limit=1] plane-id
scoreboard players add @e[tag=ju87-init] plane-id 1

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=ju87-init,tag=ju87-root] speed 0
scoreboard players set @e[tag=ju87-init,tag=ju87-root] rolling 0
scoreboard players set @e[tag=ju87-init,tag=ju87-root] accelerate 5
scoreboard players set @e[tag=ju87-init,tag=ju87-root] max-speed 1180
scoreboard players set @e[tag=ju87-init,tag=ju87-root] takeoff-speed 400
scoreboard players set @e[tag=ju87-init,tag=ju87-root] landing-pitch -1200
scoreboard players set @e[tag=ju87-init,tag=ju87-root] AngX -1200
scoreboard players set @e[tag=ju87-init,tag=ju87-root] AngY 0
scoreboard players set @e[tag=ju87-init,tag=ju87-root] AngZ 0
scoreboard players set @e[tag=ju87-init,tag=ju87-root] pitch-speed 200
scoreboard players set @e[tag=ju87-init,tag=ju87-root] yaw-speed 400
scoreboard players set @e[tag=ju87-init,tag=ju87-root] roll-speed 500
scoreboard players set @e[tag=ju87-init,tag=ju87-root] parking-udvm 30
scoreboard players set @e[tag=ju87-init,tag=ju87-root] rolling-udvm 31
scoreboard players set @e[tag=ju87-init,tag=ju87-root] flying-udvm 31
scoreboard players set @e[tag=ju87-init,tag=ju87-root] propeller-start 150
scoreboard players set @e[tag=ju87-init,tag=ju87-root] propeller-stop 140
scoreboard players set @e[tag=ju87-init,tag=ju87-root] gear-retracting 600
scoreboard players set @e[tag=ju87-init,tag=ju87-root] gear-pull-out 590
scoreboard players set @e[tag=ju87-init,tag=ju87-root] w1-reload 0
scoreboard players set @e[tag=ju87-init,tag=ju87-root] w2-reload 0

execute store result score @e[tag=ju87-init,tag=ju87-root,limit=1] PosX run data get entity @e[tag=ju87-init,tag=ju87-root,limit=1] Pos[0] 100000
execute store result score @e[tag=ju87-init,tag=ju87-root,limit=1] PosY run data get entity @e[tag=ju87-init,tag=ju87-root,limit=1] Pos[1] 100000
execute store result score @e[tag=ju87-init,tag=ju87-root,limit=1] PosZ run data get entity @e[tag=ju87-init,tag=ju87-root,limit=1] Pos[2] 100000

#処理終了
tag @e[tag=ju87-init] remove ju87-init
