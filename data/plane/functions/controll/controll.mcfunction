#機体が飛行中か滑走中か確認してそれに応じた移動ファンクションを実行
#実行例:execute as @a[nbt={RootVehicle:{Entity:{Tags:[plane-root]}}}] at @s run function plane:controll/controll
#実行者：プレイヤー

#透明にしとく
effect give @s minecraft:invisibility 1

#seatを参照して実行者にid、タグ付け
scoreboard players operation @s plane-id = @e[tag=plane-seat,limit=1,sort=nearest,distance=..5] plane-id
tag @s add plane-rider

#対象機体にタグ付け

#実行者と対象機体にタグ付け
tag @s add controller
#tag @e[tag=plane-root,limit=1,sort=nearest,distance=..20] add controll-target
execute as @e[tag=plane-root] if score @s plane-id = @p[tag=controller] plane-id run tag @s add controll-target

#自分と同じIDのパーツにタグ付け
execute as @e[tag=controll-target,distance=..20] at @s as @e[distance=..20,scores={plane-id=1..}] if score @s plane-id = @e[tag=controll-target,distance=..10,limit=1] plane-id run tag @s add controll-parts

#移動操作
execute if entity @e[tag=controll-target,tag=!flying,limit=1,sort=nearest,distance=..20] run function plane:controll/rolling
execute if entity @e[tag=controll-target,tag=flying,limit=1,sort=nearest,distance=..20] run function plane:controll/flying

#武器使用
function plane:controll/weapon

#スコア情報をActionbarに表示 
execute at @s run function plane:controll/plane-info

#タグ削除
tag @e[tag=controll-target,tag=plane-root,limit=1,sort=nearest,distance=..20] remove controll-target
tag @s remove controller
tag @e[tag=controll-parts,distance=..13] remove controll-parts

