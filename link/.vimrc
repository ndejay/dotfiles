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
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_termtrans=1
colorscheme solarized
set background=dark

" Plugins
let mapleader=","
map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :TlistToggle<CR>

" Folding
map <Leader>fi :setlocal foldmethod=indent<CR>
map <Leader>fs :setlocal foldmethod=syntax<CR>
set foldmethod=indent

" Shortcuts
map <Leader>sn :set invnumber<CR>
set pastetoggle=<Leader>sp
map <Leader>sw :set invwrap<CR>
map <Leader>sh :set invhls<CR>

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

" Comments
autocmd FileType r set commentstring=#\ %s

" Powerline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

" Vim training wheels
noremap  <Up>    <Nop>
noremap! <Up>    <Nop>
noremap  <Down>  <Nop>
noremap! <Down>  <Nop>
noremap  <Left>  <Nop>
noremap! <Left>  <Nop>
noremap  <Right> <Nop>
noremap! <Right> <Nop>

" Automatically reload vimrc when it's saved
" Source: http://www.vimbits.com/bits/128
au BufWritePost .vimrc so ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Absolute & relative numbers
" Source: http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set relativenumber

" Use absolute numbers when out of focus, and relative numbers otherwise
" :au FocusLost * :set number
" :au FocusGained * :set relativenumber

" Use absolute numbers when in insert mode, and relative numbers otherwise.
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrate Ag with vim and CtrlP
" Source: https://robots.thoughtbot.com/faster-grepping-in-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
