#入力　entity:d3a-root pos:@s
#処理　d3aをアイテム化

#同じIDのパーツ取得
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[tag=plane] if score @s plane-id = #plane-id reg1 run tag @s add d3a2item-plane-parts

#アイテムをsummon
function item:give/plane/give-d3a-spawn

#キル
execute as @e[tag=d3a2item-plane-parts] at @s run tp @s ~ -40 ~
kill @e[tag=d3a2item-plane-parts]
kill @s