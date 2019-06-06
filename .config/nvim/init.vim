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
set background=light
set mouse=a

let base16colorspace=256 
set t_Co=256

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

" Indent when moving to the next line while writing code
set autoindent

" Expand tabs into spaces
set expandtab

" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" When using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" Show the matching part of the pair for [] {} and ()
set showmatch

" Prevent swap files
set nobackup
set noswapfile


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
Plug 'honza/vim-snippets'

" Support for a lot of languages
Plug 'sheerun/vim-polyglot'

" vimwiki
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" Fancy directory viewer
Plug 'scrooloose/nerdtree'

" Nice colorschemes that fit with base16-shell
Plug 'chriskempson/base16-vim'

" Cute colorscheme
Plug 'nightsense/snow'

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
" Airline (bar at the bottom)
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Vim Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Integration between Vim and its environment
Plug 'Shougo/vimshell.vim'

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
Plug 'leafgarland/typescript-vim'

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
let g:airline_powerline_fonts = 1

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
" set laststatus=2

" Get rid of the ugly default status line
set noshowmode


" Customizations
colorscheme snow

" Syntastic stuff
augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp,*.py call s:syntastic()
augroup END

" Indentation rules
augroup vimrc-javascript
      autocmd!
        autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
        autocmd FileType typescript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
        autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
        autocmd FileType jsx set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
        autocmd FileType tsx set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
        autocmd FileType less set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
        autocmd FileType scss set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
        autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
        autocmd FileType css set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
      augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
      autocmd!
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
        augroup END"`'")"'")

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

" Makes scorlling in manpages easier
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

" Map leader to space
let mapleader=' '

" Adds x11 clipboard shortcuts
vnoremap <C-c> "+y
map <C-p> "+P

autocmd vimenter * NERDTree

" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>
noremap <Leader>0 :NERDTreeFocus<CR>

" Session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>" 

" Open current line on GitHub
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

" let g:airline_theme='snow_light'

colorscheme base16-gruvbox-dark-soft

" source ~/.config/nvim/colorscheme.vim
