map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

:imap jj <Esc>
:set number

colorscheme dogrun

" Add vim-pug config
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'

Plug 'preservim/nerdtree'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" Plug 'ycm-core/YouCompleteMe'
" Initialize plugin system
call plug#end()

:set backspace=indent,eol,start
nmap g! :NERDTreeToggle<CR>
nmap g@ :GitGutterToggle<CR>
let g:airline_theme='tomorrow'
