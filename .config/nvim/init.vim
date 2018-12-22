"                                      .:.                                      
"                  ##############   .:::::::.     ##############                
"                  ############## ::::::::::::.   ##############                
"                    ########## :::::::::::::::::   ##########                  
"                    ########## ::::::::::::::::: #########                     
"                    ########## ::::::::::::::: #########                       
"                    ########## ::::::::::::: ######## :                        
"                    ########## ::::::::::: ######## :::::.                     
"                  . ########## ::::::::: ######## :::::::::.                   
"                .:: ########## :::::: ######## :::::::::::::::.                
"               `::: ########## :::: ######## ::::::::::::::::::`               
"                 `: ########## :: #####****::::::::::::::::::`                 
"                    ##########  ###### ####;:::::::::::::::`                   
"                    #################  ****;:::::::::::::`                     
"                    ############### ::####:::####:::####  ####                 
"                    ############# :::####:::##################                 
"                    ########### :::::####:::####:` ####  ####                  
"                    #########  `::::####:::####`  ####  ####                   
"                    #######      `::####:::####   ####  ####                   
"                    ####           ####:::####   ####  ####                    
"                                      `:`                                      


" --- General -- "
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set termguicolors

" let base16colorspace=256 
" set t_Co=256

" make leader the spacebar key
let mapleader = " "

" Default encoding
set encoding=UTF-8

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Wrap text in a nice way
set wrap
set linebreak

" Traverse line breaks
set whichwrap=b,s,<,>,[,]

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show relative numbers
set relativenumber
set number

" Visual autocomplete for commands
set wildmenu

" Redraw only when necessary
set lazyredraw

" Set tabs to have 4 spaces
set tabstop=4
set softtabstop=4

" Indent when moving to the next line while writing code
set autoindent

" Expand tabs into spaces
set expandtab

" When using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" Show the matching part of the pair for [] {} and ()
set showmatch

" Always show at least one line below/above the cursor
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" Show as much as you can before showing several '@'
set display+=lastline

" Bigger history for commands and searches
set history=1000

" Show tabs
set listchars=tab:│·,trail:_


"--- General Keybindings ---"

" Better moving between windows
nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use <F9> to clear the highlighting of :set hlsearch.
if maparg('<F8>', 'n') ==# ''
    nnoremap <silent> <F8> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><F9>
endif


"--- Searching ---"

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Better searching
set ignorecase
set smartcase


"--- Plugins ---"

" Enable plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List plugins below this
call plug#begin('~/.config/nvim/autoload/plugged')

" Snippets
"
Plug 'honza/vim-snippets'


" Support for a lot of languages
Plug 'sheerun/vim-polyglot'

" vimwiki
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" Fancy directory viewer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Nice colorschemes that fit with base16-shell
Plug 'chriskempson/base16-vim'

" Add git glyphs on the gutter column
Plug 'airblade/vim-gitgutter'

" Add support for hundreds of languages
Plug 'sheerun/vim-polyglot'

" Autocompletion
Plug 'maralla/completor.vim'

" Check syntax while writing
Plug 'scrooloose/syntastic'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Very light and customizable staus line
Plug 'itchyny/lightline.vim'

" Fancy icons
Plug 'ryanoasis/vim-devicons'

" Minimalist, distraction-free writing mode
Plug 'junegunn/goyo.vim'

" Automatically close paranthesis, brackets, quotes, etc.
Plug 'jiangmiao/auto-pairs'

" Add, modify, or delete parenthesis, brackets, quotes, etc.
Plug 'tpope/vim-surround'

" Allow more complex commands to be repeteable
Plug 'tpope/vim-repeat'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Better alignment
Plug 'godlygeek/tabular'

" SublimeText-like multiple selection
Plug 'terryma/vim-multiple-cursors'

" JavaScript support
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'jsx', 'yaml', 'html'] }

" Markdown support
Plug 'reedes/vim-pencil'
Plug 'godlygeek/tabular',                 { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }

" HTML support 
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" CSS support
Plug 'hail2u/vim-css3-syntax',  

" Ale
Plug 'w0rp/ale'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/plugged/gocode/vim/symlink.sh' }

Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'

" Initialize plugin system
call plug#end()

"- Nerdtree -"
" Toggle nerdtree with F10
map <F9> :NERDTreeToggle<CR>

"- Base16 -"
" Access colors present in 256 colorspace

"- Git-Gutter -"
" Better glyphs
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'
let g:gitgutter_override_sign_column_highlight = 0

" Removing background for a e s t h e t i c s
hi! GitGutterAdd ctermbg=NONE
hi! GitGutterChange ctermbg=NONE
hi! GitGutterDelete ctermbg=NONE
hi! GitGutterChangeDelete ctermbg=NONE

" Update changes faster
set updatetime=100

"- Completor -"
" Make autocompletion behave sanely
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

"- Syntastic -"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_loc_list_height = 6
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '✖'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '!'

" Linters
let g:syntastic_python_checkers = [ 'flake8', 'pep8', 'pycodestyle', 'pyflakes' ]
let g:syntastic_c_checkers = [ 'gcc', 'make', 'clang_check', 'flawfinder' ]
let g:syntastic_go_checkers = [ 'go', 'golint', 'gofmt', 'gometalinter', 'govet' ]

" C
let g:syntastic_c_compiler_options = "-fno-builtin -Wno-incompatible-library-redeclaration -Wno-gnu-designator -Wno-pointer-to-int-cast" " For working with xv6

"- Lightline -"
" Always show status line
set laststatus=2

" Get rid of the ugly default status line
set noshowmode


" Customizations
" colorscheme wal

" Syntastic stuff
augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp,*.py call s:syntastic()
    augroup END

function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

let g:syntastic_mode_map = { 
      \ 'mode': 'passive',
      \ 'active_filetypes': [ 'c', 'cpp', 'python', 'fish' ] }

" Custom functions
function! MyFiletype()
  return winwidth(0) > 30 ? (strlen(&filetype) ? toupper(&filetype) : '?') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 30 ? &fileformat : ''
endfunction

function! MyGitBranch()
    return winwidth(0) > 30 && fugitive#head() != '' ? (' ' . fugitive#head()) : ''
endfunction

"- Markdown -"
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1


"--- Misc ---"

autocmd Filetype man nnoremap <buffer> u <C-u>
autocmd Filetype man nnoremap <buffer> d <C-d>

" Remove background
hi LineNr ctermbg=NONE
hi SignColumn ctermbg=NONE
hi VertSplit ctermbg=NONE
hi CursorLineNr ctermbg=NONE
hi CursorLineNr ctermfg=7

" Set wildmenu colors
hi WildMenu ctermbg=12
hi WildMenu ctermfg=21
hi StatusLine ctermbg=18

" Nicer vertical separators
set fillchars+=vert:┃

" Make comments italiced
hi Comment cterm=italic

" Enable all Python syntax highlighting features
let python_highlight_all = 1

source ~/.config/nvim/colorscheme.vim
