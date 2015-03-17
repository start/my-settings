let vundlePath = expand('$HOME/.vim/bundle/Vundle.vim/')

" Is Vundle installed?
if isdirectory(vundlePath)
  " Vundle requires that `filetype` initially be set to `off`
  filetype off

  execute 'set runtimepath+=' . vundlePath
  call vundle#rc()

  " This too is required. Vundle has to manage itself
  Bundle 'gmarik/vundle'
endif

" Enable filetype detection, filetype-specific plugins, and
" filetype-specific indentation rules
filetype indent plugin on

" Use utf-8 for everything inside of Vim
set encoding=utf-8

" Enable syntax highlighting
syntax on

" Turn off annoying error spam
set noerrorbells visualbell t_vb=

" Allow a buffer to be hidden without having to save it
set hidden

" Hard-wrap lines at 76 characters
set textwidth=76

" Hard-wrap lines at 72 characters when composing Git commit messages
autocmd FileType gitcommit set textwidth=72

" Enable soft word-wrapping for files that aren't hard-wrapped
set wrap linebreak nolist

" Autoindent with two spaces
set autoindent softtabstop=2 tabstop=2 shiftwidth=2 shiftround expandtab

" Sensible search defaults
set ignorecase smartcase incsearch gdefault

" In the status line, show the current command and cursor position
set showcmd ruler

" Show line numbers
set number

" Always the show status line
set laststatus=2

" Mimic modern editors' backspace behavior
set backspace=indent,eol,start

" Undo forever!
set undolevels=1000

" Keep cursor 9 lines from the screen's edge
set scrolloff=9

" Make 'j' and 'k' navigate screen lines, not file lines
nnoremap j gj
nnoremap k gk

" Resize windows. Don't waste the arrow keys by disabling them
noremap <up> <c-w>+
noremap <down> <c-w>-
noremap <left> <c-w><
noremap <right> <c-w>>

" Navigate between windows
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" My left pinky doesn't like having to press shift repeatedly
noremap ; :
noremap : ;

" Make Y behave like D and C
noremap Y y$

" Easily replace the word under the cursor
noremap <leader>c :%s/\<<c-r><c-w>\>/
noremap <leader>C :%s/\<<c-r><c-a>\>/

" Easily toggle search highlighting
noremap <leader><leader> :set invhlsearch<cr>

" Use tab for code completion
inoremap <tab> <c-r>=TabOrComplete(0)<cr>
inoremap <s-tab> <c-r>=TabOrComplete(1)<cr>

function! TabOrComplete(completeBackward)
  " If the character before the cursor is non-whitespace...
  if getline('.')[col('.') - 2] =~ '\S'
    " ... then emulate the appropriate completion key chord
    return (a:completeBackward ? "\<c-p>" : "\<c-n>")
  else
    " ... otherwise, just emulate the tab key
    return "\<tab>"
  endif
endfunction

