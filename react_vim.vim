" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

if has('vim_starting')
 if &compatible
 set nocompatible "Be iMproved
 endif

" Required:
 set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

" Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
 "Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

"****************************************************************"
"" Neobudle install packages
"****************************************************************"

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'

"" Syntax
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mtscout6/syntastic-local-eslint.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'ervandew/supertab'
NeoBundle 'DeleteTrailingWhitespace'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'foosoft/vim-argwrap'

"" Git
NeoBundle 'airblade/vim-gitgutter'

"" Snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

"" Javascript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

"" HTML/CSS
NeoBundle 'mattn/emmet-vim'

"" Color
NeoBundle 'tomasr/molokai'

 call neobundle#end()

" Required:
 filetype plugin indent on

" If there are uninstalled bundles found on startup,
 "this will conveniently prompt you to install them.
 NeoBundleCheck

"*********************************************************************"
"" Basic Setup
"*********************************************************************"

"" Fix backspace indent
set backspace=indent,eol,start
set list lcs=tab:\|\ "space"

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"*********************************************************************"
"" Visual Settings
"*********************************************************************"
syntax on
set number

if !exists('g:not_finsh_neobundle')
  colorscheme molokai
endif
set t_Co=256

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"" vim-airline

let g:airline_theme = 'dark'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"" indent line
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

"" WhiteSpace
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_checkers = ['eslint']

" jsx
let g:jsx_ext_required = 0

"*********************************************************************"
"" Abbreviations
"*********************************************************************"

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
noremap <F2> :NERDTreeToggle<CR>

"" ctrlp
let g:ctrlp_match_window = 'top,order:btt,min:1,max:20,results:20'


"" argument
nnoremap <silent> <leader>a :ArgWrap<CR>
let g:argwrap_padded_braces = '[{'

"*********************************************************************"
"" Functions
"*********************************************************************"
""if !exists('*s:setupWrapping')
""  function s:setupWrapping()
""    set wrap
""    set wm=2
""    set textwidth=79
""  endfunction
""endif


"*********************************************************************"
"" Autocmd Rules
"*********************************************************************"

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"*********************************************************************"
"" Mappings
"*********************************************************************"

"" Map leader to ,
let mapleader=' '

"" Patse & NoPaste
set pastetoggle=<F3>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <leader>q :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
