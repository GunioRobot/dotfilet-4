" === Plugin Preparation
" * Set up Vundle (see https://github.com/gmarik/vundle)
"   * git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"   * :BundleInstall
"
" === Plugin Cleaning
" * :BundleClean


" ----------------------------------------------------------------------
" Vundle
" ----------------------------------------------------------------------
set nocompatible " Use extended functions of Vim
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Vim Scripts repos (http://vim-scripts.org/vim/scripts.html)
" Dependency: (A -> B: A requires B)
"   FuzzyFinder -> L9
"   ecomba/vim-ruby-refactoring -> matchit.vim
Bundle 'AutoComplPop'
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'OOP-javascript-indentation'
Bundle 'cucumber.zip'
Bundle 'endwise.vim'
Bundle 'matchit.zip'
Bundle 'rails.vim'
Bundle 'surround.vim'
Bundle 'unite.vim'
Bundle 'yanktmp.vim'

" GitHub repos
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/zencoding-vim'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-scouter'
Bundle 'vim-ruby/vim-ruby'


" ----------------------------------------------------------------------
" File types
" ----------------------------------------------------------------------
filetype indent on " Indent depends on file type
filetype plugin on " Valid plugin


" ----------------------------------------------------------------------
" Character codes
" ----------------------------------------------------------------------
" http://www.kawaz.jp/pukiwiki/?vim#cb691f26
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
" TODO これ、うまく動かないんだよなぁ。。
if exists('&ambiwidth')
  set ambiwidth=double
endif

" ----------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------
" matchit
let b:match_words="<begin>:<end>"

" yanktmp
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr>
let g:yanktmp_file = '/tmp/yanktmp'


" ----------------------------------------------------------------------
" Space
" ----------------------------------------------------------------------
set tabstop=2    " Tab width
set shiftwidth=2 " Shift width
set expandtab    " Insert half space instead of tab


" ----------------------------------------------------------------------
" Statuses
" ----------------------------------------------------------------------
set laststatus=2 " Display status line always
set showcmd      " Show inputting command to status line

" Display character code and break to status line
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P


" ----------------------------------------------------------------------
" Searchings
" ----------------------------------------------------------------------
set incsearch
set ignorecase

" Find project
map fp :!grep -r --exclude-dir=log --exclude-dir=tmp --color=auto


" ----------------------------------------------------------------------
" Movings
" ----------------------------------------------------------------------
map bf :e # " Back to previous File
map bc `'   " Back to previous jumped Cursor


" ----------------------------------------------------------------------
" Highlights
" ----------------------------------------------------------------------
syntax on    " Enable highlights
set hlsearch " Highlight searched strings

" Highlight EOL space
highlight EOLSpace ctermbg=white
match EOLSpace /\s\+$/


" ----------------------------------------------------------------------
" Command Line
" ----------------------------------------------------------------------
" Emacs-like movings
:cnoremap <C-A> <Home>
:cnoremap <C-B> <Left>
:cnoremap <C-D> <Delete>
:cnoremap <C-F> <Right>
:cnoremap <C-K> <Delete>


" ----------------------------------------------------------------------
" Others
" ----------------------------------------------------------------------
set nonu         " Not display line numbers
set showmatch    " Show bracket pair
set hidden       " Buffer switchable with not-saved buffers
set scroll=1     " Set scroll number of ^u and ^d
set noswapfile   " Make no swap file

" Be careful: Input '^[' by '^V ['
map co 0i#j     " Comment Out and move to next line
map hco 0i-#j   " Haml Comment Out and move to next line

" Rename file
" Usage: On file you want to change, type :Rename [new_file_name]
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))|w

" After insert, automatically set nopaste
autocmd InsertLeave * set nopaste

" After these command, list shown, type an item, then jump to there
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin

noremap ; :
noremap : ;
