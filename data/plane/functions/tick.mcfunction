#tickタグで指定して実行

#プレイヤーのplaneid、rider、keyinputタグリセット
execute as @a[nbt=!{RootVehicle:{Entity:{Tags:[plane-seat]}}}] run scoreboard players reset @s plane-id
execute as @a[nbt=!{RootVehicle:{Entity:{Tags:[plane-seat]}}}] run tag @s remove plane-rider
scoreboard players set @a[nbt=!{RootVehicle:{Entity:{Tags:[plane-seat]}}}] plane-key-input 0

#飛行機操作
execute as @a[nbt={RootVehicle:{Entity:{Tags:[plane-seat]}}}] at @s run function plane:controll/controll

#飛行機移動
execute as @e[type=armor_stand,tag=plane-root,tag=!no-move] at @s run function plane:move/plane-move

#飛行機位置修正
function plane:position/position

#execute as @e[tag=a6m-root] at @s run function math:vector-3input
