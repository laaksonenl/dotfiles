call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'                                         " git plugin
Plug 'vim-airline/vim-airline'                                    " bottom status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder conf
Plug 'junegunn/fzf.vim'                                           " fuzzy finder
Plug 'scrooloose/nerdtree'                                        " folders tree
Plug 'scrooloose/nerdcommenter'                                   " code commenter
Plug 'sickill/vim-monokai'																				" Color theme
Plug 'joshdick/onedark.vim'																				" Color theme
Plug 'arzg/vim-colors-xcode'																			" Color theme
Plug 'jaredgorski/spacecamp'																			" Color theme
Plug 'kien/rainbow_parentheses.vim'                               " for nested parentheses
Plug 'tpope/vim-surround'                                         " quickly edit surroundings (brackets, html tags, etc)
Plug 'junegunn/vim-easy-align'                                    " alignment plugin
Plug 'neomake/neomake'                                            " run programs asynchronously and highlight errors
Plug 'neoclide/coc.nvim', {'branch': 'release'}										" LSP client + autocompletion plugin
Plug 'sheerun/vim-polyglot'																				" language pack
Plug 'vuciv/vim-bujo'																							" TODO list
Plug 'itchyny/lightline.vim'                                      " configurable status line (can be used by coc)
Plug 'jremmen/vim-ripgrep'                                        " blazing fast search using ripgrep
Plug 'stefandtw/quickfix-reflector.vim'                           " make modifications right in the quickfix window
Plug 'Xuyuanp/nerdtree-git-plugin'                                " shows files git status on the NerdTree
Plug 'dyng/ctrlsf.vim'																						" search in files
Plug 'ianks/vim-tsx'																							" tsx syntax coloring
Plug 'leafgarland/typescript-vim'																	" typescript syntax coloring
Plug 'christoomey/vim-tmux-navigator'															" seamless navigation between tmux and vim
Plug 'ryanoasis/vim-devicons'																			" icons for files by type
Plug 'alvan/vim-closetag'																					" Autoclose HTML tags
Plug 'airblade/vim-gitgutter'																			" Show git diff rows
Plug 'jreybert/vimagit'																						" Stage git diff and commit
Plug 'nathanaelkane/vim-indent-guides'														" Indentation guides
Plug 'easymotion/vim-easymotion'																	" Fast move just like tmux finger plugin
Plug 'tpope/vim-sensible'																					" Some default settings everyone should use
Plug 'lervag/vimtex'

" Python
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'kh3phr3n/python-syntax'


call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let mapleader=" "

" Config edit
nnoremap <leader>rc :e ~/.vimrc<CR>
nnoremap <leader><CR> :source ~/.vimrc<CR>

" Registerextensions
let g:coc_global_extensions = [
	\ 'coc-metals',
	\	'coc-tslint-plugin',
	\	'coc-tsserver',
	\	'coc-emmet',
	\	'coc-css',
	\	'coc-html',
	\	'coc-json',
	\	'coc-yank',
	\	'coc-prettier',
	\	'coc-highlight',
	\ 'coc-python'
	\ ]

" TypeScript
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" save when leaving insert mode
" autocmd InsertLeave * write

" Ripgrep
" ripgrep smartcase (search with case insensitive)
" let g:rg_command = 'rg --vimgrep -S -g "!{node_modules,.git,.hg,*.js.map}"'
let g:rg_command = 'rg --vimgrep -S'

" airline: status bar at the bottom
let g:airline_powerline_fonts=1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Highlighting for jsonc filetype
autocmd FileType json syntax match Comment +\/\/.\+$+

" Nerd commenter
filetype plugin on

" Better Unix support
set viewoptions=folds,options,cursor,unix,slash
set encoding=utf-8

" Open new tab with Ctrl+t
nnoremap <C-t> :tabnew<CR>
" Open new split
nnoremap <leader>v :vnew<CR>

" Navigate between tabs
nnoremap H gT
nnoremap L gt

" Navigate splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Moving
nnoremap <M-H> <C-w>H
nnoremap <M-J> <C-w>J
nnoremap <M-K> <C-w>K
nnoremap <M-L> <C-w>L
nnoremap <M-x> <C-w>x

" Resizing
"
nnoremap <C-<> :vertical resize +5<CR>

nnoremap ^[+ :vertical resize +5
"nnoremap ^[+ <C-w>+
"nnoremap ^[- <C-w>-
"nnoremap ^[< <C-w><
"nnoremap ^[> <C-w>>

" Toggle search highlighting
nnoremap <C-x> :set hlsearch!<CR>

" Terminal mode exit shortcut
:tnoremap <Esc> <C-\><C-n>

" Nerdtree git plugin symbols

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "ᵐ",
    \ "Staged"    : "ˢ",
    \ "Untracked" : "ᵘ",
    \ "Renamed"   : "ʳ",
    \ "Unmerged"  : "ᶴ",
    \ "Deleted"   : "ˣ",
    \ "Dirty"     : "˜",
    \ "Clean"     : "ᵅ",
    \ "Unknown"   : "?"
    \ }

