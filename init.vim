call plug#begin('~/.config/nvim/') " Use release branch (recommend)

" Plugin for adding debugging ui in vim
Plug 'puremourning/vimspector'

" A plugin for vimspector to setup all python configurations
Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }

" Plugin to show startup options and shortcuts
Plug 'mhinz/vim-startify'

" Python vscode like color scheme for neovim
Plug 'Mofiqul/vscode.nvim'

" Plugin for Git integration
Plug 'https://github.com/tpope/vim-fugitive.git'

" Plugin for fast search in files
Plug 'mileszs/ack.vim'

" Plugin for easy commenting blocks in any file type
Plug 'preservim/nerdcommenter'

" Plugin for find files
Plug 'ctrlpvim/ctrlp.vim'

" Plugin for find files
Plug 'ntpeters/vim-better-whitespace'

" Plugin showing files in a file tree pane
Plug 'preservim/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'

" Plugin for better status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plugin for surrounding blocks with ("or'
Plug 'https://github.com/tpope/vim-surround.git'

"Plugin for markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Install coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Allows showing buffes in a window and navigating between them
Plug 'jlanzarotta/bufexplorer'

" Allows cycling between yanked chunks
Plug 'maxbrunsfeld/vim-yankstack'

" Solve mapping conflicts
Plug 'lukhio/vim-mapping-conflicts'

" Dev icons eye candy
Plug 'ryanoasis/vim-devicons'

" Tagbar for code navigation
Plug 'https://github.com/preservim/tagbar'

" Show marks in the gutter
Plug 'jacquesbh/vim-showmarks'

" Manage projects
Plug 'leafOfTree/vim-project'

" Edit yaml files
Plug 'mrk21/yaml-vim'
Plug 'pedrohdz/vim-yaml-folds'

" Jupyter notebooks
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

call plug#end()

" dev-icons config
let g:webdevicons_enable = 1

syntax enable


"----------------------------------------------------------
" vscode color theme enabling
"----------------------------------------------------------
lua require('vscode').change_style('dark')

"----------------------------------------------------------
" Enable 120 width column mark
"----------------------------------------------------------
set colorcolumn=120

"----------------------------------------------------------
" Vimslime options
"----------------------------------------------------------
let g:slime_target = "tmux"

"----------------------------------------------------------
" Tagbar options
"----------------------------------------------------------
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_2/ctags'

"----------------------------------------------------------
" Vim native options
"----------------------------------------------------------
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on

" Color config
set termguicolors
highlight LineNr guifg=lightgray

hi Visual  guifg=#000000 guibg=#FFFFFF gui=none

" Popup autocompletion menu
highlight PmenuSel guibg=Black guifg=lightgray
highlight Pmenu guibg=darkblue guifg=white

autocmd BufRead,BufNewFile *.txt,*.md setlocal spell
autocmd BufRead,BufNewFile *.yaml,*.js,*.ts,*.cpp,*.h setlocal nospell
set spell spelllang=en_us

 hi clear SpellBad
 hi SpellBad cterm=underline
 hi clear SpellRare
 hi SpellRare cterm=underline
 hi clear SpellCap
 hi SpellCap cterm=underline
 hi clear SpellLocal
 hi SpellLocal cterm=underline

"----------------------------------------------------------
" Vimspector options
"----------------------------------------------------------
"packadd! vimspector

"----------------------------------------------------------
" Airline options
"----------------------------------------------------------
let g:airline#extensions#tabline#enabled = 0           " enable airline tabline
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|term://|undotree|vimfiler'
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 1      " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

let g:airline_powerline_fonts = 1
let g:coc_config_home="$HOME/.config/coc/coc-settings.json"

"----------------------------------------------------------
"
" NERDTree settings
"----------------------------------------------------------
let g:NERDTreeWinSize = 40
highlight! link NERDTreeFlags NERDTreeDir
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.moc$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden = 0
let NERDTreeQuitOnOpen = 1
set noeol

"au VimEnter *  NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
:function MirrorNerdTreeIfOneWindow()
  if winnr("$") < 2
    NERDTreeMirror

    " hack to move the focus from the NERDTree to the main window
    wincmd p
    wincmd l
  endif
endfunction
let g:nerdtree_sync_cursorline = 1
let g:NERDTreeHighlightCursorline = 1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

