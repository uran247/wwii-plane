#角度差を0にするようにangleに補正を描ける
#input: #delta-angle input, #base-angle input, #change-ammount input
#return: #new-angle return

#delta-angleがchange-ammountよりでかいならbase-angle - change-ammount、0以上change-ammount未満ならbase-angle - delta-angle
execute if score #delta-angle input > #change-ammount input run scoreboard players operation #base-angle input += #change-ammount input
execute if score #delta-angle input >= #1 Num if score #delta-angle input <= #change-ammount input run scoreboard players operation #base-angle input += #delta-angle input

#delta-angleが0以下なら判定のためchange-ammountを反転
execute if score #delta-angle input <= #0 Num run scoreboard players operation #change-ammount input *= #-1 Num

#delta-angleがchange-ammountより小さいならbase-angle - change-ammount、0未満change-ammount以上ならbase-angle - delta-angle
execute if score #delta-angle input < #change-ammount input run scoreboard players operation #base-angle input += #change-ammount input
execute if score #delta-angle input <= #-1 Num if score #delta-angle input >= #change-ammount input run scoreboard players operation #base-angle input += #delta-angle input

#return
scoreboard players operation #new-angle return = #base-angle input