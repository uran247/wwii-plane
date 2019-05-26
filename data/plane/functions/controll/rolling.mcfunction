#滑走中の機体について、プレイヤーの入力に応じて機体の角度/速度スコアを変更する
#入力：　エンティティ：プレイヤー　座標：機体　タグ：controll-target controll-parts

#周囲見渡しスロットを選択してたらタグ付け
tag @s[scores={plane-key-input=8}] add overlook

#engineがいなかったら強制的に速度マイナス
execute if entity @e[tag=controll-target,distance=..1,limit=1,scores={engine=0}] run scoreboard players set @p plane-key-input 6

#スロット8選択でthrottleが+１，6選択で-1
execute if entity @s[scores={plane-key-input=9}] as @e[tag=controll-target,distance=..1,limit=1] run scoreboard players add @s[scores={throttle=..19}] throttle 1
execute if entity @s[scores={plane-key-input=6}] as @e[tag=controll-target,distance=..1,limit=1] run scoreboard players remove @s[scores={throttle=1..}] throttle 1

#プレイヤーが右を向いているか左を向いているか取得(0未満なら左、0以上なら右)
execute store result score #source-rot input run data get entity @s Rotation[0] 100
scoreboard players operation #target-rot input = @e[tag=controll-target,distance=..1,limit=1] AngY
function util:get-angle-defference
execute if entity @s[tag=!overlook] run scoreboard players operation @e[tag=controll-target,distance=..1,limit=1] yaw-gap = #defference return

#周囲見渡しタグ削除
tag @s[tag=overlook] remove overlook
