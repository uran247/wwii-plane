#機体が飛行中か滑走中か確認してそれに応じた移動ファンクションを実行
#実行例:execute as @a[nbt={RootVehicle:{Entity:{Tags:[plane-root]}}}] at @s run function plane:controll/controll
#実行者：プレイヤー

#透明にしとく
effect give @s minecraft:invisibility 1

#plane-riderタグのツイてないプレイヤーの右クリックリセット
execute as @s[tag=!plane-rider] run scoreboard players reset @s rightClick

#seatを参照して実行者にid、タグ付け
scoreboard players operation @s plane-id = @e[tag=plane-seat,limit=1,sort=nearest,distance=..5] plane-id
tag @s add plane-rider

#対象機体にタグ付け

#実行者と対象機体にタグ付け
tag @s add controller
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[tag=plane-root] if score @s plane-id = #plane-id reg1 run tag @s add controll-target

#自分と同じIDのパーツにタグ付け
execute as @e[tag=controll-target,distance=..20] at @s as @e[distance=..20,scores={plane-id=1..}] if score @s plane-id = #plane-id reg1 run tag @s add controll-parts

#選択スロット判定(plane:controll/rolling plane:controll/flying plane:controll/weaponで使用)
function util:get-player-slot
scoreboard players operation @s plane-key-input = #selected-slot return

#移動操作
execute if entity @e[tag=controll-target,tag=!flying,limit=1,sort=nearest,distance=..20] run function plane:controll/rolling
execute if entity @e[tag=controll-target,tag=flying,limit=1,sort=nearest,distance=..20] run function plane:controll/flying

#武器使用
function plane:controll/weapon

#スコア情報をActionbarに表示 
execute at @s as @e[tag=controll-target,distance=..20,limit=1] run function plane:controll/plane-info

#タグ削除
tag @e[tag=controll-target,tag=plane-root,limit=1,sort=nearest,distance=..20] remove controll-target
tag @s remove controller
tag @e[tag=controll-parts,distance=..13] remove controll-parts

