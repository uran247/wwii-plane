#操縦桿を捨てたのをトリガーに武装切り替え
#入力： entity: player position: player

#拾い直し
execute if entity @e[type=item,limit=1,nbt={Item:{tag:{item-type:controll-rod}}},sort=nearest,distance=..10] run tag @s add controll-stick-reciever
execute if entity @e[type=item,limit=1,nbt={Item:{tag:{item-type:controll-rod}}},sort=nearest,distance=..10] run schedule function plane:controll/weapon/schedule-give-controll-stick 2
kill @e[type=item,limit=1,nbt={Item:{tag:{item-type:controll-rod}}},sort=nearest,distance=..10]

#武装変更
execute as @e[tag=controll-target,distance=..20] run scoreboard players operation @s plane-weapon %= @s weapon-types
scoreboard players add @e[tag=controll-target,distance=..20] plane-weapon 1

#スコアリセット
scoreboard players reset @s drop-cont-stick
