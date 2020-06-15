set nocompatible termguicolors background=dark t_Co=256
set mouse=a encoding=UTF-8 backspace=indent,eol,start
set splitbelow splitright wrap linebreak whichwrap=b,s,<,>,[,]
set autoindent expandtab tabstop=4 softtabstop=0 shiftwidth=0 showmatch
set nobackup noswapfile undofile undodir=~/.vimundo
set display+=lastline history=1000 completeopt+=noselect
set incsearch hlsearch ignorecase smartcase signcolumn=yes
set updatetime=100 laststatus=2 updatetime=50 shortmess+=c fillchars+=vert:┃
set relativenumber number wildmenu lazyredraw list listchars=tab:│·,trail:_ noshowmode
set pastetoggle=<F10> completeopt-=preview
syntax on
filetype plugin indent on

" Download Plug if it it hasn't been downloaded
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" Colorschemes
Plug 'kaicataldo/material.vim'

" Lightline
Plug 'itchyny/lightline.vim'

" NERDTree
Plug 'preservim/nerdtree'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git plugins
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

" devicons
Plug 'ryanoasis/vim-devicons'

" vim-rooter
Plug 'airblade/vim-rooter'

" tmuxline
Plug 'sainnhe/tmuxline.vim'

" Coc - for interaction with gopls
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Ale - linter
Plug 'dense-analysis/ale'

" vim-go - go tooling
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" tpope's plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

" startify
Plug 'mhinz/vim-startify'

" wakatime
Plug 'wakatime/vim-wakatime'

" Language support for many languages
Plug 'sheerun/vim-polyglot'

call plug#end()

" general vim vars
let loaded_matchparen = 1
let mapleader= "\<Space>"

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
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeWinPos = "right"
nnoremap <Leader>f :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.6, 'height': 0.4,'yoffset':0.0,'xoffset': 0.5 } }
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
nnoremap <C-S-P> :Colors<CR>
nnoremap <Leader>p :Rg<SPACE>
nnoremap <S-S> :Files<CR>

" startify
set shortmess=I
" Highlight the acsii banner with green font
hi StartifyHeader ctermfg=76
" Don't change the directory when opening a recent file with a shortcut
let g:startify_change_to_dir = 0
" Set the contents of the banner

let g:startify_custom_header = [
			\ '',
			\ '			  __  ___      ____  __',
			\ '			 / / / / | /| / / / / /',
			\ '			/ /_/ /| |/ |/ / /_/ /',
			\ '			\__,_/ |__/|__/\__,_/',
			\ '',
			\ '',
			\]

let g:startify_show_files_number=10
au User Startified setlocal buftype=
au User Startified nnoremap <buffer> <S-S> :Files<CR>

" colorscheme
let g:material_theme_style='darker'
let g:material_terminal_italics = 1

" tmux fix
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q""]"

" change tabs with <Space>+Number
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

" clear search on Space + c
nnoremap <silent><Leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><F9>

" go back
noremap <silent>gb <C-o>

" control + S for save
nnoremap <silent><C-s> :w<CR>

" change tabs with Tab and Shift+Tab
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" ; -> :
nnoremap ; :

" Quicker navigation between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Gitgutter
let g:gitgutter_override_sign_column_highlight = 1
nnoremap <leader>m :GitGutterStageHunk<CR>

" Lightline
let g:lightline = { 'colorscheme': 'material_vim', 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" }, 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }}

" polyglot
let g:polyglot_disabled = ['jsx', 'tsx', 'go']

" Tmuxline
let g:tmuxline_preset = "nightly_fox"
let g:tmuxline_powerline_separators = 0

" Coc
fun! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

fun! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
au! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent><leader>r <Plug>(coc-rename)
nmap <silent>g[ <Plug>(coc-diagnostic-prev)
nmap <silent>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader>cr :CocRestart

" ALE
hi ALEErrorSign ctermbg=NONE ctermfg=red
hi ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_sign_error = '😔'
let g:ale_sign_warning = '🤔'
let g:ale_virtualtext_cursor = 1

" vim-go
let g:go_def_mapping_enabled = 0

" remember cursor position after quitting
augroup remember-cursor
    au!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" custom colors
augroup custom-colors
    au!
    au ColorScheme * hi! Comment cterm=italic gui=italic
                \ | hi! clear SignColumn
                \ | hi! GitGutterAdd ctermbg=NONE
                \ | hi! GitGutterChange ctermbg=NONE
                \ | hi! GitGutterDelete ctermbg=NONE
                \ | hi! GitGutterChangeDelete ctermbg=NONE
augroup END

colorscheme material
