" Plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Vi compatibility
set nocompatible
set backspace=indent,eol,start
set modelines=1

" Highlight
filetype plugin on
filetype indent on
syntax on
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

" Plugins
let mapleader=","
map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :TlistToggle<CR>

" Folding
map <Leader>fi :setlocal foldmethod=indent<CR>
map <Leader>fs :setlocal foldmethod=syntax<CR>
set foldmethod=indent

" Indent
set autoindent
set smartindent

" Tabs
set expandtab
set softtabstop=2
set shiftwidth=2

" Presentation
set cursorline
set nowrap
set number
set ruler

" Swap and temp file location
set backupdir=/tmp,.
set directory=/tmp,.

" Statusline
set laststatus=2
set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ %{strftime(\"%H:%M:%S\")}\ %{fugitive#statusline()}
