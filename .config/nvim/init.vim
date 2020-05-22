set title
set ruler
set showmatch
set ignorecase
set incsearch
set hlsearch
set bs=2
set nobackup
set nowritebackup
set noswapfile

set encoding=utf-8

set clipboard=unnamedplus

" make tab work as 4 spaces in a file
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

set splitbelow
set splitright

"" coc
"set cmdheight=1
"set updatetime=300
"set signcolumn=yes

let mapleader=" "
let maplocalleader=","

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'Guzzii/python-syntax'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'lambdalisue/suda.vim'
Plug 'thaerkh/vim-indentguides'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

Plug 'joshdick/onedark.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'chriskempson/vim-tomorrow-theme'

" airline
Plug 'vim-airline/vim-airline'
Plug 'khatiba/vim-airline-themes'

call plug#end()

filetype plugin indent on

" visual settings
syntax on
set relativenumber
set colorcolumn=80

" set termguicolors
colorscheme Tomorrow-Night-Bright
" colorscheme onedark
" hi Normal guibg=None
" hi EndOfBuffer guibg=None
highlight Comment gui=italic

" vim-airline
" let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
" let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
" let g:airline#extensions#syntastic#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc tab completion
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

map <C-n> :NERDTreeToggle<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Close buffer
noremap <C-c> <C-w>c

" hit esc to clear search
nnoremap <silent> <esc> :noh<cr><esc>

" leader R to replace word under *
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

"coc
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Folds {{{
set foldmethod=indent
set foldnestmax=2
set foldlevel=10 " Fold up most things on file open
autocmd User CocOpenFloat :setl foldlevel=20 foldcolumn=0
" }}}
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
let g:suda_smart_edit = 1
