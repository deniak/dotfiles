" Search {{{
set incsearch                   "is:    automatically begins searching as you type
set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set hlsearch                    "hls:   highlights search results
" Use ctrl-n to unhighlight search results in normal mode:
nmap <silent> <C-N> :silent noh<CR>
" }}}

" Editing {{{
syntax on                       "syn:   syntax highlighting
set showmatch                   "sm:    flashes matching brackets or parentheses

set nobackup                    "bk:    does not write a persistent backup file of an edited file
set writebackup                 "wb:    does keep a backup file while editing a file

" Searches the current directory as well as subdirectories with commands like :find, :grep, etc.
"set path=.,**

set expandtab                   "et:    uses spaces instead of tab characters
set tabstop=4                   "ts:    number of spaces that a tab counts for
set shiftwidth=4                "sw:    number of spaces to use for autoindent
set autoindent

set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)

"set paste
set pastetoggle=<F5>            "pt:    useful so auto-indenting doesn't mess up code when pasting

" Shortcut to add new blank line without entering insert mode
noremap <CR> :put_<CR>

" A shortcut to show the numbered register contents
map <F2> :reg "0123456789-*+:/<CR>

" Toggle hidden characters display
map <silent> <F6> :set nolist!<CR>:set nolist?<CR>
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:$ " Highlight problematic whitespace"

" Toggle spell-checking
map <silent> <F8> :set nospell!<CR>:set nospell?<CR>

" Maps Omnicompletion to CTRL-space since ctrl-x ctrl-o is for Emacs-style RSI
inoremap <Nul> <C-x><C-o>
" }}}

" Folding (spacebar toggles) {{{
" Spacebar toggles a fold, zi toggles all folding, zM closes all folds

noremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

set foldmethod=marker           "fdm:   looks for patterns of triple-braces in a file
"set foldcolumn=2                "fdc:   creates a small left-hand gutter for displaying fold info
"  }}}

" Window Layout {{{
"set number                      "nu:    numbers lines
set showmode                    "smd:   shows current vi mode in lower left
set cursorline                  "cul:   highlights the current line
set showcmd                     "sc:    shows typed commands
set cmdheight=2                 "ch:    make a little more room for error messages
set laststatus=2                "ls:    makes the status bar always visible
set ttyfast                     "tf:    improves redrawing for newer computers
set noerrorbells
set visualbell
set t_vb=
" }}}

" Multi-buffer/window/tab editing {{{
set showtabline=1               "stal:  Display the tabbar if there are multiple tabs. Use :tab ball or invoke Vim with -p

set splitright                  "spr:   puts new vsplit windows to the right of the current
set splitbelow                  "sb:    puts new split windows to the bottom of the current

" Type <F1> followed by a buffer number or name fragment to jump to it.
" Also replaces the annoying help button. Based on tip 821.
map <F1> :ls<CR>:b<Space>
" }}}

" X11 Integration {{{
" set mouse=                      "       Disable mouse control for console Vim (very annoying)
" set clipboard=                  "       Disable automatic X11 clipboard crossover
" }}}

" Bundle {{{
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

" Github bundles
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'spf13/vim-autoclose'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
" Writing {{{
Bundle 'reedes/vim-litecorrect'
Bundle 'reedes/vim-textobj-sentence'
Bundle 'reedes/vim-textobj-quote'
Bundle 'reedes/vim-wordy'
" }}}
" Snippets & AutoComplete {{{
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'honza/vim-snippets'
"}}}
" HTML {{{
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'tpope/vim-haml'
" }}}
" Javascript {{{
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
Bundle 'kchmck/vim-coffee-script'
" }}}
" Git {{{
Bundle 'tpope/vim-fugitive'
" }}}

call vundle#end()
filetype plugin indent on
" }}}

 " Color {{{
set t_Co=256
color desert
" let g:solarized_termcolors=256
" let g:solarized_contrast="high"
" set background=dark
" color solarized

" Bold the cursorline instead of underlying
hi CursorLine cterm=bold

" Statusline
hi StatusLine term=bold,reverse cterm=bold ctermfg=7 ctermbg=none
hi StatusLineNC term=reverse cterm=bold ctermfg=8
" }}}

" vim-airline - statusbar {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'badwolf'

let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols_linenr = '␊'
let g:airline_symbols_linenr = '␤'
let g:airline_symbols_linenr = '¶'
let g:airline_symbols_branch = '⇒'
let g:airline_symbols_paste = 'ρ'
let g:airline_symbols_whitespace = 'Ξ'
" vim-powerline symbols
let g:airline_branch_prefix     = '⇒'
" }}}

" Autocommands, plugin, and file-type-specific settings {{{
" Auto-set certain options as well as syntax highlighting and indentation
filetype plugin indent on

let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Set Omnicompletion for certain filetypes
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" set cursor to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" }}}

" Snippets {{{
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:go_snippet_engine = "neosnippet"
set completeopt-=preview
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>""
" }}}

" {{{ Mappings for the ToggleComment Plugin
noremap <silent> ,# :call CommentLineToEnd('# ')<CR>+
noremap <silent> ,/ :call CommentLineToEnd('// ')<CR>+
noremap <silent> ," :call CommentLineToEnd('" ')<CR>+
noremap <silent> ,; :call CommentLineToEnd('; ')<CR>+
noremap <silent> ,- :call CommentLineToEnd('-- ')<CR>+
noremap <silent> ,* :call CommentLinePincer('/* ', ' */')<CR>+
noremap <silent> ,< :call CommentLinePincer('<!-- ', ' -->')<CR>+
" }}}
