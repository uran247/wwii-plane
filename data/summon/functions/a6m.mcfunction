#実行条件無し

#機体召喚
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:0,Tags:[a6m-root,a6m,a6m-init,plane-root,plane],Pose:{LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]},Passengers:[{id:donkey,SaddleItem:{id:"minecraft:saddle",Count:1b},Tame:1,NoAI:1,Silent:1,ChestedHorse:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:0b}],Tags:[a6m,a6m-init,plane,plane-seat]}],DisabledSlots:256,NoGravity:0b}
summon armor_stand ~ ~ ~ {Tags:["a6m-body","a6m",a6m-init,plane,plane-body],NoGravity:1b,Invisible:1,HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{Damage:7,Unbreakable:1}},{}],Pose:{LeftArm:[0f,0f,0f],RightArm:[-12f,0f,0f]},DisabledSlots:256}
summon armor_stand ~ ~ ~ {Tags:["a6m-indicator","a6m",a6m-init,plane,plane-indicator],NoGravity:1b,Invisible:1,Marker:1}

#ID付与
scoreboard players set @e[tag=a6m-init,tag=a6m-root] plane-id 0
scoreboard players operation @e[tag=a6m-init,tag=a6m-root,limit=1] plane-id > @e[tag=a6m-root] plane-id
scoreboard players operation @e[tag=a6m-init] plane-id = @e[tag=a6m-init,tag=a6m-root,limit=1] plane-id
scoreboard players add @e[tag=a6m-init] plane-id 1

#スピード・滑走/角度/旋回速度/加速度/最高速度/離陸速度/形態スコア・存在座標・設定
scoreboard players set @e[tag=a6m-init,tag=a6m-root] speed 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] rolling 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] accelerate 5
scoreboard players set @e[tag=a6m-init,tag=a6m-root] max-speed 1960
scoreboard players set @e[tag=a6m-init,tag=a6m-root] takeoff-speed 520
scoreboard players set @e[tag=a6m-init,tag=a6m-root] landing-pitch -1200
scoreboard players set @e[tag=a6m-init,tag=a6m-root] AngX -1200
scoreboard players set @e[tag=a6m-init,tag=a6m-root] AngY 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] AngZ 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] pitch-speed 200
scoreboard players set @e[tag=a6m-init,tag=a6m-root] yaw-speed 400
scoreboard players set @e[tag=a6m-init,tag=a6m-root] roll-speed 400
scoreboard players set @e[tag=a6m-init,tag=a6m-root] parking-udvm 7
scoreboard players set @e[tag=a6m-init,tag=a6m-root] rolling-udvm 8
scoreboard players set @e[tag=a6m-init,tag=a6m-root] flying-udvm 9
scoreboard players set @e[tag=a6m-init,tag=a6m-root] propeller-start 150
scoreboard players set @e[tag=a6m-init,tag=a6m-root] propeller-stop 140
scoreboard players set @e[tag=a6m-init,tag=a6m-root] gear-retracting 540
scoreboard players set @e[tag=a6m-init,tag=a6m-root] gear-pull-out 530
scoreboard players set @e[tag=a6m-init,tag=a6m-root] w1-reload 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] w2-reload 0
scoreboard players set @e[tag=a6m-init,tag=a6m-root] ammunition1 100
scoreboard players set @e[tag=a6m-init,tag=a6m-root] ammunition2 500


execute store result score @e[tag=a6m-init,tag=a6m-root,limit=1] PosX run data get entity @e[tag=a6m-init,tag=a6m-root,limit=1] Pos[0] 100000
execute store result score @e[tag=a6m-init,tag=a6m-root,limit=1] PosY run data get entity @e[tag=a6m-init,tag=a6m-root,limit=1] Pos[1] 100000
execute store result score @e[tag=a6m-init,tag=a6m-root,limit=1] PosZ run data get entity @e[tag=a6m-init,tag=a6m-root,limit=1] Pos[2] 100000

#処理終了
tag @e[tag=a6m-init] remove a6m-init
