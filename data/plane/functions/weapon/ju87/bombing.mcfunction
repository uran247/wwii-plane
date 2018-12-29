#爆弾投下 ju87
#実行者：機体

#実行者タグ付け
tag @s add bombing-executer

#投下対象判定
execute as @e[tag=ju87-bomb,distance=..5] if score @s plane-id = @e[tag=bombing-executer,limit=1,distance=..1] plane-id run tag @s add bombed
tag @e[tag=ju87-bomb,tag=bombed,distance=..5] add dropping

#plane-id削除
scoreboard players reset @e[tag=bombed,distance=..5] plane-id

#スコア付与
scoreboard players operation @e[tag=bombed,distance=..5] speed = @s speed
scoreboard players operation @e[tag=bombed,distance=..5] speed /= #100 Num
scoreboard players set @e[tag=bombed,distance=..5] damage 10
scoreboard players set @e[tag=bombed,distance=..5] age 1200
scoreboard players set @e[tag=bombed,distance=..5] no-hit 1190

#発射位置に移動

#向きを機体と同じに
execute rotated as @s as @e[tag=bombed,limit=1,distance=..5] positioned as @s run tp @s ~ ~ ~ ~ ~

#tellraw @p [{"score" : {"name":"@e[tag=bombed,distance=..5,limit=1]", "objective":"speed"}}, {"text":" "}, {"score" : {"name":"@e[tag=bombed,distance=..5,limit=1]", "objective":"age"}}]


#投下機体の装備タグ削除
tag @s remove armed

#音
#playsound minecraft:weapon.heavy-muchingun.fire master @a ~ ~ ~ 1 1
playsound minecraft:block.piston.contract ambient @a ~ ~ ~ 1 1.5

#終了処理
tag @s remove bombing-executer
tag @e[tag=ju87-bomb,tag=bombed,distance=..5] remove bombed
scoreboard players set @p[scores={rightClick=1..}] rightClick 0
