" vim: set foldenable foldlevel=1 nospell:
" File:          home/.config/nvim/init.vim
" Author:        Bobby Larson <karma0@gmail.com>
" Description:   The core of my configuration.
" Last Modified: 2017-04-13 16:30:22 PDT
"
" Here lies the root of the base options I set for Neovim.

scriptencoding utf-8

set t_Co=256
set t_8f=[38;2;%lu;%lu;$lum
set t_8b=[48;2;%lu;%lu;$lum
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
       \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
       \,sm:block-blinkwait175-blinkoff150-blinkon175
set guifont=monoOne\ 8
let ayucolor="dark"   " for dark version of theme
if has('termguicolors')
  set termguicolors
endif

let g:neomake_cpp_enabled_makers = []

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" {{{ Options

set laststatus=2
set showcmd cmdheight=2
set exrc
set number relativenumber numberwidth=3
set path=.,/usr/local/include,/usr/include,$HOME/.local/include
set novisualbell
set errorbells
set noruler
set conceallevel=2 concealcursor=nvci
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set textwidth=80 nowrap
set updatetime=750

set complete=k,.,w,b,u,U,i,d,t
set completeopt=menu,longest
set nocursorline nocursorcolumn

set noshowmode
set showmatch wrapscan
set nogdefault noignorecase
set showfulltag
set showmatch
set modeline modelines=5
set noshelltemp
set showtabline=2
set backspace=indent,eol,start

set wildmenu wildmode=longest:full
set wildoptions=tagfile
set wildignorecase

set matchtime=2

" Ignore a lot of stuff.
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
set wildignore+=.sass-cache/*,*node_modules/*,*/target/*

set nobackup noswapfile
set undofile undodir=~/.config/nvim/undodir

set cpoptions+=d
set tags=./tags,~/.config/nvim/tags/db
set nolazyredraw redrawtime=500

set foldenable foldcolumn=1 foldlevel=1 foldminlines=5
      \ foldnestmax=3 foldlevelstart=1

set spelllang=en_us,fr spellsuggest=double,7
set spellfile=~/.config/nvim/dict/custom.utf-8.add

set splitbelow splitright
set synmaxcol=0

set cinoptions+='JN'

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" }}}

" {{{ White spacing and Characters
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-

" A visual cue for line-wrapping.
set showbreak=↪

set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\ 

" Keep some spacing.
set sidescrolloff=1
"}}}
