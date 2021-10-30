set nocompatible background=dark t_Co=256 termguicolors
set mouse=a encoding=UTF-8 backspace=indent,eol,start
set splitbelow splitright wrap linebreak whichwrap=b,s,<,>,[,]
set autoindent expandtab tabstop=4 softtabstop=0 shiftwidth=0 showmatch
set nobackup noswapfile undofile undodir=~/.vimundo
set display+=lastline history=1000 completeopt+=noselect
set incsearch hlsearch ignorecase smartcase signcolumn=yes
set updatetime=100 laststatus=2 updatetime=50 shortmess+=c fillchars+=vert:┃
set relativenumber number wildmenu lazyredraw noshowmode
set pastetoggle=<F10> completeopt=menuone,noselect cursorline
syntax on
filetype plugin indent on

" Download Plug if it it hasn't been downloaded
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('~/.config/nvim/autoload/plugged')

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colorschemes
Plug 'christianchiarulli/nvcode-color-schemes.vim'

" General plugins
Plug 'airblade/vim-rooter'
Plug 'ChristianChiarulli/dashboard-nvim'
Plug 'kevinhwang91/nvim-bqf'

" Tmuxline
Plug 'sainnhe/tmuxline.vim'

" Better tabs
Plug 'romgrk/barbar.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" Support for many languages
let g:polyglot_disabled = ['jsx', 'tsx', 'go']
Plug 'sheerun/vim-polyglot'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

" NERDTree
Plug 'preservim/nerdtree'

" NERDTree git
" Plug 'Xuyuanp/nerdtree-git-plugin'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" tpope's plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

" wakatime
Plug 'wakatime/vim-wakatime'

call plug#end()

lua << EOF
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header={
    '',
    '⡿⠋⠄⣀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣌⠻⣿⣿',
    '⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠹⣿',
    '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹',
    '⣿⣿⡟⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⢿⣿⣿⣿⣮⠛⣿⣿⣿⣿⣿⣿⡆',
    '⡟⢻⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣣⠄⡀⢬⣭⣻⣷⡌⢿⣿⣿⣿⣿⣿',
    '⠃⣸⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⣆⢹⣿⣿⣿⡈⢿⣿⣿⣿⣿',
    '⠄⢻⡇⠄⢛⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿⡆⠹⣿⣆⠸⣆⠙⠛⠛⠃⠘⣿⣿⣿⣿',
    '⠄⠸⣡⠄⡈⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠁⣠⣉⣤⣴⣿⣿⠿⠿⠿⡇⢸⣿⣿⣿',
    '⠄⡄⢿⣆⠰⡘⢿⣿⠿⢛⣉⣥⣴⣶⣿⣿⣿⣿⣻⠟⣉⣤⣶⣶⣾⣿⡄⣿⡿⢸',
    '⠄⢰⠸⣿⠄⢳⣠⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⣿⣿⣿⣿⣿⣿⡇⢻⡇⢸',
    '⢷⡈⢣⣡⣶⠿⠟⠛⠓⣚⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⠇⠘',
    '⡀⣌⠄⠻⣧⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠛⠛⢿⣿⣿⣿⣿⣿⡟⠘⠄⠄',
    '⣷⡘⣷⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⡋⢀⣠⣤⣶⣶⣾⡆⣿⣿⣿⠟⠁⠄⠄⠄⠄',
    '⣿⣷⡘⣿⡀⢻⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣿⣿⣿⣿⣷⡿⠟⠉⠄⠄⠄⠄⡄⢀',
    '⣿⣿⣷⡈⢷⡀⠙⠛⠻⠿⠿⠿⠿⠿⠷⠾⠿⠟⣛⣋⣥⣶⣄⠄⢀⣄⠹⣦⢹⣿',
    '',
    }

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    e = {description = {'  Settings           '}, command = ':e ~/.config/nvim/init.vim'}
}

vim.g.dashboard_custom_footer = {'simo.sh'}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "haskell" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.gopls.setup{
    capabilities = capabilities,
}

require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
}

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
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" Lightline
let g:lightline = {  'separator': { 'left': "\ue0b0", 'right': "\ue0b2" }, 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }}

" Tmuxline
let g:tmuxline_preset = "nightly_fox"
let g:tmuxline_powerline_separators = 0

" general vim vars
let loaded_matchparen = 1
let mapleader= "\<Space>"

" change tabs with <Space>+Number
nnoremap <silent><leader>1 :BufferGoto 1<CR>
nnoremap <silent><leader>2 :BufferGoto 2<CR>
nnoremap <silent><leader>3 :BufferGoto 3<CR>
nnoremap <silent><leader>4 :BufferGoto 4<CR>
nnoremap <silent><leader>5 :BufferGoto 5<CR>
nnoremap <silent><leader>6 :BufferGoto 6<CR>
nnoremap <silent><leader>7 :BufferGoto 7<CR>
nnoremap <silent><leader>8 :BufferGoto 8<CR>
nnoremap <silent><leader>9 :BufferLast<CR>
nnoremap <silent><leader>q :BufferClose<CR>

" Make Y behave like D
noremap Y y$

" clear search on Space + c
nnoremap <silent><Leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><F9>

" go back
noremap <silent>gb <C-o>

" control + S for save
nnoremap <silent><C-s> :w<CR>

" change tabs with Tab and Shift+Tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Quicker navigation between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remember cursor position after quitting
augroup remember-cursor
    au!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeGitStatusWithFlags = 1

nnoremap <Leader>f :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" custom colors
augroup custom-colors
    au!
    au ColorScheme * hi! clear SignColumn
augroup END

colorscheme nvcode
