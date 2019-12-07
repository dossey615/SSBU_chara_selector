#!/bin/bash

function selectRange(){
	read -p "範囲を選択してください! (all/vip/new/old)" DATA
	case "$DATA" in
  		"vip"|"all"|"new"|"old") echo "${DATA}" ;;
  		*) echo "error"
	esac
}

function selectCharacters(){

#arrayの名前から配列を参照そして関数内の配列として定義
	arrayname=$1
	eval ref=\"\${$arrayname[@]}\"
    list=(${ref})

#該当キャラの総数を取得
	count=`echo ${#list[@]}`

#該当キャラがいるか検証。いなければ終了
	if [ ${count} = 0 ] ; then
		echo "該当するキャラがいません"
	else
#必要な値を代入
		random=`echo $((RANDOM%${count}))`
		color=`echo $(((RANDOM%8) + 1))`
		chara=`echo ${list[$random]}`
		chara=`echo ${chara#*)}`
#結果を出力
		echo "キャラクター：${chara}"
		echo "カラーリング：${color}"
	fi
}

#-----------------main-------------------#

#範囲指定
while :
do
range=`selectRange`
if [ "${range}" = "error" ]; then 
	echo "please enter [all], [vip], [new] or [old] word."
else
	break
fi
done

#範囲によるキャラ絞り込み
case ${range} in
	all) declare -a choseChara=(`cat charactors.txt|xargs`) ;;
	vip) declare -a choseChara=(`cat charactors.txt|grep ^\(.*[vV]ip.*\) |xargs`) ;;
	new) declare -a choseChara=(`cat charactors.txt|grep ^\(.*[nN]ew.*\)|xargs`) ;;
	old) declare -a choseChara=(`cat charactors.txt|grep ^\(.*[oO]ld.*\)|xargs`)
esac

#条件下の元、キャラ選択実行
selectCharacters choseChara
