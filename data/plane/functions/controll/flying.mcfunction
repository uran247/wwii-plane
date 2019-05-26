#飛行中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#実行者はプレイヤー　plane:controll/controll経由で実行　操作対象の機体にはcontroll-targetタグがついている
#入力：　エンティティ：プレイヤー　座標：機体　タグ：controll-target controll-parts
#ふぃくしょん方式

#周囲見渡しスロットを選択してたらタグ付け
tag @s[scores={plane-key-input=8}] add overlook

#engineがいなかったら強制的に速度マイナス
execute if entity @e[tag=controll-target,distance=..1,limit=1,scores={engine=0}] run scoreboard players set @p plane-key-input 6

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score #source-rot input run data get entity @s Rotation[0] 100
scoreboard players operation #target-rot input = @e[tag=controll-target,distance=..1,limit=1] AngY
function util:get-angle-defference
execute if entity @s[tag=!overlook] run scoreboard players operation @e[tag=controll-target,distance=..1,limit=1] yaw-gap = #defference return

#プレイヤーが上を向いているか下を向いているか取得(0未満なら上、0以上なら下)
execute store result score #source-rot input run data get entity @s Rotation[1] 100
scoreboard players operation #target-rot input = @e[tag=controll-target,distance=..1,limit=1] AngX
function util:get-angle-defference
execute if entity @s[tag=!overlook] run scoreboard players operation @e[tag=controll-target,distance=..1,limit=1] pitch-gap = #defference return

#スロット8選択でthrottleが+１，6選択で-1
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..1,limit=1] run scoreboard players add @s[scores={throttle=..19}] throttle 1
execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..1,limit=1] run scoreboard players remove @s[scores={throttle=1..}] throttle 1

#speedがgear-pull-outだったら滑走モデル、gear-retractingだったら飛行モデルに切り替え(失速中の場合はギアを出さない)
execute as @e[tag=controll-target,limit=1,distance=..20,tag=!stall] if score @s speed >= @s gear-pullout-min if score @s speed <= @s gear-pullout-max store result entity @e[tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s rolling-udvm
execute as @e[tag=controll-target,limit=1,distance=..20] if score @s speed >= @s gear-retract-min if score @s speed <= @s gear-retract-max store result entity @e[tag=model-changeable,limit=1,sort=nearest,distance=..20] HandItems[0].tag.Damage int 1 run scoreboard players get @s flying-udvm

#1ブロック下が空気以外かつspeedがギア引き出し速度未満、失速してない、throttlが50%未満ならならなら着陸モードへ
execute as @e[tag=controll-target,distance=..1,limit=1,tag=!stall,tag=!destroyed,scores={throttle=..10}] at @s if score @s gear-pullout-max > @s speed unless block ~ ~-2 ~ minecraft:air run data merge entity @e[tag=plane-seat,distance=..20,limit=1] {Invulnerable:1b}
execute as @e[tag=controll-target,distance=..1,limit=1,tag=!stall,tag=!destroyed,scores={throttle=..10}] at @s if score @s gear-pullout-max > @s speed unless block ~ ~-1 ~ minecraft:air run function plane:controll/flying/landing

#周囲見渡しタグ削除
tag @s[tag=overlook] remove overlook
