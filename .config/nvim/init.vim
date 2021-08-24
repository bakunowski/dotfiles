set ignorecase

set nobackup
set nowritebackup
set noswapfile

set nofixendofline

set hidden

set splitbelow
set splitright

set clipboard=unnamedplus

" make tab work as 4 spaces in a file
set tabstop=4
set softtabstop=4
set shiftwidth=4

set list listchars=nbsp:¬,tab:»·,trail:·,extends:>

set signcolumn=auto
set updatetime=300

set noshowmode

set mouse=a

set nofoldenable

let mapleader=" "
let maplocalleader=","

call plug#begin('~/.local/share/nvim/plugged')

" LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'

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
Plug 'blackCauldron7/surround.nvim'

" Better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Eyecandy
Plug 'hoob3rt/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'ap/vim-css-color'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Themes
Plug 'rktjmp/lush.nvim'
" Plug 'sjl/badwolf'
" Plug 'bakunowski/nvim-colours-github'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'shaunsingh/nord.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'briones-gabriel/darcula-solid.nvim'
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'lighthaus-theme/vim-lighthaus'
Plug 'fnune/base16-vim'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

" visual settings
set termguicolors
let g:gruvbox_flat_style = "hard"
colorscheme gruvbox-flat
" colorscheme acme
set relativenumber
set number
set colorcolumn=80

" Change indent character for indent-blankline plugin
" let g:indent_blankline_char="│"

" hi link LspSignatureActiveParameter Search
" highlight TSVariable guifg=#c5c8c6
" highlight TSProperty guifg=#de935f

" Jellybeans custom
" highlight VertSplit guifg=#151515 guibg=#151515
" highlight ColorColumn guibg=#1f1f1f
" highlight SignColumn guibg=#151515

" hi link TSComment Comment
" highlight TSComment gui=italic
" hi link TSField Directory

" -------------------------------------
"  Mappings
"  ------------------------------------

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

" aka multiple cursors
nnoremap <Leader>x *``cgn

map <F8> :setlocal spell! spelllang=en_gb<CR>

" compe
" inoremap <silent><expr> <C-n> compe#complete()

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <C-n> <cmd>Telescope file_browser<cr>
" TODO: add to lua config
nnoremap <leader>d <cmd>Telescope lsp_workspace_diagnostics<cr>

" map C-l to skip a char eg )
inoremap <C-l> <C-o>a

" luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap <C-n> :NvimTreeToggle<CR>
" -------------------------------------
"  LSP
"  ------------------------------------

function Refresh()
	lua vim.lsp.stop_client(vim.lsp.get_active_clients())
	sleep 500m
	edit
endfunction

command RefreshLSP call Refresh()

lua require('init')

" command to get syntax highlighting in a new buffer
" so $VIMRUNTIME/syntax/hitest.vim
