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

" make tab work as 4 spaces in a file
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set autoindent
"set shiftround

let mapleader=" "
let localleader=","

call plug#begin('~/.local/share/nvim/plugged')

Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'
Plug 'itchyny/calendar.vim'

" matlab
Plug 'daeyun/vim-matlab'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'thaerkh/vim-indentguides'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'

"themes
Plug 'tomasr/molokai'
Plug 'owickstrom/vim-colors-paramount'
Plug 'chriskempson/base16-vim'

"can use ctr-n and ctr-p instead!
"Plug 'ervandew/supertab'

call plug#end()

" visual settings
syntax on
set ruler
set number

set termguicolors

colorscheme base16-chalk

let g:rehash256 = 1
set t_Co=256

" netrw config
let g:netrw_banner=0
let g:netrw_liststyle=3

let python_highlight_all = 1

" vimtex
let g:vimtex_view_method = 'zathura'

" calendar
let g:calendar_google_calendar = 1
let g:calendar_date_full_month_name = 1
let g:calendar_event_start_time_minwidth = 0

" vim-airline
let g:airline_theme = 'base16_chalk'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

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
let g:org_aggressive_conceal = 1
let g:org_indent = 1

" Tabs
"nnoremap <silent> <S-t> :tabnew<CR>
"nnoremap <Tab>   gt
"nnoremap <S-Tab> gT

" Switching windows
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
" noremap <C-h> <C-w>h

" Close buffer
" noremap <C-c> <C-w>c

" Split
" noremap <C-s> :<C-u>split<CR>
" noremap <C-v> :<C-u>vsplit<CR>
