#### スコア情報をActionbarに表示 ####
#入力：entity 機体

#weaponチャットコンポーネント用タグをチェストの本にいれる
data modify block 0 4 0 Items[0].tag.pages set value [""]

#speed計算
scoreboard players operation #speed reg1 = @s speed
scoreboard players operation #speed reg1 *= #288 Num
scoreboard players operation #speed reg1 /= #10000 Num
execute if score @s speed <= @s gear-pullout-max run data modify block 0 4 0 Items[0].tag.pages[0] set value "[{\"score\":{\"name\":\"#speed\",\"objective\":\"reg1\"},\"color\":\"blue\"},{\"text\":\"km/h\",\"color\":\"blue\"}]"
execute if score @s speed > @s gear-pullout-max run data modify block 0 4 0 Items[0].tag.pages[0] set value "[{\"score\":{\"name\":\"#speed\",\"objective\":\"reg1\"},\"color\":\"red\"},{\"text\":\"km/h\",\"color\":\"red\"}]"

#throt計算
scoreboard players operation #throttle reg1 = @s throttle
scoreboard players operation #throttle reg1 *= #5 Num

#高度取得
scoreboard players operation #altitude reg1 = @s PosY
scoreboard players operation #altitude reg1 /= #10000 Num

execute if entity @s[tag=main-weapon1,scores={ammunition1=1..}] run data modify block 0 4 0 Items[0].tag.pages append value "[{\"text\":\"wpn1:\",\"color\":\"red\"},{\"score\":{\"name\":\"#ammunition1\",\"objective\":\"reg1\"},\"color\":\"red\"}]"
execute if entity @s[tag=main-weapon1,scores={ammunition1=..0}] run data modify block 0 4 0 Items[0].tag.pages append value "[{\"text\":\"reloading:\",\"color\":\"white\"},{\"score\":{\"name\":\"#ammunition1\",\"objective\":\"reg1\"},\"color\":\"white\"}]"
execute unless entity @s[tag=main-weapon1] run data modify block 0 4 0 Items[0].tag.pages append value ""

execute if entity @s[tag=main-weapon2,scores={ammunition2=1..}] run data modify block 0 4 0 Items[0].tag.pages append value "[{\"text\":\" wpn2:\",\"color\":\"red\"},{\"score\":{\"name\":\"#ammunition2\",\"objective\":\"reg1\"},\"color\":\"red\"}]"
execute if entity @s[tag=main-weapon2,scores={ammunition2=..0}] run data modify block 0 4 0 Items[0].tag.pages append value "[{\"text\":\" reloading:\",\"color\":\"white\"},{\"score\":{\"name\":\"#ammunition2\",\"objective\":\"reg1\"},\"color\":\"white\"}]"
execute unless entity @s[tag=main-weapon2] run data modify block 0 4 0 Items[0].tag.pages append value ""

execute if entity @s[tag=main-weapon3,scores={ammunition3=1..}] run data modify block 0 4 0 Items[0].tag.pages append value "[{\"text\":\" wpn3:\",\"color\":\"red\"},{\"score\":{\"name\":\"#ammunition3\",\"objective\":\"reg1\"},\"color\":\"red\"}]"
execute if entity @s[tag=main-weapon3,scores={ammunition3=..0}] run data modify block 0 4 0 Items[0].tag.pages append value "[{\"text\":\" reloading:\",\"color\":\"white\"},{\"score\":{\"name\":\"#ammunition3\",\"objective\":\"reg1\"},\"color\":\"white\"}]"
execute unless entity @s[tag=main-weapon3] run data modify block 0 4 0 Items[0].tag.pages append value ""

