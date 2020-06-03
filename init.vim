"##########"
" vim-plug "
"##########"

call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'elixir-lang/vim-elixir'
" Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'ervandew/supertab'
Plug 'junegunn/fzf.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvie/vim-flake8'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/tcomment'
call plug#end()

" Debian/Coc mess:
let g:coc_disable_startup_warning = 1

"#########################"
" Custom Editor Shortcuts "
"#########################"

" Unmappings:
map <F1> <Nop>
map Q <Nop>

" Assign a leader:
let g:mapleader = ","

" Fast saving:
nmap <leader>s :w<CR>

" Close buffer:
nmap <leader>bd :bd<CR>

" Map arrows to switch between open buffers:
map <right> :bn<CR>
map <left> :bp<CR>

" Unhighlight:
map <leader>z :noh<CR>

" Remap 0 to start at begining of text:
map 0 ^

" and § to end ($):
map § $
map ` $

" Autoclose braces:
inoremap {<CR> {<CR>}<ESC>O

" Reload vimrc:
map <leader>v :so $MYVIMRC<CR>

" Switch split:
function! ToggleWindowHorizontalVerticalSplit()
  if !exists('t:splitType')
    let t:splitType = 'vertical'
  endif

  if t:splitType == 'vertical' " is vertical switch to horizontal
    windo wincmd K
    let t:splitType = 'horizontal'

  else " is horizontal switch to vertical
    windo wincmd H
    let t:splitType = 'vertical'
  endif
endfunction

nnoremap <silent> <leader>r :call ToggleWindowHorizontalVerticalSplit()<cr>


"####################"
" Behaviour Settings "
"####################"

" Indentation
set shiftwidth=2

" Replace tabs with spaces:
set expandtab

" Disable automatic insertion of comments (includes workaround setting for bug #4684):
filetype plugin indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use system clipboard (OS X):
set clipboard=unnamedplus

" Vertical splits default to right hand side:
set spr

" Disable 'no write since last change':
set hidden

" Disable swapfile:
set noswapfile

" Search:
set ignorecase    " case insensitive
set smartcase     " match uppercase letters
set incsearch     " Show search matches typed
set hlsearch      " Highlight search terms

" Remember last position in file:
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

" Emacs bindings for the command line:
cnoremap <C-A>        <Home>
cnoremap <C-E>        <End>
cnoremap <C-K>        <C-U>


"#####################"
" Appearance Settings "
"#####################"

set number
set linebreak
set background=light
highlight Search ctermbg=black
highlight Search ctermfg=184
highlight Search cterm=underline

let g:airline_powerline_fonts = 1


"##########"
" Plugins: "
"##########"

" NERDTree:
map \ :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$']

" tComment:
map <leader>cc :TComment<CR>

" Supertab:
let g:SuperTabDefaultCompletionType = "<c-n>"

" FZF:
source /usr/share/doc/fzf/examples/plugin/fzf.vim
map <leader>t :FZF <CR>
map <leader>f :Rg 
map <leader>d :call fzf#vim#tags(expand('<cword>'))<CR>

" Coc:
set signcolumn=no

" Rainbow parens:
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Tagbar:
map <F4> :TagbarToggle<CR>
let g:tagbar_sort = 0  " Disable alphabetical sort
let g:tagbar_foldlevel = 0  " Don't expand folds
