#!/bin/sh

# Shift + k で、PHPマニュアルを表示するにはPHPマニュアルHTMLファイルと設定が必要です。

# 設定 ~/.vimrc
# let g:ref_phpmanual_path = $HOME . '/.vim/data/vim-ref/php-chunked-xhtml/'

# PHPマニュアルファイルを取得+解凍
cd ~/.vim/data/vim-ref/
wget 'http://jp.php.net/get/php_manual_ja.tar.gz/from/jp1.php.net/mirror'
[ -f mirror ] && mv mirror php_manual_ja.tar.gz
[ -f php_manual_ja.tar.gz ] && tar zxvf php_manual_ja.tar.gz || echo "php_manual_ja.tar.gz File does not exists"
[ -f php_manual_ja.tar.gz ] && rm -f php_manual_ja.tar.gz
