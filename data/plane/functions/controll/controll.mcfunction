#機体が飛行中か滑走中か確認してそれに応じた移動ファンクションを実行
#実行例:execute as @a[nbt={RootVehicle:{Entity:{Tags:[plane-root]}}}] at @s run function plane:controll/controll
#実行者：プレイヤー

effect give @s minecraft:invisibility 1
tag @e[tag=plane-root,limit=1,sort=nearest,distance=..3] add controll-target
execute if entity @e[tag=controll-target,tag=!flying,limit=1,sort=nearest,distance=..3] run function plane:controll/rolling
execute if entity @e[tag=controll-target,tag=flying,limit=1,sort=nearest,distance=..3] run function plane:controll/flying
function plane:controll/weapon

#スコア情報をActionbarに表示
title @s actionbar ["",{"text":"speed:"},{"score":{"name":"@e[tag=controll-target,distance=..3,limit=1]","objective":"speed"}},{"text":" pitch:"},{"score":{"name":"@e[tag=controll-target,distance=..3,limit=1]","objective":"AngX"}},{"text":" roll:"},{"score":{"name":"@e[tag=controll-target,distance=..3,limit=1]","objective":"AngZ"}},{"text":" weapon:"},{"score":{"name":"@e[tag=controll-target,distance=..3,limit=1]","objective":"plane-weapon"}}]

tag @e[tag=controll-target,tag=plane-root,limit=1,sort=nearest,distance=..3] remove controll-target


#execute as @e[tag=a6m-root,limit=1,sort=nearest,distance=..5] at @s run function plane:move/a6m-position
#function uransfunc:plane/a6m/a6m-information

