#tickタグで指定して実行
#搭乗時、降機時の飛行機に関連するコマンド

#プレイヤーのplaneid、rider、keyinputタグリセット
execute as @a[nbt=!{RootVehicle:{Entity:{Tags:[plane-seat]}}}] run scoreboard players reset @s plane-id
execute as @a[nbt=!{RootVehicle:{Entity:{Tags:[plane-seat]}}}] run tag @s remove plane-rider
execute as @a[nbt=!{RootVehicle:{Entity:{Tags:[plane-seat]}}}] run tag @s remove entity-nohit
scoreboard players set @a[nbt=!{RootVehicle:{Entity:{Tags:[plane-seat]}}}] plane-key-input 0

#飛行機のタグリセット
tag @e[type=armor_stand,tag=plane-root] remove has-rider

#飛行機操作(搭乗時)
execute as @a[nbt={RootVehicle:{Entity:{Tags:[plane-seat]}}}] at @s run function plane:controll/controll

#飛行機操作(降機時)
execute as @a[scores={rightClick=1..},nbt=!{RootVehicle:{Entity:{Tags:[plane-seat]}}}] at @s run function plane:controll/controll-ground

#飛行機移動
execute as @e[type=armor_stand,tag=plane-root,tag=!no-move] at @s run function plane:move/plane-move


#飛行機位置修正
execute as @e[type=armor_stand,tag=plane-root] at @s run function plane:position/position

#位置処理がされなかった=rootがいなかったエンティティを削除
kill @e[tag=plane,tag=!plane-root,tag=!position-processed,tag=!no-delete]
tag @e[tag=position-processed] remove position-processed

#スポナー使用時に飛行機召喚
function plane:summon/spawner-manager
