" ~/.vimrc
"
" Global configuration file for vim.


" Automatically load all plugins in the ``~/.vim/bundle`` directory.
call pathogen#runtime_append_all_bundles()

" Automatically load all ftdetect files from our plugins.
filetype off
filetype plugin indent on
filetype on

" Set a colorscheme.
colorscheme ron

" Underline the cursor line (to make spotting movement easier).
set cul

" Folding settings (we use indentation by default).
set fdm=indent
set foldminlines=4

" Show trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Use the same symbols as TextMate for tabstops and EOLs.
set listchars=tab:▸\ ,eol:¬

" Highlight all search results.
set hls

" Search incrementally, while ignoring case (unless we use caps).
set is
set ic
set scs

" Allow liberal use of hidden buffers.
set hidden

" Enable python syntax highlighting (from the ``vim-python`` plugin.)
let python_highlight_all = 1

" Setup a custom statusline (at the bottom of the screen). The status line
" shows:
" 	- filetype detected by vim
" 	- current git branch
" 	- line number, total lines, cursor position, % of file
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [BRANCH=%{fugitive#statusline()}]\ [LINE=%l/%L:%v][%p%%]
set laststatus=2

" vim-fugitive key mappings:
map <C-G>s :Gstatus<cr>
map <C-G>e :Gedit<cr>
map <C-G>d :Gdiff<cr>
map <C-G>c :Gcommit<cr>
map <C-G>bl :Gblame<cr>
map <C-G>br :Gbrowse<cr>
map <C-G>m :Gmove
map <C-G>r :Gremove
map <C-G>p :Git push<cr>
map <C-G>l :Glog<cr>

" vim-nerdtree key mappings:
map <C-N> :NERDTreeToggle<cr>

" Remove all trailing whitespace:
map <C-R>s :%s/\s\+$//e<cr>

" Convert all tabs appropriately:
map <C-R>t :set expandtab<cr>:%retab!<cr>

" Shortcut to rapidly toggle `set list`.
nmap <C-L> :set list!<cr>

" Bubble single and multiple lines (uses vim-unimpaired plugin).
nmap <C-J> [e
nmap <C-K> ]e
vmap <C-J> [egv
vmap <C-K> ]egv
