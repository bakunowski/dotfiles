set title

set showmatch
set ignorecase
set incsearch
set hlsearch
set bs=2
set nobackup
set noswapfile

set clipboard=unnamed
set encoding=utf-8

set tabstop=8
set shiftwidth=4
set shiftround
set autoindent

let maplocalleader=" "

call plug#begin('~/.local/share/nvim/plugged')

Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'
Plug 'itchyny/calendar.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'thaerkh/vim-indentguides'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'

"themes
Plug 'jaredgorski/spacecamp'
Plug 'tomasr/molokai'
Plug 'lucasprag/simpleblack'

"can use ctr-n and ctr-p instead!
"Plug 'ervandew/supertab'

call plug#end()

" visual settings
syntax on
set ruler
set number

set termguicolors
colorscheme molokai

set t_Co=256
let g:rehash256 = 1

" netrw config
let g:netrw_banner=0
let g:netrw_liststyle=3

" vimtex
let g:vimtex_view_method = 'zathura'

" calendar
let g:calendar_google_calendar = 1
let g:calendar_date_full_month_name = 1
let g:calendar_event_start_time_minwidth = 0

" airline
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1


" indent
let g:indentguides_spacechar = '|'
let g:indentguides_tabchar = '┆'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" orgmode
nmap <S-l> <Plug>OrgTodoForward
nmap <S-h> <Plug>OrgTodoBackward
nmap <S-k> <Plug>OrgMoveSubtreeUpward
nmap <S-j> <Plug>OrgMoveSubtreeDownward

" Tabs
nnoremap <silent> <S-t> :tabnew<CR>
