#
#入力：entity: @e[scores={reg1=1..}]
#処理：命中メッセージをチャット欄に表示
#戻り：
execute store result score #hit-num reg1 if entity @e[tag=!entity-nohit,distance=..16,scores={reg1=1}]
tellraw @p[tag=bomb-owner] [{"text":"命中×","color":"white"},{"score":{"name":"#hit-num","objective":"reg1"}}]
