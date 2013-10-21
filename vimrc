set nocompatible

set cursorline
set cursorcolumn
"set scrollbind "oops don't want this all the time

" :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkgrey guifg=white

" :nnoremap <Leader>c :set cursorline! cursorcolumn!

" Look for trailing spaces...
set list
set listchars=trail:.

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

"like sublime multicurser -> enable . in visual mode
vnoremap . :normal .<cr>


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

" Toggle line numbers
"function! NumberDisplayToggle()
"  if(&relativenumber == 1)
"    let g:oldNumber = "relativenumber"
"    set relativenumber!
"  else
"    let g:oldNumber = "number"
"    set number!
"  endif
"endfunc
"map <F12> :call NumberDisplayToggle()<CR>
"imap <F12> :call NumberDisplayToggle()<CR>
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

execute pathogen#infect()

set encoding=utf-8
set laststatus=2
set t_Co=256

"airline conf
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

"undotree conf
set undolevels=5000
nnoremap <F4> :UndotreeToggle<cr>
set undodir=~/.vim/undo/
set undofile

"gitgutter conf
let g:gitgutter_highlight_lines = 1
nnoremap <F5> :GitGutterToggle<cr>
nnoremap <F6> :GitGutterLineHighlightsToggle<cr>

"NERDTree conf
nnoremap <F3> :NERDTreeToggle<cr>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"solorized colors
"syntax enable
"colorscheme solarized
set bg=dark

filetype off
syntax on
filetype plugin indent on

match Todo /\s\+$/

