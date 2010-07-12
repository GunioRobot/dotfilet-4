filetype on " ファイル形式の検出をする
filetype indent on " ファイル形式別のインデントをする

set encoding=utf-8 " デフォルトの文字コード
set fileencodings=utf-8,eucjp,iso2022jp " 自動判別用の文字コード

set tabstop=2 " タブ幅
set shiftwidth=2 " シフトで移動する幅
set expandtab " タブの代わりに半角スペース
set nu " 行番号
set showmatch " 対応する括弧を表示
set laststatus=2
set showcmd " 入力中のコマンドをステータスに表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P " ステータスラインに文字コードと改行文字を表示
set hid " 編集中の内容を保持して別の画面に切り替える 

syntax on " シンタックスハイライトを有効にする
set hlsearch " 検索結果の文字列をハイライトする

" ※注意　^[ は ^V [ と入力している。文字のコピーだと動かない！
map co 0i#j " コメントアウトして次の行に移動
