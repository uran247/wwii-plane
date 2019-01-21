#tickタグで指定して実行
execute as @a[nbt={RootVehicle:{Entity:{Tags:[plane-root]}}}] at @s run function plane:controll/controll
execute as @e[tag=a6m-root] at @s run function plane:position/a6m-position
execute as @e[tag=spitfire-root] at @s run function plane:position/spitfire-position
execute as @e[tag=ju87-root] at @s run function plane:position/ju87-position
execute as @e[tag=f4u-root] at @s run function plane:position/f4u-position
execute as @e[type=armor_stand,tag=plane-root,scores={speed=1..}] at @s run function plane:move/plane-move
#execute as @a at @s as @s[nbt={RootVehicle:{Entity:{Tags:[plane-root]}}},y=100,dy=200] run function test:summon-phantom
#execute as @a[nbt={RootVehicle:{Entity:{Tags:[plane-root]}}}] at @s positioned ~ 150 ~ if entity @s[y=130,dy=200] run function test:summon-ghast
#execute as @e[tag=f4u-root] at @s run function test:gun-test

function plane:math/rand


#execute as @e[tag=a6m-root] at @s run function plane:math/vector-3input
