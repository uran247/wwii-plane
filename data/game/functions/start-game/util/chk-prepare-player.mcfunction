#入力　座標：スタートボタン位置
#処理　プレイヤーの準備が整ってるか確認
#返り　#chk-prepare return 0:テストNG 1:テストOK

#テストパスフラグを1に
scoreboard players set #chk-prepare return 1

#プレイヤーのエンダーチェストの航空機が5機以内か確認
execute as @a store result score @s reg1 if data entity @s EnderItems[{id:"minecraft:bat_spawn_egg"}]
execute as @a store result score @s reg2 if data entity @s Inventory[{id:"minecraft:bat_spawn_egg"}]
execute as @a run scoreboard players operation @s reg1 += @s reg2
execute if entity @a[scores={reg1=6..}] run scoreboard players set #chk-prepare return 0
execute if entity @a[scores={reg1=6..}] run tellraw @a [{"text":"持ち込める航空機は5機までです","color":"yellow"}]

#プレイヤーが実行地点周囲に集まってるか確認
execute store result score #player-all-num reg1 if entity @a
execute store result score #player-around-num reg1 if entity @a[distance=..20]
execute unless score #player-all-num reg1 = #player-around-num reg1 run scoreboard players set #chk-prepare return 0
execute unless score #player-all-num reg1 = #player-around-num reg1 run tellraw @a [{"text":"プレイヤーが全員集まっていません","color":"yellow"}]

#stageごとのチェック実施
execute if score #global stage-id matches 1 run function game:start-game/stage-1/chk-start-condition
execute if score #global stage-id matches 2 run function game:start-game/stage-2/chk-start-condition
execute if score #global stage-id matches 3 run function game:start-game/stage-3/chk-start-condition
execute if score #global stage-id matches 4 run function game:start-game/stage-4/chk-start-condition
execute if score #global stage-id matches 5 run function game:start-game/stage-5/chk-start-condition