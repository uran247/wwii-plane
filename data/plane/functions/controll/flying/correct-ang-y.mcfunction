#AngYのスコアを-18000 - 18000の範囲に収める
#入力 entity:機体
scoreboard players remove @s[scores={AngY=18100..}] AngY 36000
scoreboard players add @s[scores={AngY=..-18100}] AngY 36000
