#ボスバーセットと撃墜数リセット
scoreboard players set @a shootdown 0
scoreboard players set #global shootdown 0

bossbar add game-progress "制圧度"
bossbar set minecraft:game-progress players @a

#ステージに応じてクリア撃墜数をセット
execute if entity @p[scores={stage-id=1}] run scoreboard players set #global clear-score 100