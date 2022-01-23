call plug#begin()

" LSP
Plug 'neovim/nvim-lspconfig'

" Treesitter
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Rust Analyzer
Plug 'simrat39/rust-tools.nvim'

" Code completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Color Theme
"Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
"Plug 'folke/twilight.nvim'

" Indent helper lines
"Plug 'lukas-reineke/indent-blankline.nvim'

" File finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Use telescope for UI selection
Plug 'nvim-telescope/telescope-ui-select.nvim'

" Lua Line with icons
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Troubleshooter
"Plug 'folke/trouble.nvim'

" Code action lens
Plug 'kosayoda/nvim-lightbulb'

" Start screen
Plug 'mhinz/vim-startify'

" Keybinding helper
Plug 'folke/which-key.nvim'

" Closing brackets
Plug 'jiangmiao/auto-pairs'

" Tabs
Plug 'kdheepak/tabline.nvim'

" Git
Plug 'TimUntersberger/neogit'

" File watcher for Cargo.toml
Plug 'rktjmp/fwatch.nvim'

" Speed
Plug 'lewis6991/impatient.nvim'

call plug#end()

" Theme
if (has("termguicolors"))
 set termguicolors
endif
" Enable bold/italic fonts
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
" Fix transparency
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" Disable history popup
nnoremap q: <nop>
nnoremap Q <nop>

" Save
nnoremap <C-s> <cmd>w<cr>
inoremap <C-s> <esc><cmd>w<cr>

" File finder keybinds
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Tab navigation
nnoremap <leader>] <cmd>TablineBufferNext<cr>
nnoremap <leader>[ <cmd>TablineBufferPrevious<cr>
nnoremap <leader>o <cmd>TablineTabNew<cr>

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

" Troubleshooter keybindings
"nnoremap <leader>xx <cmd>TroubleToggle<cr>
"nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
"nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
"nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
"nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
"nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" File tree keybindings
"nnoremap <C-n> :NvimTreeToggle<CR>
"nnoremap <leader>r :NvimTreeRefresh<CR>
"nnoremap <leader>n :NvimTreeFindFile<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Line numbering
set number relativenumber

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Autoformatting
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 500)

let s:startify_ascii_header = [
 \ '                                        ▟▙            ',
 \ '                                        ▝▘            ',
 \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \]
let g:startify_custom_header = map(s:startify_ascii_header +
        \ startify#fortune#quote(), '"   ".v:val')

" Lua setup
lua<<EOF
-- Must be first!
require('impatient')

require('lualine').setup({
	options = {
		icons_enabled = true
	}
})

require('tabline').setup({
	options = {
		show_devicons = true,
		show_tabs_always = true
		--show_bufnr = true
	}
})

local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('ui-select')

--require('nvim-treesitter.configs').setup({
--	ensure_installed = 'maintained',
--	highlight = {
--		enable = true
--	}
--})

require('which-key').setup({})
require('neogit').setup({})
require('nvim-lightbulb').update_lightbulb({})

--require('trouble').setup({})

--require('indent_blankline').setup({})

--require('twilight').setup({})

--require('nvim-tree').setup()

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local nvim_lsp = require('lspconfig')
local rust_opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}
require('rust-tools').setup(rust_opts)

-- Reload cargo when toml changes
require('fwatch').watch("Cargo.toml", {
	on_event = vim.schedule_wrap(function()
		vim.api.nvim_command("CargoReload")
	end)
})

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require('cmp')
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

