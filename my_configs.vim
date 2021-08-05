call plug#begin('~/.vim/plugger/') " Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'aserebryakov/vim-todo-lists'
call plug#end()

" let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}
set number
" let g:ale_fixers = {
"       \    'python': ['yapf'],
"       \}

" nmap <Leader>fi :ALEFix<CR>
" let g:ale_linters = {
"       \   'python': ['pyright'],
"       \   'ruby': ['standardrb', 'rubocop'],
"       \   'javascript': ['eslint'],
"       \}

" Pylint configuration file
" let g:pymode_lint_config = '$HOME/.pylint.rc'
" let g:ale_completion_enabled = 1
let g:pymode_options_max_line_length=120

" set omnifunc=ale#completion#OmniFunc

let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set directory=$HOME/.vim/swapfiles
let mapleader = ","
" Make folding appear expanded on file opening
au BufRead * normal zR
" Add gdb integration
packadd termdebug
" Basic settings
set foldmethod=syntax
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smarttab
set smartcase
" Set permanent undo
set undofile
set nofixendofline
"set relativenumber
set number
set laststatus=2
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
set listchars=eol:$,tab:>=,trail:.
set list
set background=dark
set cursorline
set hidden
" make insertion of bracets to auto add closing bracets
"inoremap { {<CR>}<Esc>ko

" Change color of drop menu
hi Pmenu ctermbg=darkgray ctermfg=white

" set current line color
highlight CursorLine ctermbg=Black

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_posix_standard = 1

" clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ 'DerivePointerAlignment': "false",
            \ 'PointerAlignment': "Left",
            \ "BreakBeforeBraces" : "Stroustrup",
            \ "ColumnLimit" : 120}

" BufExplorer options
let g:bufExplorerShowRelativePath=1
"
" " Startify settings
let g:startify_enable_special         = 0
let g:startify_enable_unsafe          = 1
let g:startify_files_number           = 15
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_change_to_vcs_root     = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_savevars = ['&makeprg']
let g:startify_bookmarks = [ '~/.vim_runtime/my_configs.vim' ]
let g:startify_list_order = [
      \ ['  Bookmarks:'],
      \ 'bookmarks',
      \ ['  Sessions:'],
      \ 'sessions',
      \ ['  Recent files:'],
      \ 'files',
      \ ]
let g:startify_custom_indices =
      \ map(range(0,9), 'string(v:val)') +
      \ map(range(char2nr('A'),char2nr('Z')), 'nr2char(v:val)')
let g:startify_custom_header =
      \ map(split(system('figlet Welcome'), '\n'), '"   ". v:val') + ['','']
function! s:sy_add_bookmark(bookmark)
    if !exists('g:startify_bookmarks')
        let g:startify_bookmarks = []
    endif
    let g:startify_bookmarks += [ a:bookmark ]
endfunction

command! -nargs=1 StartifyAddBookmark call <sid>sy_add_bookmark(<q-args>)

" NERDTree settings
let g:NERDTreeWinSize = 60
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.moc$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
set noeol

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! Tws call TrimWhitespace()

" CoC commands
"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
command! GoToDef call CocActionAsync('jumpDefinition')
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:airline#extensions#tabline#buffer_min_count = 2
nnoremap <esc><esc> :silent! nohls<cr>
nnoremap NM :NERDTreeToggle<CR>
nnoremap gd :GoToDef<CR>
nnoremap <Leader>tw :Tws<CR>
nnoremap <Leader>S :Startify <CR>
nnoremap <Leader>ga :Git add %:p<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog -- %<CR>:bot copen<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gP :Gpull<CR>
nnoremap <Leader>gh :Gbrowse<CR>