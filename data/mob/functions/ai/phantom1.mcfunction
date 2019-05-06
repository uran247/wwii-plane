#ai/aiから呼び出される
#実行者・座標はphantom1

#実行者にタグ付け
tag @s add ai-executer
tag @e[tag=phantom1-rider,sort=nearest,distance=..3] add ai-rider

#ターゲットにタグ付け
tag @p[distance=..128] add ai-target
execute as @p[tag=ai-target] positioned ^376 ^ ^-376 run tag @s[distance=500] remove ai-target
execute as @p[tag=ai-target] positioned ^-376 ^ ^-376 run tag @s[distance=500] remove ai-target
execute as @p[tag=ai-target] positioned ^ ^376 ^-376 run tag @s[distance=500] remove ai-target
execute as @p[tag=ai-target] positioned ^ ^-376 ^-376 run tag @s[distance=500] remove ai-target
execute at @p[tag=ai-target,scores={plane-id=1..}] run tag @e[tag=plane-root,limit=1,sort=nearest] add ai-target-plane

#どっちに回ればプレイヤーに近づくか検知して旋回方向決定
execute as @p[tag=ai-target] positioned ^-502 ^ ^ if entity @s[distance=..500] positioned ^502 ^ ^ run tag @e[tag=ai-executer,distance=..1] add AngYplus
execute as @p[tag=ai-target] positioned ^502 ^ ^ if entity @s[distance=..500] positioned ^-502 ^ ^ run tag @e[tag=ai-executer,distance=..1] add AngYminus
execute as @p[tag=ai-target] positioned ^ ^ ^-501 if entity @s[distance=..500] positioned ^ ^ ^501 run tag @e[tag=ai-executer,distance=..1] add existbehind
execute as @p[tag=ai-target] positioned ^ ^-502 ^ if entity @s[distance=..500] positioned ^ ^502 ^ run tag @e[tag=ai-executer,distance=..1] add AngXplus
execute as @p[tag=ai-target] positioned ^ ^502 ^ if entity @s[distance=..500] positioned ^ ^-502 ^ run tag @e[tag=ai-executer,distance=..1] add AngXminus

#近すぎたら曲がるのをやめるようにする
execute if entity @p[distance=..5,tag=ai-target] run tag @s add near
execute if entity @p[distance=30..,tag=ai-target] run tag @s remove near

#真下が地面なら上へ行くようにする
execute unless block ~ ~-1 ~ minecraft:air run tag @s add AngXminus
execute unless block ~ ~-1 ~ minecraft:air run tag @s remove AngXplus

#ターゲット不在なら右旋回する
execute unless entity @p[tag=ai-target] run tag @s add AngYplus

#ターゲット不在で高さ250なら高度を下げる
execute unless entity @p[tag=ai-target] positioned ~ 0 ~ unless entity @s[dx=1,dy=200,dz=1] run tag @s add AngXplus

#execute if entity @e[tag=AngXplus] run say @e[tag=AngXplus]

#プレイヤー座標を向くように旋回
scoreboard players operation @s[tag=AngYplus,tag=!near] AngY += @s yaw-speed
scoreboard players operation @s[tag=existbehind,tag=!AngYplus,tag=!AngYminus,tag=!near] AngY += @s yaw-speed
scoreboard players operation @s[tag=AngYminus,tag=!near] AngY -= @s yaw-speed
scoreboard players operation @s[tag=AngXplus,tag=!near,scores={AngX=..6000}] AngX += @s pitch-speed
scoreboard players operation @s[tag=AngXminus,tag=!near,scores={AngX=-6000..}] AngX -= @s pitch-speed

#Y角が36000を超えたら補正
scoreboard players remove @s[scores={AngY=36000..}] AngY 36000
scoreboard players remove @s[scores={AngX=36000..}] AngX 36000
scoreboard players add @s[scores={AngY=..-36000}] AngY 36000
scoreboard players add @s[scores={AngX=..-36000}] AngX 36000

#向きをスコアから入れる
execute store result entity @s Rotation[0] float 0.01 run scoreboard players get @s AngY
execute store result entity @s Rotation[1] float 0.01 run scoreboard players get @s AngX

#単位ベクトル算出
execute at @s run summon minecraft:area_effect_cloud ^ ^ ^1 {Tags:[ai-indicator,entity-nohit]}
execute store result score @s speedX run data get entity @e[tag=ai-indicator,limit=1,distance=..2] Pos[0] 100
execute store result score @s speedY run data get entity @e[tag=ai-indicator,limit=1,distance=..2] Pos[1] 100
execute store result score @s speedZ run data get entity @e[tag=ai-indicator,limit=1,distance=..2] Pos[2] 100
execute at @s store result score @s reg1 run data get entity @s Pos[0] 100
execute at @s store result score @s reg2 run data get entity @s Pos[1] 100
execute at @s store result score @s reg3 run data get entity @s Pos[2] 100
scoreboard players operation @s speedX -= @s reg1
scoreboard players operation @s speedY -= @s reg2
scoreboard players operation @s speedZ -= @s reg3

#speedとの積をとって移動量算出
scoreboard players operation @s speedX *= @s speed
scoreboard players operation @s speedY *= @s speed
scoreboard players operation @s speedZ *= @s speed

#debug用motion停止
#scoreboard players set @s speedX 0
#scoreboard players set @s speedY 0
#scoreboard players set @s speedZ 0

#Motionに代入
execute store result entity @s Motion[0] double 0.00001 run scoreboard players get @s speedX
execute store result entity @s Motion[1] double 0.00001 run scoreboard players get @s speedY
execute store result entity @s Motion[2] double 0.00001 run scoreboard players get @s speedZ

#プレイヤーの方を向いたら射撃
#execute as @s[tag=!AngYplus,tag=!AngYminus,tag=!AngXplus,tag=!AngXminus,tag=!existbehind] run say lockon
execute as @s[tag=!AngYplus,tag=!AngYminus,tag=!AngXplus,tag=!AngXminus,tag=!existbehind,scores={ammunition1=1..,w1-reload=..0}] at @s run function mob:weapon/phantom1/7p7mm
execute as @s[tag=!AngYplus,tag=!AngYminus,tag=!AngXplus,tag=!AngXminus,tag=!existbehind,scores={ammunition1=1..,w1-reload=..0}] at @s run scoreboard players remove @s ammunition1 1
scoreboard players remove @s[scores={ammunition1=1..,w1-reload=1..}] w1-reload 1

#particle
particle minecraft:large_smoke ~ ~ ~ 0.3 0.3 0.3 0 5 force

#実行者タグ除去
kill @e[tag=ai-indicator,distance=..2]
tag @s remove AngYplus
tag @s remove AngYminus
tag @s remove AngXplus
tag @s remove AngXminus
tag @s remove existbehind
tag @s remove ai-executer
tag @e[tag=phantom1-rider,sort=nearest,distance=..3] remove ai-rider
execute at @a[tag=ai-target] run tag @e[tag=ai-target-plane,distance=..20] remove ai-target-plane
tag @a[tag=ai-target] remove ai-target

