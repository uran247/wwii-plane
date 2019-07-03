#角度/速度スコアからベクトルを計算して機体のMotionに反映する
#条件:plane-moveから実行 execute as @e[type=armor_stand,tag=plane-root,scores={speed=1..}] at @s run function plane:move/move
#実行者：機体
#利用可能タグスコア　スコア：#plane-id reg1 

#実行者にタグ付け
tag @s add flying-executer

#### 基本加速量決定 reg1に代入される ####
scoreboard players operation #accelerate input = @s accelerate
scoreboard players operation #throttle input = @s throttle
function plane:move/plane-move/set-base-accelerate
scoreboard players operation #base-accelerate reg1 = #base-accelerate return

####減速量決定　reg4に代入される ####
scoreboard players operation #speed input = @s speed
scoreboard players operation #cruise-speed input = @s cruise-speed
scoreboard players operation #resistance input = @s resistance
function plane:move/plane-move/set-base-resistance
scoreboard players operation #base-resistance reg1 = #base-resistance return

scoreboard players operation #speedY input = @s speedY
scoreboard players operation #deaccelerate input = @s deaccelerate
function plane:move/plane-move/set-base-deaccelerate
scoreboard players operation #base-deaccelerate reg1 = #base-deaccelerate return

#### speed決定 ####
scoreboard players operation @s speed += #base-accelerate reg1
scoreboard players operation @s speed -= #base-resistance reg1
#speedが0未満だったら0にする
scoreboard players set @s[scores={speed=..-1}] speed 0

#x方向ベクトル×speedをMotionに代入
scoreboard players operation #displacementX reg1 = @s speedX
scoreboard players operation #displacementX reg1 *= @s speed
scoreboard players operation #displacementX reg1 /= #10 Num
execute store result entity @s Motion[0] double 0.00001 run scoreboard players get #displacementX reg1

#Y方向ベクトルに0.05を代入
execute store result entity @s Motion[1] double -0.05 run scoreboard players get #1 Num

#z方向ベクトル×speedをMotionに代入
scoreboard players operation #displacementZ reg1 = @s speedZ
scoreboard players operation #displacementZ reg1 *= @s speed
scoreboard players operation #displacementZ reg1 /= #10 Num
execute store result entity @s Motion[2] double 0.00001 run scoreboard players get #displacementZ reg1

#speedがtakeoff-speedを超えスロットル全開なら飛行状態に遷移
execute as @s[scores={throttle=20..}] if score @s takeoff-speed < @s speed run function plane:move/plane-move/rolling/takeoff

#speedがpropeller-stopだったら停止モデル、propeller-startだったら滑走モデルに切り替え
function plane:move/plane-move/rolling/change-plpr-model

#音
scoreboard players set @s[scores={sound=33..}] sound 0
execute if entity @s[scores={sound=0,speed=1..}] at @p run playsound minecraft:plane.engine.recipro-rolling ambient @a ~ ~ ~ 1 1 1
scoreboard players operation @s reg1 = #rand rand
scoreboard players operation @s reg1 %= #3 Num
scoreboard players operation @s sound += @s reg1
scoreboard players add @s sound 1
#speedが1になったらエンジン始動音を鳴らす
function plane:move/plane-move/rolling/engine-start-sound

#speedが0なら音停止
execute if entity @s[scores={speed=..0}] at @s run stopsound @a[distance=..10] * minecraft:plane.engine.recipro-rolling

#登場者がいるか判定して、いないならスピードを下げる
execute at @s as @a[tag=plane-rider] if score #plane-id reg1 = @s plane-id run tag @e[tag=flying-executer,limit=1,distance=..1] add exist-rider
execute at @s[tag=!exist-rider] run scoreboard players remove @s[scores={speed=1..}] speed 10

#タグ解除
tag @s remove exist-rider
tag @s remove flying-executer
