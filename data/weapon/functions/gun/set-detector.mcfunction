#スコア分向いてる方向にTP
#実行者：弾体

#検知アマスタセット
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=1] ^ ^ ^1
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=2] ^ ^ ^2
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=3] ^ ^ ^3
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=4] ^ ^ ^4
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=5] ^ ^ ^5
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=6] ^ ^ ^6
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=7] ^ ^ ^7
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=8] ^ ^ ^8
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=9] ^ ^ ^9
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=10] ^ ^ ^10
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=11] ^ ^ ^11
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=12] ^ ^ ^12
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=13] ^ ^ ^13
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=14] ^ ^ ^14
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=15] ^ ^ ^15
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=16] ^ ^ ^16
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=17] ^ ^ ^17
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=18] ^ ^ ^18
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=19] ^ ^ ^19
#execute at @s run tp @e[type=armor_stand,tag=block-detector,x=0,y=1,z=0,distance=..1,tag=20] ^ ^ ^20

summon minecraft:armor_stand ^ ^ ^1 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"1"]}
summon minecraft:armor_stand ^ ^ ^2 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"2"]}
summon minecraft:armor_stand ^ ^ ^3 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"3"]}
summon minecraft:armor_stand ^ ^ ^4 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"4"]}
summon minecraft:armor_stand ^ ^ ^5 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"5"]}
summon minecraft:armor_stand ^ ^ ^6 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"6"]}
summon minecraft:armor_stand ^ ^ ^7 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"7"]}
summon minecraft:armor_stand ^ ^ ^8 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"8"]}
summon minecraft:armor_stand ^ ^ ^9 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"9"]}
summon minecraft:armor_stand ^ ^ ^10 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"10"]}
summon minecraft:armor_stand ^ ^ ^11 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"11"]}
summon minecraft:armor_stand ^ ^ ^12 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"12"]}
summon minecraft:armor_stand ^ ^ ^13 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"13"]}
summon minecraft:armor_stand ^ ^ ^14 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"14"]}
summon minecraft:armor_stand ^ ^ ^15 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"15"]}
summon minecraft:armor_stand ^ ^ ^16 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"16"]}
summon minecraft:armor_stand ^ ^ ^17 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"17"]}
summon minecraft:armor_stand ^ ^ ^18 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"18"]}
summon minecraft:armor_stand ^ ^ ^19 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"19"]}
summon minecraft:armor_stand ^ ^ ^20 {NoGravity:1,Marker:1,Invisible:1,Tags:[block-detector,"20"]}
execute at @s run scoreboard players set @e[tag=block-detector,tag=1,distance=..20] Num 1
execute at @s run scoreboard players set @e[tag=block-detector,tag=2,distance=..20] Num 2
execute at @s run scoreboard players set @e[tag=block-detector,tag=3,distance=..20] Num 3
execute at @s run scoreboard players set @e[tag=block-detector,tag=4,distance=..20] Num 4
execute at @s run scoreboard players set @e[tag=block-detector,tag=5,distance=..20] Num 5
execute at @s run scoreboard players set @e[tag=block-detector,tag=6,distance=..20] Num 6
execute at @s run scoreboard players set @e[tag=block-detector,tag=7,distance=..20] Num 7
execute at @s run scoreboard players set @e[tag=block-detector,tag=8,distance=..20] Num 8
execute at @s run scoreboard players set @e[tag=block-detector,tag=9,distance=..20] Num 9
execute at @s run scoreboard players set @e[tag=block-detector,tag=10,distance=..20] Num 10
execute at @s run scoreboard players set @e[tag=block-detector,tag=11,distance=..20] Num 11
execute at @s run scoreboard players set @e[tag=block-detector,tag=12,distance=..20] Num 12
execute at @s run scoreboard players set @e[tag=block-detector,tag=13,distance=..20] Num 13
execute at @s run scoreboard players set @e[tag=block-detector,tag=14,distance=..20] Num 14
execute at @s run scoreboard players set @e[tag=block-detector,tag=15,distance=..20] Num 15
execute at @s run scoreboard players set @e[tag=block-detector,tag=16,distance=..20] Num 16
execute at @s run scoreboard players set @e[tag=block-detector,tag=17,distance=..20] Num 17
execute at @s run scoreboard players set @e[tag=block-detector,tag=18,distance=..20] Num 18
execute at @s run scoreboard players set @e[tag=block-detector,tag=19,distance=..20] Num 19
execute at @s run scoreboard players set @e[tag=block-detector,tag=20,distance=..20] Num 20

