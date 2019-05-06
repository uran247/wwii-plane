#### スコア情報をActionbarに表示 ####
#高度取得
scoreboard players operation #altitude reg1 = @e[tag=controll-target,distance=..20,limit=1] PosY
scoreboard players operation #altitude reg1 /= #100000 Num

#wepon残弾数取得
scoreboard players operation #ammunition1 reg1 = @e[tag=controll-target,distance=..20,limit=1] ammunition1
scoreboard players operation #ammunition2 reg1 = @e[tag=controll-target,distance=..20,limit=1] ammunition2
scoreboard players operation #ammunition3 reg1 = @e[tag=controll-target,distance=..20,limit=1] ammunition3

#残弾数0の場合リロード時間を取得
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={ammunition1=..0}] run scoreboard players operation #ammunition1 reg1 = @e[tag=controll-target,distance=..20,limit=1] ammo-reload1
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={ammunition1=..0}] run scoreboard players operation #ammunition1 reg1 /= #20 Num
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={ammunition2=..0}] run scoreboard players operation #ammunition2 reg1 = @e[tag=controll-target,distance=..20,limit=1] ammo-reload2
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={ammunition2=..0}] run scoreboard players operation #ammunition2 reg1 /= #20 Num
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={ammunition3=..0}] run scoreboard players operation #ammunition3 reg1 = @e[tag=controll-target,distance=..20,limit=1] ammo-reload3
execute if entity @e[tag=controll-target,distance=..20,limit=1,scores={ammunition3=..0}] run scoreboard players operation #ammunition3 reg1 /= #20 Num

title @s actionbar ["",{"text":"speed:","color":"red"},{"score":{"name":"@e[tag=controll-target,distance=..20,limit=1]","objective":"speed"},"color":"red"},{"text":" Altitude:","color":"red"},{"score":{"name":"#altitude","objective":"reg1"},"color":"red"},{"text":" weapon:","color":"red"},{"score":{"name":"@e[tag=controll-target,distance=..20,limit=1]","objective":"plane-weapon"},"color":"red"},{"text":" weapon1-ammo:","color":"red"},{"score":{"name":"#ammunition1","objective":"reg1"},"color":"red"},{"text":" weapon2-ammo:","color":"red"},{"score":{"name":"#ammunition2","objective":"reg1"},"color":"red"},{"text":" weapon3-ammo:","color":"red"},{"score":{"name":"#ammunition3","objective":"reg1"},"color":"red"}]
