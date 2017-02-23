set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/gundo'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'dbakker/vim-lint'
Bundle 'vim-perl/vim-perl'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'ternjs/tern_for_vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'elzr/vim-json'
Bundle 'jiangmiao/auto-pairs'
Bundle 'Valloric/YouCompleteMe'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'MarcWeber/vim-addon-local-vimrc'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mbbill/undotree'

set noexrc
set fenc=utf-8
set encoding=utf-8
set laststatus=2
set t_Co=256
set bg=dark
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
match Todo /\s\+$/

set lazyredraw " do not redraw while running macros

set cursorline
set cursorcolumn
" :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkgrey guifg=white

:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Look for trailing spaces...
set list
set listchars=tab:>-,trail:.

" use visual bell instead of beeping
set vb

" incremental search
set incsearch
set hlsearch
set ignorecase
set smartcase

" autoindent
set autoindent
set smartindent

" 4 space tabs
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set softtabstop=4

set matchpairs+=<:>
set backspace=indent,eol,start

" show matching brackets
set showmatch

" show line numbers
"set number
set relativenumber
"switch back and forth depending on INSERT mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
"switch back and forth if window losses
au FocusLost * :set number
au FocusGained * :set relativenumber

" personal keybindings
" imap {  {}<ESC>i
" imap (  ()<ESC>i
" imap [  []<ESC>i
" imap <  <><ESC>i
" imap desc  describe('', function(){});<ESC>16hi
" imap befo  beforeEach(function(){});<ESC>2hi

"like sublime multicurser -> enable . in visual mode
vnoremap . :normal .<s-cr>

"Trying out a new ESCAPE
:imap jk <Esc>
"inoremap <CR> <ESC>
"inoremap <s-cr> <cr>

" check perl code with :make
"autocmd FileType perl set makeprg=perl\ -c\ %\ $*
"autocmd FileType perl set errorformat=%f:%l:%m
"autocmd FileType perl set autowrite

" Tweaks
autocmd BufWritePost *.pl silent !chmod u+x %

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    let _s=@/
    %s/\s\+$//e
    call cursor(l, c)
    let @/=_s
endfun

" autocmd Filetype perl autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType c,cpp,java,php,ruby,python,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" Toggle between relative and absolute
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<CR>

map <F12> :set number!<CR>
imap <F12> <c-o>:set number!<CR>

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

set autowrite
set backspace=2
set cino=t0
set exrc
set nocompatible
set noshowcmd
set ruler
if exists('&selection')
  set selection=exclusive
endif


"airline conf
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

"undotree conf
set undolevels=5000
nnoremap <F4> :UndotreeToggle<cr>
set undodir=~/.vim/undo/
set undofile

"NERDTree conf
nnoremap <F3> :NERDTreeToggle<cr>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"gitgutter conf
let g:gitgutter_highlight_lines = 1
nnoremap <F5> :GitGutterToggle<cr>
nnoremap <F6> :GitGutterLineHighlightsToggle<cr>
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>]h <Plug>GitGutterNextHunk
nmap <Leader>[h <Plug>GitGutterPrevHunk

nnoremap <F2> :buffers<CR>:buffer<Space>

"let g:solarized_termcolors=256
"syntax enable
"colorscheme solarized



