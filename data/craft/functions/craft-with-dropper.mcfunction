#入力　座標：dropper座標
#処理　インベントリを見てクラフトする
execute if block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:bat_spawn_egg",tag:{plane-type:"ki-43",weapon:"7p7mm"}},{tag:{weapon-id:"ho103"}}]} run function craft:craft-item/ki-43-12p7mm