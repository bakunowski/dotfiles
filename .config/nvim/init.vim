set ignorecase

set nobackup
set nowritebackup
set noswapfile

set hidden

set splitbelow
set splitright

set clipboard=unnamedplus

set tabstop=4
set softtabstop=4
set shiftwidth=4


set signcolumn=number
set updatetime=300

" set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set completeopt=menu,menuone,noselect
let mapleader=" "
let maplocalleader=","

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'tpope/vim-commentary'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'

Plug 'lambdalisue/suda.vim'
" Plug 'thaerkh/vim-indentguides'

"themes
Plug 'chrisduerr/vim-undead'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'bakunowski/nvim-colours-github'

" airline
" Plug 'vim-airline/vim-airline'

call plug#end()

let g:airline_left_sep=''
let g:airline_right_sep=''

filetype plugin indent on

" visual settings
syntax enable
set relativenumber
set number
" set colorcolumn=80
" set background=dark
" set t_Co=256

set termguicolors
colorscheme acme
" colorscheme github
" colorscheme base16-tomorrow-night
" colorscheme gruvbox
" colorscheme undead
" colorscheme badwolf
" hi Normal guibg=None
" hi EndOfBuffer guibg=None
" highlight Comment gui=italic

" vim-airline
let g:airline_powerline_fonts = 1
" let g:airline_theme='minimalist'
let g:airline_theme='undead'
" let g:airline_solarized_bg='dark'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#syntastic#enabled = 1

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

imap <C-l> <Plug>delimitMateS-Tab
let delimitMate_expand_cr = 1
inoremap <silent><expr> <C-p> compe#complete()

""coc
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

"" Folds {{{
"set foldmethod=indent
"set foldnestmax=2
"set foldlevel=10 " Fold up most things on file open
"autocmd User CocOpenFloat :setl foldlevel=20 foldcolumn=0
"" }}}
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"let g:suda_smart_edit = 1

"" Snippet fill for coc.vim
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"let g:coc_snippet_next = '<tab>'

autocmd BufWritePre *.go lua vim.lsp.buf.formatting(nil, 1000)
lua << EOF
local nvim_lsp = require('lspconfig')

nvim_lsp.gopls.setup{}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup{
  capabilities = capabilities,
}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#454740
      hi LspReferenceText cterm=bold ctermbg=red guibg=#454740
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#454740
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "gopls", "html" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
EOF
