set nocompatible        " not compatible with vim

set nobackup            " keep a backup file
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

map Q gq                " Don't use Ex mode, use Q for formatting

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set mouse=a             " enable mouse          
                                                
syntax on               "enable syntax highlight
set hlsearch            "enable highlight search

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" Navigate between windows easier
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Default to using a stack style editing (current window always max)
set winminheight=0
au VimEnter * set winheight=999
set splitbelow

" Keep 2 lines of context when scrolling
set scrolloff=2

set ignorecase
set smartcase

set directory=~/.vim/swp/   " Don't litter the filesystem with .swp files

nmap <silent> <C-N><C-N> :set invnumber<CR>
nmap <silent> <C-W><C-W> :set invwrap<CR>
nmap <silent> <C-G><C-G> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
nmap <silent> <C-Z><C-Z> :let &foldcolumn = ( &foldcolumn == 0 ? 5 : 0 )<CR>

" Change from using stack style editing to normal, equal sized windows and back
nmap <silent> <C-S> :let &winheight = ( &winheight == 999 ? 1 : 999)<CR><C-W>=

" Open/close folds with space
nmap <Space> za

" Easier interaction with clipboard
vmap <Leader>y "+y
nmap <Leader>p "+gP

" Select some text and search with it
vmap // y/<C-R>"<CR>
vmap ?? y?<C-R>"<CR>

" Wrapped line movement
map <Up> gk
map <Down> gj

" Goto file in another window and navigate back to this window
map gf <C-W><C-F><C-K>

" Execute macro in the 'q' register.
map <C-Q> @q

" More useful mappings to find the latest { or }
nmap [[ [{
nmap ]] ]}

let Tlist_Close_On_Select=1
nmap <M-?> :NERDTreeToggle<CR>

filetype plugin on

let html_use_css = 1
let g:lisp_rainbow = 1
let g:clj_paren_rainbow = 1
let g:clj_highlight_builtins = 1
let g:xml_syntax_folding=1
let NERDTreeQuitOnOpen = 1

colorscheme desert
set nowrap
set number
set visualbell

" Use man in a new window
runtime! ftplugin/man.vim
nmap K <Leader>K
vmap K "my:Man <C-R>m<CR>

" Change directory of the current buffer to be the same as the file
command! -n=0 Cdl lcd %:p:h

" If forgot to edit a file with sudo
command! W w !sudo tee % > /dev/null

"No more accidently hitting <F1>
map <F1> <Nop>

set viminfo^=!        " Add recently accessed projects menu (project plugin)

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

set cf                      " Enable error files & error jumping.
set clipboard+=unnamed      " Yanks go on clipboard instead.
set history=256             " Number of things to remember in history.
set autowrite               " Writes on make/shell commands
set ruler                   " Ruler on
set nu                      " Line numbers on
set nowrap                  " Line wrapping off
set timeoutlen=250          " Time to wait after ESC (default causes an annoying delay)

" colorscheme vividchalk    " Uncomment this to set a default theme

" Formatting (some of these are for coding in C and C++)
set tabstop=2         " Tabs are 2 spaces
set backspace=2       " Backspace over everything in insert mode
set shiftwidth=2      " Tabs under smart indent
set softtabstop=2     " Use spaces every 2 characters instead of tabs
set expandtab

set nocp incsearch

set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
" set list
" set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<   " Show $ at end of line and trailing space as ~

set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
 
" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
