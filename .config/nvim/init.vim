" --- General -- "
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set termguicolors
set mouse=a
set autowrite
set background=dark
set t_Co=256
set encoding=UTF-8
set backspace=indent,eol,start
set splitbelow splitright
set wrap
set linebreak
set whichwrap=b,s,<,>,[,]
set relativenumber
set number
set wildmenu
set lazyredraw
set autoindent
set expandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set shiftwidth=4
set showmatch
set nobackup
set noswapfile
set display+=lastline
set history=1000
set listchars=tab:│·,trail:_
set incsearch
set hlsearch
set ignorecase
set smartcase
set updatetime=100
set laststatus=2
set noshowmode
set updatetime=300
set shortmess+=c
set signcolumn=yes
set fillchars+=vert:┃

syntax on
filetype plugin indent on

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'kaicataldo/material.vim'
Plug 'honza/vim-snippets'
Plug 'sainnhe/tmuxline.vim'
Plug 'wakatime/vim-wakatime'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() } }
Plug 'Shougo/echodoc.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'airblade/vim-gitgutter' 
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'alvan/vim-closetag'
Plug 'Shougo/denite.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/plugged/gocode/vim/symlink.sh' }
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
call plug#end()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

hi Comment cterm=italic
hi! GitGutterAdd ctermbg=NONE
hi! GitGutterChange ctermbg=NONE
hi! GitGutterDelete ctermbg=NONE
hi! GitGutterChangeDelete ctermbg=NONE

let mapleader=' '
let base16colorspace=256 

let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let g:NERDTreeHighlightCursorline=0

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

let g:polyglot_disabled = ['jsx', 'tsx']

let g:lightline = { 'colorscheme': 'material_vim' }

let g:material_theme_style='darker'
let g:material_terminal_italics = 1

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'
let g:gitgutter_override_sign_column_highlight = 0

let g:tmuxline_preset = "powerline"
let g:tmuxline_powerline_separators = 0

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = { 'typescript.tsx': 'jsxRegion,tsxRegion', 'javascript.jsx': 'jsxRegion' }

nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <leader>. :lcd %:p:h<CR>
nnoremap <C-s> :w<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap ; :
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <F8> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><F9>
nnoremap <silent> K :call <SID>show_documentation()<CR>
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>g :Goyo<CR>:Limelight!!<CR>
noremap <Leader>0 :NERDTreeFocus<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap <silent> gb <C-o>
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>" 
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>
noremap Y y$
noremap <C-p> "+P
vnoremap <C-c> "+y
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

if argc() == 0
    autocmd VimEnter * NERDTree
end
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufEnter * :syntax sync fromstart
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd Filetype man nnoremap <buffer> u <C-u>
autocmd Filetype man nnoremap <buffer> d <C-d>
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

augroup vimrc-remember-cursor-position
  autocmd!
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END"`'")"'"

colorscheme material
