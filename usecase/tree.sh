#!/bin/zsh

list_recursive()
{
	local filepath=$1
	local indent=$2

	# インデント付きで、パス部分を取り除いてファイル名を表示する
	echo "${indent}${filepath##*/}"
			
	# ディレクトリの場合の処理
	if [ -d "$filepath" ]; then
		local fname

		IFS=$'\n'
		for fname in $(ls "$filepath")
		do
			# ディレクトリ内のファイルを表示
			# echo "${filepath}/${fname}"
			# ディレクトリならば、再度list_recursiveを読み出す
			list_recursive "${filepath}/${fname}" "  $indent"
		done
	fi
}

list_recursive "$1" ""
