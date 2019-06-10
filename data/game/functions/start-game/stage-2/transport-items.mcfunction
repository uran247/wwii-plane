#処理 アイテムをステージのチェストへ移動
data modify block -1501 64 -1473 Items append from block -1 140 -4 Items[0]
data modify block -1501 64 -1473 Items append from block -1 140 -4 Items[1]
data modify block -1501 64 -1473 Items append from block -1 140 -4 Items[2]
data modify block -1501 64 -1473 Items append from block -1 140 -4 Items[3]
data modify block -1501 64 -1473 Items append from block -1 140 -4 Items[4]

data merge block -1 140 -4 {Items:{}}