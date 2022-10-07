map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

:imap jj <Esc>
:set number
 
" colorscheme dogrun
colorscheme onedark

" Add vim-plug config
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim',

"Plug 'tabnine/YouCompleteMe'

Plug 'ludovicchabant/vim-gutentags'

Plug 'preservim/nerdtree'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" Save last position of cursor! (reloads when next opening the file)
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

:set backspace=indent,eol,start
set clipboard=unnamedplus

" Use proper tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Collapse methods/classes
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

nnoremap <silent> <C-f> :FZF<CR>

" Use specified tags file
set tags+=tags
set tags+=/home/skydio/aircam/vehicle/nvidia/R32.4.3/kernel/tags
set tags+=/home/skydio/aircam/mytags

" NerdTree Configs
nnoremap ,, :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 2
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

nmap <C-P> :GFiles<CR>

nmap g@ :GitGutterToggle<CR>
let g:airline_theme='tomorrow'
