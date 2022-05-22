#!/bin/zsh

filename=$1

touch "$filename"
chmod +x "$filename"
echo '#!/bin/zsh' >> $filename