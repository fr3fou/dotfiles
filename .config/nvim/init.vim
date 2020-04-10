" --- General -- "
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible termguicolors mouse=a autowrite background=dark t_Co=256 encoding=UTF-8 backspace=indent,eol,start splitbelow splitright wrap linebreak whichwrap=b,s,<,>,[,] undofile undodir=~/.vimundo
set autoindent expandtab tabstop=4 softtabstop=0 shiftwidth=0 expandtab showmatch nobackup noswapfile display+=lastline history=1000 listchars=tab:│·,trail:_ incsearch hlsearch 
set ignorecase smartcase updatetime=100 laststatus=2 noshowmode updatetime=300 shortmess+=c signcolumn=yes fillchars+=vert:┃ relativenumber number wildmenu lazyredraw list completeopt+=noselect

syntax on
filetype plugin indent on

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'kaicataldo/material.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhinz/vim-janah'
Plug 'airblade/vim-rooter'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'sainnhe/tmuxline.vim'
Plug 'wakatime/vim-wakatime'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() } }
Plug 'Shougo/echodoc.vim'
Plug 'arcticicestudio/nord-vim'
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
Plug 'doums/darcula'
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

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

hi Comment cterm=italic
hi! GitGutterAdd ctermbg=NONE
hi! GitGutterChange ctermbg=NONE
hi! GitGutterDelete ctermbg=NONE
hi! GitGutterChangeDelete ctermbg=NONE

let mapleader= "\<Space>"
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
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = "camelcase"

let g:polyglot_disabled = ['jsx', 'tsx']

let g:lightline = { 'colorscheme': 'material_vim', 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" }, 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }}

let g:material_theme_style='darker'
let g:material_terminal_italics = 1

let g:gruvbox_invert_selection = 0
let g:gruvbox_guisp_fallback = 'bg'
let g:gruvbox_invert_indent_guides = 1
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_signs = 0

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_map = '<S-S>'
let g:ctrlp_cmd = 'CtrlP'

let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'
let g:gitgutter_override_sign_column_highlight = 1

let g:tmuxline_preset = "nightly_fox"

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = { 'typescript.tsx': 'jsxRegion,tsxRegion', 'javascript.jsx': 'jsxRegion' }

nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <leader>. :lcd %:p:h<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 0gt
nnoremap <leader>m :GitGutterStageHunk<CR>
nnoremap <C-s> :w<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap ; :
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <Leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><F9>
nnoremap <Left> <<
nnoremap <Right> >>
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>g :Goyo<CR>:Limelight!!<CR>
noremap <Leader>0 :NERDTreeFocus<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap <silent> gb <C-o>
noremap <Leader>t :TagbarToggle<CR>
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>
noremap Y y$
noremap <C-p> "+P
vnoremap <Left> <gv
vnoremap <Right> >gv"
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
autocmd FileType javascript.jsx set tabstop=2
autocmd FileType typescript.tsx set tabstop=2
autocmd FileType javascript set tabstop=2
autocmd FileType typescript set tabstop=2
autocmd BufEnter * :syntax sync fromstart
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nnoremap <Leader>i :GoImpl<CR>
autocmd FileType go nnoremap <Leader>j :GoAddTags<CR>
autocmd Filetype man nnoremap <buffer> u <C-u>
autocmd Filetype man nnoremap <buffer> d <C-d>

augroup vimrc-remember-cursor-position
  autocmd!
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END"`'")"'"

colorscheme material
