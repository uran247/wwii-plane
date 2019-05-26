#選択されるステージのランクを決定

#ステージを選択
scoreboard players set @a[distance=..10] stage-id 3

#mob最大数をセット
scoreboard players set #max max-entity 10

#stageに応じたfunction実行
execute if entity @p[distance=..10,scores={stage-id=1}] run function game:start-game/stage-1/start-game
execute if entity @p[distance=..10,scores={stage-id=2}] run function game:start-game/stage-2/start-game
execute if entity @p[distance=..10,scores={stage-id=3}] run function game:start-game/stage-3/start-game