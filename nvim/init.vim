" VIM NOTES
" :nmap - create new mapping for NORMAL mode
" :imap - create new mapping for INSERT mode
" :xmap - create new mapping for VISUAL mode
" map will result in recirsive mappings (see pg 194 mouseless)
" :nnoremap is non-recursive version
" <space> <c-w> (Cntl W) <cr> (Enter)
" :help key-notation -> to see full list
" q:		- open the command history
" q/ q! 	- open the search history
" CTRL+f	- open the command history when in command line mode. edit
" 		- command then hit enter

" Call the plugin manager
" The plugin manager will be installed automatically by the install.sh script
" $XDG_CONFIG_HOME should be set to $HOME/.config/
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
"   This config file should be save here for neovim: .config/nvim/init.vim
"   Plugins should be installed using https://github.com/junegunn/vim-plug
"   and saved here: .local/share/nvim/plugged
" You can specify default directory for plugins directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

" Allows to connect to a jupyter console which is useful for viewing charts
" terminal: jupyter qtconsole
" vim: JupyterConnect
Plug 'jupyter-vim/jupyter-vim'

" Plugin which allows % to jump between tags
Plug 'https://github.com/adelarsq/vim-matchit'

" Nerd Tree - nagivate files (\ne) 
Plug 'preservim/nerdtree'
"allows copy paste of filepath in NerdTree (use mb)
Plug 'mortonfox/nerdtree-clip'

" code auto-completion and documentation viewing
" shift K: view documentation
" gd: to do definition of function
" :Pyimport pandas -> opens pandas import file
" /r : rename variable
" Cntrl space :autocomplete suggestions
" Plug 'davidhalter/jedi-vim'

" Shows errors in code indicated by >>
" The error comment is shown in the status bar below
"Plug 'dense-analysis/ale'

" Compiler and linter alternative to ale
Plug 'neomake/neomake'

" Create doc strings for functions use :DocstringTypes
Plug 'pixelneo/vim-python-docstring'

" Allows git commands to be used in vim e.g Git diff
Plug 'tpope/vim-fugitive'
"
" Applies Black formatting to Python files
Plug 'https://github.com/psf/black'
"
" Changing surrounding (cs) quotes etc.
" cs"' : changes to single quotes
Plug 'tpope/vim-surround'
" Git power bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Quick Search all files:
" :CTRLSF <search_string>
" (enter or o in file script to open)
Plug 'dyng/ctrlsf.vim'

" Github theme plug for neovim
Plug 'projekt0n/github-nvim-theme'
" Buffer cycle
Plug 'jlanzarotta/bufexplorer'

"tool for writing html quickly
Plug 'https://github.com/mattn/emmet-vim'

"Auto close html tabs with > key
Plug 'https://github.com/alvan/vim-closetag'

"auto change both tags when using ciw
Plug 'https://github.com/AndrewRadev/tagalong.vim'
" Add syntax for Jinja
Plug 'https://github.com/lepture/vim-jinja'
" Sneak for navigating more quickly 
Plug 'https://github.com/justinmk/vim-sneak'
" Allow to cycle through copy history when pasting
Plug 'https://github.com/svermeulen/vim-yoink'
" better way of replacing words
Plug 'https://github.com/svermeulen/vim-subversive'
" Cutlass - stops delete from going to register
Plug 'https://github.com/svermeulen/vim-cutlass'
" fuzzy search in vim
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
" smart switching between tmux and vim
Plug 'https://github.com/christoomey/vim-tmux-navigator'
" Initialize plugin system
" allow tmux completions in vim
Plug 'wellle/tmux-complete.vim'
" For coc.vim to work, you'll need nodejs and yarn (both available in official repos).
" Only bash-language-server is configured with coc.vim. See the file coc-settings.json.
" To make it work, you need to install bash-language-server: `sudo pacman -S bash-language-server`
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Startify startup screen
Plug 'https://github.com/mhinz/vim-startify'
" View colours whilst editing
Plug 'https://github.com/ap/vim-css-color'
" View markdown files in a preview window
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Telescope fuzzy finder preview
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" show numbers on left
set number
" show matching bracket to one selected
set showmatch
" what does this do?
let python_highlight_all = 1
" Syntax highlighting (i.e. different colours for python code) on
syntax on

"Navigage between buffers
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Switch buffers
map <F10> :bn<cr>
map <F12> :bp<cr>

"Defines where default buffer splits goto
set splitbelow splitright
map <Leader>tt :vnew term://

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
nmap <Leader>db <Plug>VimspectorBreakpoints

set encoding=utf-8

"set normal backwards delete
set backspace=indent,eol,start
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"set clipboard settings so that can use yank
set clipboard=unnamed
set ma

