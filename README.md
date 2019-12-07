# SSBU_chara_selector
スマブラSPのキャラをランダムでセレクトしてくれるスクリプトファイル

# 基本的な使い方
1. 自分の好きなディレクトリに`git clone`してくる
    ```linux:title
    $ git clone https://github.com/dossey615/SSBU_chara_selector.git 
    ```
2. cdコマンドで`SSBU_chara_selector`ディレクトリに移動
3. `charactors.txt`の内容を編集し、条件に当てはまるキャラを編集（下記参照）
4. `./select.sh`で実行
5. (all/vip/new/old)の中で指定したい範囲を入力
    - all：全てのキャラから選択する
    - vip：vipキャラの中から選択
    - new：まだオンラインで使用したことのないキャラから指定
    - old：vip未満の使用済みキャラから指定
    ```linux:例：allを押した場合
    $ ./select.sh 
    範囲を選択してください! (all/vip/new/old)all
    キャラクター：リンク
    カラーリング：3
    ```
# キャラのステータス変更
自分のキャラがvipかどうかなどのステータスを変更したい場合、`charactors.txt`の内容を編集してください
```txt:変更
/*
キャラ名の先頭のカッコ内に必要なステータスを入力する
以下テキストの内容
*/

(vip)マリオ　       //vipのキャラ
(old)ドンキーコング  //使用済みvip未満のキャラ
(new)リンク         //オンラインでの未使用のキャラ
()サムス
.
.
.
```
