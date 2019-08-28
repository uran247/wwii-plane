#入力
#処理　dummy-itemを回収したらインベントリを全削除する

execute as @a store success score @s reg1 run clear @s #minecraft:special-items{dummy-item:1b} 0
execute as 0-0-5-0-0 run loot give @a[scores={reg1=1..}] fish loot:craft/craft ~ ~ ~ mainhand
execute as @a[scores={reg1=1..}] run clear @s #minecraft:special-items{dummy-item:1b} 1
execute if entity @a[scores={reg1=1..}] run data merge block ~ ~ ~ {Items:[]}