#処理：装備の変更処理
#入力：entity plane-root

#装備品チェック
execute store success score #500kg reg1 if entity @e[distance=..30,type=minecraft:donkey,tag=target-parts,nbt={Items:[{tag:{item-type:no50mod2-bomb}}]}]
execute store success score #rocket reg1 if entity @e[distance=..30,type=minecraft:donkey,tag=target-parts,nbt={Items:[{tag:{item-type:type3no1mk28mod1-bomb}}]}]

#装備可能チェック


#装備


#ステータス変更
#装備に応じて右記ステータス変更：最高速度　巡航速度　旋回力