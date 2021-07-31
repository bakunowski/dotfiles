set ignorecase

set nobackup
set nowritebackup
set noswapfile

set hidden

set splitbelow
set splitright

set clipboard=unnamedplus

" make tab work as 4 spaces in a file
set tabstop=4
set softtabstop=4
set shiftwidth=4

" set list listchars=nbsp:¬,tab:»·,trail:·,extends:>

" so $VIMRUNTIME/syntax/hitest.vim

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

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Go tests
Plug 'buoto/gotests-vim'
" Plug 'fatih/vim-go'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Comments with one keybinding
Plug 'tpope/vim-commentary'

" File navigation
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Parantheses closing
" Plug 'Raimondi/delimitMate'
Plug 'windwp/nvim-autopairs'

" Better syntax highlighting
Plug 'hashivim/vim-terraform'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Plug 'plasticboy/vim-markdown'

" Eyecandy
Plug 'hoob3rt/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'sjl/badwolf'
" Plug 'bakunowski/nvim-colours-github'
" Plug 'projekt0n/github-nvim-theme'
Plug 'cocopon/iceberg.vim'
Plug 'tanvirtin/monokai.nvim'
" Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'

call plug#end()

" visual settings
set relativenumber
set number
" syntax off
set termguicolors
colorscheme acme
" colorscheme github_mid
" colorscheme github
highlight Comment cterm=italic gui=italic
" highlight Normal guibg=none
set colorcolumn=80

" Change some colour groups for lsp
" hi! link LspDiagnosticsDefaultError WarningMsg
" highlight! link FloatBorder NormalFloat

" hi! link LspReferenceText TabLine
" hi! link LspReferenceRead TabLine
" hi! link LspReferenceWrite TabLine

" hi! link NormalFloat SpecialKey
" hi! link Pmenu SpecialKey

" ChangeBackground changes the background mode based on macOS's `Appearance`
" setting. We also refresh the statusline colors to reflect the new mode.
" function ChangeBackground()
"   if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
"     " set background=dark   " for the dark version of the theme
" 	colorscheme nord
"   else
"     " set background=light  " for the light version of the theme
" 	colorscheme karol
"   endif
" endfunction

" " initialize the colorscheme for the first run
" call ChangeBackground()

" " change the color scheme if we receive a SigUSR1
" autocmd FocusGained * call ChangeBackground()

" command ChangeBackground call ChangeBackground()

" Setup customised tab lengths for different files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal ts=8 sts=8 sw=8 expandtab

" -------------------------------------
"  Plugin Settings
"  ------------------------------------
" Telescope
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Nvim tree
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" ctrlp
" set wildignore+=*/node_modules/*
" set wildignore+=*/venv/*

" remap S-Tab from delimitMate
" imap <C-l> <Plug>delimitMateS-Tab
" let delimitMate_expand_cr = 1
" let delimitMate_expand_space = 1

" nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

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

" Change completion items with C-j and C-k
" inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" aka multiple cursors
nnoremap <Leader>x *``cgn

map <F8> :setlocal spell! spelllang=en_gb<CR>

" -------------------------------------
"  Completion
"  ------------------------------------

" Set completeopt to have a better completion experience
" set completeopt=menuone,noselect

" Avoid showing extra message when using completion
" set shortmess+=c

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" -------------------------------------
"  LSP
"  ------------------------------------

set conceallevel=3
set pumheight=15

" get rid of weird lines in hover window for LSP
" highlight! link mkdLineBreak NONE
" highlight! link goSpaceError NONE

" Format these files on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.yaml lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.yml lua vim.lsp.buf.formatting_sync(nil, 1000)

function Refresh()
	lua vim.lsp.stop_client(vim.lsp.get_active_clients())
	sleep 500m
	edit
endfunction

command RefreshLSP call Refresh()

" -------------------------------------
"  Lua
"  ------------------------------------

" highlight lua below
let g:vimsyn_embed= 'l'

