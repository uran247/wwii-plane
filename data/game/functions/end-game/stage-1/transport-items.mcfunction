#チャンクロード
#summon minecraft:wandering_trader -1502 179769313486231580793728971405303415079934132710037826936173778980444968292764750946649017977587207096330286416692887910946555547851940402630657488671505820681908902000708383676273854845817711531764475730270069855571366959622842914819860834936475292719074168444365510704342711559699508093042880177904174497792 -1479 {UUIDMost: 0L, UUIDLeast: 0L}
#teleport 0-0-0-0-0 0 0 0
#kill 0-0-0-0-0

#処理 アイテムをステージのチェストへ移動
data modify block -1 140 -4 Items append from block -1501 64 -1473 Items[0]
data modify block -1 140 -4 Items append from block -1501 64 -1473 Items[1]
data modify block -1 140 -4 Items append from block -1501 64 -1473 Items[2]
data modify block -1 140 -4 Items append from block -1501 64 -1473 Items[3]
data modify block -1 140 -4 Items append from block -1501 64 -1473 Items[4]

#移設後インベントリ削除
data merge block -1501 64 -1473 {Items:{}}