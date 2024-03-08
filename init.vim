" Status bar
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

lua require('init')
" lua << EOF
" require("glow").setup()
" EOF

" Backups
set swapfile
set dir=~/tmp,/tmp

" auto detect changes in files
set autoread

" UI Config
set number              " show line numbers
set relativenumber      " show relative line numbers
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set colorcolumn=80      " show a vertical line at column 80

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase
nnoremap <C-J> :set hlsearch!<CR>

" Indent
set autoindent
set shiftwidth=2
filetype plugin indent on      " load filetype-specific indent files
set pastetoggle=<F3>    " toggle paste mode to avoid extra chars in new line

" Hotkeys Map
nnoremap <C-H> :bp!<CR> " Move to another buffer
nnoremap <C-L> :bn!<CR> " Move to another buffer
let g:tmux_navigator_no_mappings = 1

noremap <silent> <M-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <M-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <M-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <M-l> :<C-U>TmuxNavigateRight<cr>
noremap <silent> <M-\> :<C-U>TmuxNavigatePrevious<cr>

let g:user_emmet_leader_key='<C-E>'
