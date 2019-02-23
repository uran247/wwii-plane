#seedタグがついたアマスタからエンティティ生成
execute store result score #entitycount reg1 if entity @e[tag=enemy-plane]

#tellraw @a [{"text":"entitycount:"},{"score":{"name":"#entitycount","objective":"reg1"}},{"text":"#max:"},{"score":{"name":"#max","objective":"max-entity"}}]
execute if score #entitycount reg1 < #max max-entity as @e[tag=phantom1-seed] at @s if entity @e[tag=flying,distance=..128] run function mob:summon/phantom1

#debug
#execute if score #entitycount reg1 < #max max-entity as @e[tag=phantom1-seed] run say @e[tag=phantom1-seed]


kill @e[tag=mob-seed]