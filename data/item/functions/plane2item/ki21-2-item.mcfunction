#入力　entity:ki21-root pos:@s
#処理　ki21をアイテム化

#同じIDのパーツ取得
scoreboard players operation #plane-id reg1 = @s plane-id
execute as @e[tag=plane] if score @s plane-id = #plane-id reg1 run tag @s add ki212item-plane-parts

#アイテムをsummon
function item:give/plane/give-ki21-spawn

#キル
execute as @e[tag=ki212item-plane-parts] at @s run tp @s ~ -40 ~
kill @e[tag=ki212item-plane-parts]
kill @s