lua << EOF
local nvim_lsp = require 'lspconfig'
nvim_lsp.gopls.setup{
settings = {
  gopls = {
	linksInHover = false
    },
  },
}

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references

	-- Mappings.
	local opts = { noremap=true, silent=true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	--buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
			" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
			" autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()

			augroup lsp_document_highlight
				autocmd!
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]], false)
	end
end

require "lsp_signature".on_attach({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "single"
  }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "gopls", "terraformls", "vimls", "dockerls", "vuels", "tsserver", "yamlls", "pyright" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			-- disable showing links in floating windows for gopls
			gopls = {
  			  linksInHover = false 
  			  },
  			},
		flags = {
			debounce_text_changes = 150,
			}
		}
end

require'nvim-treesitter.configs'.setup {
	ensure_installed = {"go", "comment", "python", "hcl", "yaml" },
	highlight = {
		enable = true,
		disable = { "c", "rust", "vim" },
	},
	playground = {
	    enable = true,
	    disable = {},
	    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
	    persist_queries = false, -- Whether the query persists across vim sessions
	    keybindings = {
	      toggle_query_editor = 'o',
	      toggle_hl_groups = 'i',
	      toggle_injected_languages = 't',
	      toggle_anonymous_nodes = 'a',
	      toggle_language_display = 'I',
	      focus_language = 'f',
	      unfocus_language = 'F',
	      update = 'R',
	      goto_node = '<cr>',
	      show_help = '?',
	    },
	},
}

function getLuaLineTheme()
	local colors = {
	  black        = '#101010',
	  yellow       = '#ffffea',
	  blackest	   = '#000000',
	  gray         = '#aeeeee',

	  red          = '#f5eaff',
	  green        = '#b8bb26',
	  blue         = '#83a598',
	  darkgray     = '#3c3836',
	  lightgray    = '#504945',
	}
	return {
	  normal = {
	    a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
	    b = {bg = colors.gray, fg = colors.black},
	    c = {bg = colors.gray, fg = colors.black}
	  },
	  insert = {
	    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
	    b = {bg = colors.gray, fg = colors.black},
	    c = {bg = colors.gray, fg = colors.black}
	  },
	  visual = {
	    a = {bg = colors.black, fg = colors.black, gui = 'bold'},
	    b = {bg = colors.gray, fg = colors.black},
	    c = {bg = colors.gray, fg = colors.black}
	  },
	  replace = {
	    a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
	    b = {bg = colors.gray, fg = colors.black},
	    c = {bg = colors.gray, fg = colors.black}
	  },
	  command = {
	    a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
	    b = {bg = colors.gray, fg = colors.black},
	    c = {bg = colors.gray, fg = colors.black}
	  },
	  inactive = {
	    a = {bg = colors.yellow, fg = colors.blackest, gui = 'bold'},
	    b = {bg = colors.yellow, fg = colors.blackest},
	    c = {bg = colors.yellow, fg = colors.blackest}
	  }
	}
end

require('lualine').setup {
  options = {
    --theme = 'nord',
	theme = getLuaLineTheme(),
	section_separators = '',
	component_separators = ''
	},
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = {
        'filename',
        {'diagnostics', sources = {'nvim_lsp'}, sections = {'error', 'warn'}},
        'diff',
      },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  extensions = {'nvim-tree'},
  }

require('nvim-autopairs').setup({
	fast_wrap = {
		map = '<C-e>',
	},
})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Compe setup
require'compe'.setup {
  source = {
    path = true;
    nvim_lsp = true;
    luasnip = true;
    buffer = true;
    ultisnips = false;
    calc = false;
    nvim_lua = false;
    vsnip = false;
  };
}

--vim.cmd[[highlight! link NormalFloat Normal]]

vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single"
  }
)

--require('github-theme').setup({
--	--hideInactiveStatusline = false,
--	--darkSidebar = false,
--	--darkFloat = true,
--	--themeStyle = "dimmed"
--	themeStyle = "light"
--})

EOF