"keyboard short cut for wrapping word in quotes \q" 
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q( ciw()<Esc>P
nnoremap <Leader>q[ ciw[]<Esc>P
nnoremap <Leader>q{ ciw{}<Esc>P

"setup ale fixers
" let b:ale_fixers = ['isort']

" Set default formatting for vim-python-doc-string
let g:python_style = 'numpy'

" autorun black on save
autocmd BufWritePost *.py execute 'Black'

let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector
" vim spectpor debug baloon shortcut
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)


" NERDTree shortcut
nmap <leader>ne :NERDTreeToggle<cr>

" vim-airline git power bar - add buffer tab functionality, and set so only
" shows end of buffer
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" remove the mode (normal vs insert etc.)
let g:airline_section_a=''
" remove file encoding from status bar
let g:airline_section_y=''
" remove current position from status bar
let g:airline_section_z=''
" remove separators for empty sections
let g:airline_skip_empty_sections = 1
" turn off the whitespace warning
let g:airline#extensions#whitespace#enabled = 0

" Set text width to 79 for python files (can highlight text and use gq to
" autoformat to correct line length)
au BufRead,BufNewFile *.py setlocal textwidth=80

" Use github color scheme
colorscheme github_dark_default
" Over-ride search highlight color
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=Red

" activate vim-matchit (plugin for using % to jump to next div tag)
packadd! matchit

" Set ctrlsf search tool to use current working directory as root for searches
let g:ctrlsf_default_root = 'cwd'

" add line numbers to nerd tree / show bookmarks on startup
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=1

"add ipdb debug
nmap <Leader>pdb iimport<Space>ipdb<Esc>oipdb.set_trace()<Esc>
nmap <Leader>1pdb i<Tab>import<Space>ipdb<Esc>oipdb.set_trace()<Esc>
nmap <Leader>2pdb i<Tab><Tab>import<Space>ipdb<Esc>oipdb.set_trace()<Esc>

" get file path using \cfp
nmap <Leader>cfp :let @+=expand("%:p")<CR>
" get file path using \cfp2
nmap <Leader>cfp2 :let @+=expand("%")<CR>

"buffers key bindings for bufexplorer
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
map <Leader>bfs :BufExplorer<Enter>
map <Leader>bff :bn<Enter>
map <Leader>bfp :bp<Enter>

" HTML Shortcuts
"add autocomplete html using inbuilt vim autocomplete
"use cntl x cntl o to show options
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"only use emmet plug on html
let g:user_emmet_install_global = 0
" set emet shortcut as ,
let g:user_emmet_leader_key=','
autocmd FileType html,css EmmetInstall
" tidy up html file with tidy (vim standard tool)
" short cut th for tidy html
map <Leader>th :!tidy -mi -html -wrap 0 %

" Yoink for pasting reorder
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)
" Set max paste history for yoink to remember
let g:yoinkMaxItems = 40

" mapping to use vim subversive
" r for substitute
nmap r <plug>(SubversiveSubstitute)
nmap rr <plug>(SubversiveSubstituteLine)
nmap R <plug>(SubversiveSubstituteToEndOfLine)

" Vim cutlass - stops delete from saving to register
" As using vim yoink need to add the below to that cuts get added to register
" Note that x has been replaced therefore have to use dl (i.e. delete letter
" instead)
let g:yoinkIncludeDeleteOperations = 1
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D

" Fuzzy search map to cntrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Shortcut to copy file path to clipboard
" This is hackey - it creates new line with file path
" Copies then deletes
nmap <Leader>fp o<c-R><c-%><esc>xx

" save undo-trees in file
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=1000

"###########
"# coc.vim #
"###########

" Coc extensions (need to install yarn or npm, both available in official repo of Arch Linux)
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-css', 
            \ 'coc-html',
            \ 'coc-json', 
            \ 'coc-pyright', 
            \ 'coc-sqlfluff', 
            \ 'coc-sql', 
            \]

" Allow go to definition etc. in coc vim
nmap <silent> gd <Plug>(coc-definition) 
nmap <silent> gy <Plug>(coc-type-definition) 
nmap <silent> gi <Plug>(coc-implementation) 
nmap <silent> gr <Plug>(coc-references)

" This is a very basic configuration - you can do way more than that (but do you really want to?)

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

" Use K to show documentation in preview window
" use cnt+w (twice) to enter preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
"
" You need pip install neovim in any virtualenv for Ultisnips to work
" Force vim to load python3 before python2
if has('python3')
endif

" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"###########
"# Neomake #
"###########

" Needs to install shellcheck and vint: `sudo pacman -S shellcheck vint`

" Neomake signs in the gutter
let g:neomake_error_sign = {'text': '', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
            \   'text': '',
            \   'texthl': 'NeomakeWarningSign',
            \ }
let g:neomake_message_sign = {
            \   'text': '',
            \   'texthl': 'NeomakeWarningSign',
            \ }
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

" update neomake when save file
call neomake#configure#automake('w')

command! -bang -nargs=* -complete=file Make NeomakeProject <args>

" Enable linters
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_vim_enabled_makers = ['vint']
"
"
" Mapping for vim telescope (fuzzy search preview)
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


