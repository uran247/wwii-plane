#処理：装備の変更処理
#入力：entity plane-root

#航空機ごとの個別処理
#execute if entity @s[tag=d3a-root] run 
#execute if entity @s[tag=ki21-root] run 
execute if entity @s[tag=ki43-root] run function plane-data:ki-43/ki-43-equip
#execute if entity @s[tag=a5m-root] run 
execute if entity @s[tag=a6m2-root] run function plane-data:a6m2/a6m2-equip
execute if entity @s[tag=ki44-root] run function plane-data:ki-44/ki44-equip
execute if entity @s[tag=d4y2-root] run function plane-data:d4y2/d4y2-equip
#execute if entity @s[tag=j2m3-root] run 
execute if entity @s[tag=g4m1-root] run function plane-data:g4m1/g4m1-equip
execute if entity @s[tag=ki61-root] run function plane-data:ki-61/ki61-equip
#execute if entity @s[tag=j100b-root] run 
execute if entity @s[tag=a6m5-root] run function plane-data:a6m5/a6m5-equip
execute if entity @s[tag=n1k2-root] run function plane-data:n1k2/n1k2-equip

