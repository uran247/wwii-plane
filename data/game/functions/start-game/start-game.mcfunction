#gameを開始する

#プレイヤーの準備が整ってるか確認
function game:start-game/util/chk-prepare-player

#checkOKならステージ選択
execute if score #chk-prepare return matches 1 run function game:start-game/util/go-stage
