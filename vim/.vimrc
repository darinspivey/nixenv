"This setting prevents vim from emulating the original vi's bugs and limitations whatever those bugs might be
syntax on
set term=ansi
set nocompatible

"This setting ensures that each window contains a statusline that displays the current cursor position.
set ruler

"How many lines of history to remember
set history=50

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" Don't highlight all matches for a search result
set nohlsearch

"vim will search for text as you enter it; press enter after search finds what you want
"set incsearch

set tabstop=2
set shiftwidth=2
set expandtab
"indent/outdent to nearest tabstop
"set shiftround
set backspace=indent,eol,start
set paste
set ic

"jump to a brace/parenthese/bracket's "match" whenever you type a closing or opening brace/parenthese/bracket.
"set showmatch

"if background color is dark this helps fonts not be too bright
set bg=dark
highlight Comment ctermfg=white guifg=white

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" Save state on close, reload on open.  Preserves fold lines etc.
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" putty is default colors
au BufWinEnter * colorscheme elflord
autocmd BufEnter * :syntax sync fromstart

" Set file types of unknown file types.  For syntax highlighting
"au BufRead,BufNewFile *.underscore set syntax=html

" Switch between color schemes in the .vim/colors directory
map <F9> :set t_Co=256<CR> :colorscheme leo<CR>
map <F10> :colorscheme midnight<CR>
map <F11> :colorscheme nightflight<CR>
map <F12> :colorscheme putty<CR>

" Javascript and perl block uncomment
map <F1> : s/#//g
map <F2> : s/\/\///
map <F5> :set tabstop=4 shiftwidth=4 expandtab<CR>
map <F6> :set tabstop=2 shiftwidth=2 expandtab<CR>
