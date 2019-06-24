call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'https://github.com/ap/vim-buftabline.git'
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/itchyny/vim-gitbranch.git'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

set hlsearch
set laststatus=2
set number
execute pathogen#infect()
call pathogen#helptags()
map ; :Files<CR>
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! Tws call TrimWhitespace()
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
set noeol
set shiftwidth=4
set nofixendofline
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
cnoremap !py3 !python3 %:p<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set foldmethod=indent
set foldlevel=99
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set hidden
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>
let g:jedi#popup_on_dot = 0
