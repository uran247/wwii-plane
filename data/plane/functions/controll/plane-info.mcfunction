#### スコア情報をActionbarに表示 ####
#speed計算
scoreboard players operation #speed reg1 = @s speed
scoreboard players operation #speed reg1 *= #288 Num
scoreboard players operation #speed reg1 /= #10000 Num


#throt計算
scoreboard players operation #throttle reg1 = @s throttle
scoreboard players operation #throttle reg1 *= #5 Num

#高度取得
scoreboard players operation #altitude reg1 = @s PosY
scoreboard players operation #altitude reg1 /= #100000 Num

#wepon残弾数取得
scoreboard players operation #ammunition1 reg1 = @s ammunition1
scoreboard players operation #ammunition2 reg1 = @s ammunition2
scoreboard players operation #ammunition3 reg1 = @s ammunition3

#残弾数0の場合リロード時間を取得
execute if entity @s[scores={ammunition1=..0}] run scoreboard players operation #ammunition1 reg1 = @s ammo-reload1
execute if entity @s[scores={ammunition1=..0}] run scoreboard players operation #ammunition1 reg1 /= #20 Num
execute if entity @s[scores={ammunition2=..0}] run scoreboard players operation #ammunition2 reg1 = @s ammo-reload2
execute if entity @s[scores={ammunition2=..0}] run scoreboard players operation #ammunition2 reg1 /= #20 Num
execute if entity @s[scores={ammunition3=..0}] run scoreboard players operation #ammunition3 reg1 = @s ammo-reload3
execute if entity @s[scores={ammunition3=..0}] run scoreboard players operation #ammunition3 reg1 /= #20 Num

title @p actionbar ["",{"score":{"name":"#speed","objective":"reg1"},"color":"red"},{"text":"km/h Throt:","color":"red"},{"score":{"name":"#throttle","objective":"reg1"},"color":"red"},{"text":"% Alt:","color":"red"},{"score":{"name":"#altitude","objective":"reg1"},"color":"red"},{"text":" Wpn:","color":"red"},{"score":{"name":"@s","objective":"plane-weapon"},"color":"red"},{"text":" Ammo:{wpn1:","color":"red"},{"score":{"name":"#ammunition1","objective":"reg1"},"color":"red"},{"text":" wpn2:","color":"red"},{"score":{"name":"#ammunition2","objective":"reg1"},"color":"red"},{"text":" wpn3:","color":"red"},{"score":{"name":"#ammunition3","objective":"reg1"},"color":"red"},{"text":"}","color":"red"}]
