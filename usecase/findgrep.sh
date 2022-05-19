#!/bin/zsh


usage()
{
    # シェルスクリプトのファイル名を取得
    local script_name=$(basename "$1")

    # ヒアドキュメントでヘルプを表示
    cat << END
Usage: $script_name PATTERN [PATH] [NAME_PATTERN]
Find file in current directory recursively, and print lines which match PATTERN.

    PATH            find file in PATH directory, instead of current directory
    NAME_PATTERN    specify name pattern to find file

EXAMPLE:
    $script_name return
    $script_name return ~ '*.txt'
END
}

# コマンドライン引数が0個のとき
if [ "$#" -eq 0 ]; then
    usage "$0"
    exit 1
fi

pattern=$1
directory=$2
name=$3

# 第二引数が空文字ならばデフォルト値として、カレントディレクトリを設定
if [ -z "$directory" ]; then
    directory='.'
fi

# 第三引数が空文字列ならばデフォルト値として、＊を指定
if [ -z "$name" ]; then
    name='*'
fi

# 検索ディレクトリが存在しない場合はエラーメッセージを表示して終了
if [ ! -d "$directory" ]; then
    echo "$0: ${directory}: No such directory" 1>&2
    exit 2
fi

find "$directory" -type f -print0 -name "$name"| xargs -0 grep -nH "$pattern"

