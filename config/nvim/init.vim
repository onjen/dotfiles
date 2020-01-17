colorscheme molokai

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set colorcolumn=80

let g:deoplete#enable_at_startup = 1
let g:rainbow_active = 1
let g:ale_lint_delay = 1000
let g:ale_linters = {'python': ['flake8', 'python']}
let g:ale_set_hightlights = 0
let g:ale_sign_error = '!'
let g:ale_sign_warning = '▪'
let g:ale_running = 0
let g:python_highlight_all = 1

au BufNewFile,BufRead *.md set spell