execute if entity @s[tag=main-weapon4,scores={ammunition4=1..}] run data modify block 0 4 0 Items[0].tag.pages append value "[{\"text\":\" wpn4:\",\"color\":\"red\"},{\"score\":{\"name\":\"#ammunition4\",\"objective\":\"reg1\"},\"color\":\"red\"}]"
execute if entity @s[tag=main-weapon4,scores={ammunition4=..0}] run data modify block 0 4 0 Items[0].tag.pages append value "[{\"text\":\" reloading:\",\"color\":\"white\"},{\"score\":{\"name\":\"#ammunition4\",\"objective\":\"reg1\"},\"color\":\"white\"}]"
execute unless entity @s[tag=main-weapon4] run data modify block 0 4 0 Items[0].tag.pages append value ""


#wepon残弾数取得
execute if entity @s[tag=main-weapon1] run scoreboard players operation #ammunition1 reg1 = @s ammunition1
execute if entity @s[tag=main-weapon2] run scoreboard players operation #ammunition2 reg1 = @s ammunition2
execute if entity @s[tag=main-weapon3] run scoreboard players operation #ammunition3 reg1 = @s ammunition3
execute if entity @s[tag=main-weapon4] run scoreboard players operation #ammunition4 reg1 = @s ammunition4
execute unless entity @s[tag=main-weapon1] run scoreboard players reset #ammunition1 reg1
execute unless entity @s[tag=main-weapon2] run scoreboard players reset #ammunition2 reg1
execute unless entity @s[tag=main-weapon3] run scoreboard players reset #ammunition3 reg1
execute unless entity @s[tag=main-weapon4] run scoreboard players reset #ammunition4 reg1

#残弾数0の場合リロード時間を取得
execute if entity @s[scores={ammunition1=..0}] run scoreboard players operation #ammunition1 reg1 = @s ammo-reload1
execute if entity @s[scores={ammunition1=..0}] run scoreboard players operation #ammunition1 reg1 /= #20 Num
execute if entity @s[scores={ammunition2=..0}] run scoreboard players operation #ammunition2 reg1 = @s ammo-reload2
execute if entity @s[scores={ammunition2=..0}] run scoreboard players operation #ammunition2 reg1 /= #20 Num
execute if entity @s[scores={ammunition3=..0}] run scoreboard players operation #ammunition3 reg1 = @s ammo-reload3
execute if entity @s[scores={ammunition3=..0}] run scoreboard players operation #ammunition3 reg1 /= #20 Num
execute if entity @s[scores={ammunition4=..0}] run scoreboard players operation #ammunition4 reg1 = @s ammo-reload4
execute if entity @s[scores={ammunition4=..0}] run scoreboard players operation #ammunition4 reg1 /= #20 Num

title @p[tag=controller] actionbar ["",{"nbt":"Items[0].tag.pages[0]","block":"0 4 0","interpret":true},{"text":" Throt:","color":"red"},{"score":{"name":"#throttle","objective":"reg1"},"color":"red"},{"text":"% Alt:","color":"red"},{"score":{"name":"#altitude","objective":"reg1"},"color":"red"},{"text":" Wpn:","color":"red"},{"score":{"name":"@s","objective":"plane-weapon"},"color":"red"},{"text":" Ammo:{","color":"red"},{"nbt":"Items[0].tag.pages[1]","block":"0 4 0","color":"red","interpret":true},{"nbt":"Items[0].tag.pages[2]","block":"0 4 0","color":"red","interpret":true},{"nbt":"Items[0].tag.pages[3]","block":"0 4 0","color":"red","interpret":true},{"nbt":"Items[0].tag.pages[4]","block":"0 4 0","color":"red","interpret":true},{"text":"}","color":"red"}]

#失速してたら警告表示
execute if entity @s[tag=stall] run title @p[tag=controller] times 0 1 1
execute if entity @s[tag=stall] run title @p[tag=controller] title [{"text":"失速！！","color":"dark_red"}]

#墜落判定が出たら表示
execute if entity @s[tag=destroyed] run title @p[tag=controller] times 0 1 1
execute if entity @s[tag=destroyed] run title @p[tag=controller] title [{"text":"墜落！！操作不能","color":"dark_red"}]