augroup nerdtreeconcealbrackets
      autocmd!
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
      autocmd FileType nerdtree setlocal conceallevel=3
      autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('py', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"----------------------------------------------------------
" Startify settings
"----------------------------------------------------------
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
let g:startify_bookmarks = [ '~/.config/nvim/init.vim', '~/development/arene-ai-sdk', '~/development/inadatron', '~/development/arene-ai-kubeflow']
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
 let g:startify_custom_header = [
            \ '             ⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠲⡀',
            \ '             ⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀⢳⡀⠀⡏⠀⠀⠀⠀⠀⢷',
            \ '             ⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀⠀⠀⠀ ⡇',
            \ '             ⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀⠀OK⠀ ⡇',
            \ '             ⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀⣿⠀⢹⠀⠀⠀⠀⠀ ⡇',
            \ '             ⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀⠀⡼',
            \ '             ⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⠞',
            \ '             ⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁',
            \ '             ⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀',
            \ '             ⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿',
            \ '             ⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸',
            \ '             ⣿⣿⣧⣀⣿.........⣀⣰⣏⣘⣆⣀',
            \ ]

function! s:sy_add_bookmark(bookmark)
    if !exists('g:startify_bookmarks')
        let g:startify_bookmarks = []
    endif
    let g:startify_bookmarks += [ a:bookmark ]
endfunction

command! -nargs=1 StartifyAddBookmark call <sid>sy_add_bookmark(<q-args>)

"----------------------------------------------------------
" Ctrlp plugin configuration
"----------------------------------------------------------
let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>
map <C-b> :CtrlPBuffer<cr>

"----------------------------------------------------------
" Yankstack configurations
"----------------------------------------------------------
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

"----------------------------------------------------------
" Neovim's Python provider
"----------------------------------------------------------
let g:python_host_prog  = '/home/pabloelias/.pyenv/shims/python'
let g:python3_host_prog = '/home/pabloelias/.pyenv/shims/python3'

"----------------------------------------------------------
" Ctrlp plugin cache configuration
"----------------------------------------------------------
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"----------------------------------------------------------
"  General vim configurations
"----------------------------------------------------------
set directory=$HOME/.config/nvim/swapfiles

let mapleader = ","

" Make folding appear expanded on file opening
au BufRead * normal zR

" Add gdb integration
packadd termdebug

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

set number
set laststatus=2
set clipboard=unnamedplus
set listchars=eol:$,tab:>=,trail:.
set list
set background=dark
set cursorline
set cursorcolumn
set hidden


"
" Bufexplore options
"
 let g:bufExplorerShowRelativePath=1

" make insertion of bracets to auto add closing bracets
"inoremap { {<CR>}<Esc>ko
"
" make TAB and SHIFT + TAB to navigate between buffers in normal mode
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bn<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bp<CR>

"----------------------------------------------------------
"  Appearance configurations
"----------------------------------------------------------
" Change color of drop menu
hi Pmenu ctermbg=darkgray ctermfg=white

" set current line color

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight LineNr ctermfg=white ctermbg=236
highlight CursorColumn guibg=black ctermbg=234
highlight CursorLine guibg=black
highlight Normal ctermbg=233

"----------------------------------------------------------
"  Keymapping configurations
"----------------------------------------------------------
set nuw=6
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <Leader>f :<C-u>ClangFormat<CR>
nnoremap <Leader>a :Ack

" Vimspector
command! -nargs=+ Vfb call vimspector#AddFunctionBreakpoint(<f-args>)

nnoremap <Leader>Gd :call vimspector#Launch()<cr>
nnoremap <Leader>Gc :call vimspector#Continue()<cr>
nnoremap <Leader>Gs :call vimspector#Stop()<cr>
nnoremap <Leader>GR :call vimspector#Restart()<cr>
nnoremap <Leader>Gp :call vimspector#Pause()<cr>
nnoremap <Leader>Gb :call vimspector#ToggleBreakpoint()<cr>
nnoremap <Leader>GB :call vimspector#ToggleConditionalBreakpoint()<cr>
nnoremap <Leader>Gn :call vimspector#StepOver()<cr>
nnoremap <Leader>Gi :call vimspector#StepInto()<cr>
nnoremap <Leader>Go :call vimspector#StepOut()<cr>
nnoremap <Leader>Gr :call vimspector#RunToCursor()<cr>

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

" CoC commands mappings
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! Tws call TrimWhitespace()
let g:airline#extensions#tabline#buffer_min_count = 2

nnoremap <esc><esc> :silent! nohls<cr>
nnoremap <Leader>x :bd<CR>
noremap <Leader>F :CocCommand "editor.action.formatDocument"<CR>
nnoremap <Leader>o :BufExplorerHorizontalSplit<CR>
nnoremap <Leader>rf :Rename <C-R>=expand("%")<CR>
nnoremap <Leader>df :GenDefinition<CR>
nnoremap <Leader>dc :GenDeclaration<CR>
nnoremap <Leader>b :Break<CR>
nnoremap <Leader>s :Step<CR>
nnoremap <Leader>fi :CocFix<CR>
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>
nnoremap <Leader>e :CocDiagnostics<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>m :NERDTreeToggle<CR>
nnoremap <Leader>pl :ProjectList<CR>
nnoremap <Leader>k :DoShowMarks<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>tw :Tws<CR>
nnoremap <Leader>S :Startify <CR>
nnoremap <Leader>ga :Git add %:p<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gc :Git commit -v -q<CR>
nnoremap <Leader>gt :Git commit -v -q %:p<CR>
nmap <leader>rn <Plug>(coc-rename)
nnoremap <Leader>gd :Git diff<CR>
nnoremap <Leader>gl :silent! Glog -- %<CR>:bot copen<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gP :Git pull<CR>
nnoremap <Leader>gh :Git browse<CR>

" Magma key bindings (jupyter notebooks plugins)
" nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "ueberzug"

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



call yankstack#setup()