let NERDTreeIgnore = ['\.js\.map', 'node_modules', 'ext-libs', 'target']
let NERDTreeShowHidden=1
map <leader>ne :NERDTreeToggle<CR>
map <C-g> :NERDTreeFind<CR>

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

function! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

command! TrimWhitespace call TrimWhitespace() " Trim whitespace with command
autocmd BufWritePre * :call TrimWhitespace()  " Trim whitespace on every save

" Non-mapped function for tab toggles
function! TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunc

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Other options
set backspace=2

syntax on
" Syntax highlighting from start of the file
autocmd BufEnter * :syntax sync fromstart

set t_Co=256
set shell=/bin/bash
set laststatus=2
set noshowmode

" Draw a line at 120 columns
" set colorcolumn=120
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Fixes broken cursor on Linux
" set guicursor=

" NerdTree config
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize=50

" General editor options
set noswapfile
set autoindent
set smartindent
set hidden                  " Hide files when leaving them.
set number                  " Show line numbers.
set numberwidth=1           " Minimum line number column width.
set relativenumber
set cmdheight=2             " Number of screen lines to use for the commandline.
set textwidth=120           " Lines length limit (0 if no limit).
set formatoptions=jtcrq     " Sensible default line auto cutting and formatting.
set linebreak               " Don't cut lines in the middle of a word .
set showmatch               " Shows matching parenthesis.
set matchtime=2             " Time during which the matching parenthesis is shown.
set listchars=tab:▸\ ,eol:¬ " Invisible characters representation when :set list.
set clipboard=unnamedplus   " Copy/Paste to/from clipboard
set cursorline              " Highlight line cursor is currently on
set completeopt+=noinsert   " Select the first item of popup menu automatically without inserting it
set noerrorbells
set smartcase

nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

let g:onedark_color_overrides = {
	\ "black": {"gui": "#2F343F", "cterm": "235" },
	\ "purple": { "gui": "#F678DF", "cterm": "125" },
	\ "blue": { "gui": "#5F87D7", "cterm": "75" }
	\}

colorscheme onedark
"colorscheme monokai
"colorscheme xcodedarkhc
set background=dark " Color adapted to dark background.

" Search
set incsearch  " Incremental search.
set ignorecase " Case insensitive.
set smartcase  " Case insensitive if no uppercase letter in pattern, case sensitive otherwise.
set nowrapscan " Don't go back to first match after the last match is found.

" Fold
" set foldmethod=indent
" set foldlevelstart=1

" Tabs
set noexpandtab     " Tab transformed in spaces
set tabstop=2     " Sets tab character to correspond to x columns.
                  " x spaces are automatically converted to <tab>.
                  " If expandtab option is on each <tab> character is converted to x spaces.
set softtabstop=2 " column offset when PRESSING the tab key or the backspace key.
set shiftwidth=2  " column offset when using keys '>' and '<' in normal mode.

" Toggle display of tabs and EOF
"nnoremap <leader>l :set list!<CR>

" Auto-commands
" Vimscript
augroup vimscript_augroup
  autocmd!
  autocmd FileType vim nnoremap <buffer> <M-z> :execute "help" expand("<cword>")<CR>
augroup END

" Spell check for markdown files
au BufNewFile,BufRead *.md set spell

" Fuzzy finder shortcut
"nnoremap <C-p> :FZF<CR>
nnoremap <C-p> :Files<CR>

" Disable arrow keys and page up / down
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
"noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
"inoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
"vnoremap <Right> <nop>
noremap <PageUp> <nop>
inoremap <PageUp> <nop>
vnoremap <PageUp> <nop>
noremap <PageDown> <nop>
inoremap <PageDown> <nop>
vnoremap <PageDown> <nop>

" Disable mouse / touchpad (only in vim)
set mouse=nicr
inoremap <ScrollWheelUp> <nop>
inoremap <S-ScrollWheelUp> <nop>
inoremap <C-ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>
inoremap <S-ScrollWheelDown> <nop>
inoremap <C-ScrollWheelDown> <nop>
inoremap <ScrollWheelLeft> <nop>
inoremap <S-ScrollWheelLeft> <nop>
inoremap <C-ScrollWheelLeft> <nop>
inoremap <ScrollWheelRight> <nop>
inoremap <S-ScrollWheelRight> <nop>
inoremap <C-ScrollWheelRight> <nop>

" vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" ------------------- COC config -----------------------

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nnoremap <leader>qc <Plug>(coc-codeaction)

" Remap for do action format
"nmap <silent> F <Plug>(coc-action-format) "does not work
nnoremap <silent> F :call CocAction('format')<CR>

" Show signature help
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if &filetype == 'vim'
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <leader>l  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
nnoremap <silent> <leader>c  :<C-u>CocCommand<CR>
" Resume latest coc list
" nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

" close preview (shown for hover / signature help)
nnoremap <leader> <Esc> :pclose<CR>

" Remap keys for applying codeAction to the current line.
"nmap <space>qc  <Plug>(coc-codeaction)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Apply AutoFix to problem on the current line.
"nmap <silent> <leader>f <Plug>(coc-fix-current)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)

nmap <silent> <leader>p <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>n <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <C-space> coc#refresh()

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><noait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" COC Snippets

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
"
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:python3_host_prog='/home/late/tools/anaconda3/bin/python3'

" let g:ags_agexe = 'rg'

let g:ags_agargs = {
  \ '--column'         : ['', ''],
  \ '--line-number'    : ['', ''],
  \ '--context'        : ['g:ags_agcontext', '-C'],
  \ '--max-count'      : ['g:ags_agmaxcount', ''],
  \ '--heading'        : ['',''],
  \ '--smart-case'     : ['','-S'],
  \ '--color'          : ['always',''],
  \ '--colors'         : [['match:fg:green', 'match:bg:black', 'match:style:nobold', 'path:fg:red', 'path:style:bold', 'line:fg:black', 'line:style:bold'] ,''],
  \ }

" Search for the word under cursor
" nnoremap <leader>s :Ags<Space><C-R>=expand('<cword>')<CR><CR>
" Search for the visually selected text
" vnoremap <leader>vs y:Ags<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
" Run Ags
" nnoremap <leader>a :Ags<Space>
" Quit Ags
" nnoremap <leader><leader>a :AgsQuit<CR>

let g:ctrlsf_search_mode = 'async'

map <C-F> <Nop>
nmap     <C-F>f <Plug>CtrlSFPrompt
"vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>f <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Disable annoying alert sounds
set visualbell
set t_vb=

" Override completition colors
highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
highlight CocWarningHighlight ctermfg=Yellow  guifg=#ff0000
highlight CocHighlightText  ctermfg=Green  guifg=#00ff00
highlight CocHighlightRead  ctermfg=Green  guifg=#00ff00
highlight CocHighlightWrite  ctermfg=Green  guifg=#00ff00

" Toggle panel with Tree Views
"nnoremap <silent> <leader>t :<C-u>CocCommand metals.tvp<CR>
nnoremap <silent> <C-i> :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <leader>b :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
"nnoremap <silent> <leader>c :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <leader>r :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>

" Fast buffer switching
nnoremap <C-e> :buffers<CR>:buffer<space>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>

" Copy filepath to clipboard
nmap cp :let @" = expand("%")<cr>

" Reload vim configuration
nnoremap <leader><CR> :source ~/.vimrc<CR>

" Todo list mappings
nmap <C-S> <Plug>BujoAddnormal
imap <C-S> <Plug>BujoAddinsert
nmap <C-Q> <Plug>BujoChecknormal
imap <C-Q> <Plug>BujoCheckinsert

" replace all occurences of selection
vnoremap <leader>ra y:%s/<C-r><C-r>"//g<Left><Left>
" find/replace in line selection
xnoremap <leader>ra :s//g<Left><Left>

" integrated terminal
nnoremap <leader>t :bo term ++rows=10<CR>

" reload file automatically
set autoread

" scroll near top / bottom
set scrolloff=5

" Set delay of file tracking to 100ms
set updatetime=100

" Enable indenttation guides on startup
let g:indent_guides_enable_on_vim_startup = 0

" FZF
nnoremap <Leader>or :History<CR>
" open lines (as `open to`)
nnoremap <Leader>ot :Lines<CR>
" open file
nnoremap <Leader>of :Files<CR>
" open buffers
nnoremap <Leader>ob :Buffers<CR>

" Blackhole buffers
nmap <leader>d "_d
"nmap <leader>c "_c

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

nmap <Right> :vertical resize +5<CR>
nmap <Left> :vertical resize -5<CR>

set splitright

let g:python3_host_prog = "/usr/bin/python3"
command PrettyJson :%!python -m json.tool

noremap ää :update<CR>

" Auto open NerdTree
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | :vertical resize 60 | endif
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

noremap fm <C-w>=

" Use CTRL+c to copy to system clipboard
noremap <C-c> "+y e

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
hi MatchParen				ctermbg=white

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
