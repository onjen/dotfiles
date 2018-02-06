" GENERAL SETTINGS
" ================
set number

" Highlight Past Column 80
highlight ColorColumn ctermbg=234
execute "set colorcolumn=" . join(range(81,335), ',')

" VIM-PLUG SETTINGS
" =================
"   Neovim ~/.local/share/nvim/plugged
"   https://github.com/junegunn/vim-plug
"   run :PlugInstall to install them
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zchee/deoplete-jedi'

Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" PLUGIN SETTINGS
" ===============
"
" enable deoplete
let g:deoplete#enable_at_startup = 1
" tab autocomplete for deoplete
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" enable ale linter whenever available
let g:ale_completion_enabled = 1
