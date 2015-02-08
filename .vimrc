" Vundle required settings
set shell=/bin/bash
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()

filetype plugin indent on

" Vim settings
syntax enable
set listchars=tab:▸—
set nowrap
set number
set relativenumber

" Custom key bindings
" map <C-n> :NERDTreeToggle<CR>
map <C-k> <plug>NERDTreeTabsToggle<CR>

" Plugin vim-gitgutter
let g:gitgutter_sign_column_always=1
highlight clear SignColumn
highlight link GitGutterAdd SignColumn
highlight link GitGutterChange SignColumn
highlight link GitGutterDelete SignColumn

" Plugin neocomplcache
let g:neocomplcache_enable_at_startup=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugin NERDTree
let g:NERDTreeShowHidden=1

" Plugin NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=1

