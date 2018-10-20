
call plug#begin('~/.vim/plugged')

" -- syntax theme
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'morhetz/gruvbox'
" -- dev icons
Plug 'ryanoasis/vim-devicons'

" -- vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" -- improve syntax color
Plug 'sheerun/vim-polyglot'

" -- snippets
Plug 'honza/vim-snippets'

" -- start page
Plug 'mhinz/vim-startify'

" -- code check
Plug 'scrooloose/syntastic'

" -- format
Plug 'Chiel92/vim-autoformat'

" -- code completion
Plug 'artur-shaik/vim-javacomplete2'
Plug 'airblade/vim-rooter'
Plug 'tomlion/vim-solidity'

" -- complete brackets, parentheses, ...
Plug 'jiangmiao/auto-pairs'

" -- nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

call plug#end()

" ************* editor configuration *************

filetype plugin on
filetype indent on
syntax on
set tabstop=4
set shiftwidth=4
set smarttab
set splitright
set nohlsearch
set autoread
set t_Co=16
set scrolloff=8

" ************* eye-candy configuration *************

" show line numbers
set nu
highlight LineNr ctermfg=26
highlight LineNr ctermbg=25

" colorscheme
set background=dark
colorscheme wal

"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif

"colorscheme base16-default-dark

" ************* Keymaps *************

let mapleader = " "

nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>c :NERDTreeToggle<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>p :tabprevious<CR>
nnoremap <leader>n :tabnext<CR>

" ************* JavaComplete configuration *************

autocmd FileType java setlocal omnifunc=javacomplete#Complete

" ************* Autoformat configuration *************

autocmd FileType vim,tex,xml let b:autoformat_autoindent=0

let blacklist = ['xml', 'conf']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :Autoformat

" c, c++
let g:formatdef_my_custom_clang = '"clang-format"'
let g:formatters_c = ['my_custom_clang']
let g:formatters_cpp = ['my_custom_clang']

" ************* Airline configuration *************

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'

" symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" extensions
let g:airline_extensions = ['tabline']
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" left sections
let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_b = airline#section#create(['%t'])
let g:airline_section_c = airline#section#create([])

" center
let g:airline_section_getter = ''

" right sections
let g:airline_section_x = ''
let g:airline_section_y = airline#section#create(['filetype'])
let g:airline_section_z = airline#section#create(['%3.3l'])
let g:airline_section_error = airline#section#create(['syntastic'])
let g:airline_section_warning = airline#section#create([''])


" tabline seperations
let g:airline#extensions#tabline#left_sep = 'î‚°'
let g:airline#extensions#tabline#left_alt_sep = 'î‚°'
let g:airline#extensions#tabline#right_sep = 'î‚²'
let g:airline#extensions#tabline#right_alt_sep = 'î‚²'

" tabline options
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0

" ************* YouCompleteMe configuration *************

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

" ************* Startify configuration *************

let g:startify_custom_header = [
			\"   _   _                   _            ",
			\"  | \\ | |                 (_)           ",
			\"  |  \\| | ___  _____   ___ _ __ ___   ",
			\"  | . ` |/ _ \\/ _ \\ \\ / / | '_ ` _ \\ ",
			\"  | |\\  |  __/ (_) \\ V /| | | | | | | ",
			\"  \\_| \\_/\\___|\\___/ \\_/ |_|_| |_| |_| ",
			\]

let g:startify_list_order = [
			\ ['  ---------  FICHIERS  ---------'],
			\ 'files',
			\ ['  ---------  SESSIONS  ---------'],
			\ 'sessions',
			\ ['  ---------  PROJETS  ---------'],
			\ 'bookmarks',
			\ ]

let g:startify_enable_special = 0
let g:startify_files_number = 5

" projets
let g:startify_bookmarks = [
			\ '~/Documents/Prog/mdata/'
			\ ]

" ************* Syntastic configuration *************

" basic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" disabled checkers
let g:syntastic_enable_latex_checker = 0
let g:syntastic_enable_tex_checker = 0
let g:syntastic_tex_checkers = []
let g:syntastic_enable_xml_checker = 0

" checker ---- C
let g:syntastic_c_checkers = ["clang_tidy"]

" checker ---- C++
let g:syntastic_cpp_checkers = ["clang_check"]

" ************* NERDTree configuration *************

autocmd VimEnter *
                \   if !argc()
                \ |   Startify
				\ |   execute 'NERDTreeTabsOpen'
                \ |   wincmd w
\ | endif

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_synchronize_view = 0
