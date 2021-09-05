call plug#begin('~/.local/share/nvim/plugged')

" LSP support
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Go tests
Plug 'buoto/gotests-vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Comments with one keybinding
Plug 'tpope/vim-commentary'

" Parantheses
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'

" Better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Tree view
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Eyecandy
Plug 'hoob3rt/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'wfxr/minimap.vim'

Plug 'sainnhe/sonokai'
Plug 'shaunsingh/nord.nvim'
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'briones-gabriel/darcula-solid.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'mcchrish/zenbones.nvim'


call plug#end()

let mapleader=" "
let maplocalleader=";"

" Basic settings
set nofixendofline              " If there isn't an empty line at EOF don't insert it
set hidden                      " Allow buffers to be backgrounded without being saved
set splitbelow                  " Splits show up below by default
set splitright                  " Splits go to the right by default
set clipboard=unnamedplus       " Yank to system cliboard
set mouse=a                     " Enable mouse support

" Search settings
set ignorecase
set smartcase

" Tab settings
set expandtab                   " Expand tabs to the proper type and size
set tabstop=4                   " Tabs width in spaces
set softtabstop=4               " Soft tab width in spaces
set shiftwidth=4                " Amount of spaces when shifting

" GUI settings
set relativenumber
set number
set colorcolumn=80              " Highlight 80 character limit
set signcolumn=auto             " How to display gitgutter signs next to numbers column
set noshowmode                  " Don't show current mode in status line
set scrolloff=10
set list                        " Always show invisible characters
set listchars=tab:\|\ ,trail:⋅  " Set the characters for the invisibles
set termguicolors               " Use 24-bit RGB color in terminal
set pumheight=10

colorscheme darcula-solid
highlight Normal guibg=#1e1e1e
hi! link NormalNC Normal
highlight VertSplit guifg=#262627
hi link LspSignatureActiveParameter Search
hi! link NvimTreeNormal Normal
hi! link NvimTreeFolderName Question
hi! link NvimTreeOpenedFolderName Question
hi! link NvimTreeEmptyFolderName Question

" Treat Jenkinsfile as a java file type for treesitter
augroup filetypedetect
    autocmd BufRead,BufNewFile *Jenkins* set filetype=groovy
augroup END

" let g:gruvbox_flat_style = "hard"
" colorscheme gruvbox-flat

" -------------------------------------
"  Mappings
" ------------------------------------

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Close buffer
noremap <C-c> <C-w>c

" Make j/k visual down and up instead of whole lines. This makes word
" wrapping a lot more pleasent.
map j gj
map k gk

" hit esc to clear search
nnoremap <silent> <esc> :noh<cr><esc>

" leader R to replace word under *
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" aka multiple cursors
nnoremap <Leader>x *``cgn

map <F8> :setlocal spell! spelllang=en_gb<CR>

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" TODO: add to lua config
nnoremap <leader>d <cmd>Telescope lsp_workspace_diagnostics<cr>

" map C-l to skip a char eg. )
inoremap <C-l> <C-o>a

" luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap <C-n> :NvimTreeToggle<CR>

lua require('init')

" command to get syntax highlighting in a new buffer
" so $VIMRUNTIME/syntax/hitest.vim
