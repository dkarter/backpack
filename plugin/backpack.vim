" Settings for pairing nicely with others
" Last Change: Sun 19 Feb 2017
" Maintainer: Dorian Karter
" License: MIT

scriptencoding utf-8

" Prevent execution if already loaded ------------------   {{{
if exists('g:loaded_dorians_backpack')
  finish
endif
let g:loaded_dorians_backpack = 1
" Prevent execution if already loaded ------------------   }}}

" Behavior mod {{{
set ignorecase   " ignore case in searches
set smartcase    " will use case sensitive if capital letter present or \C
set expandtab    " insert tab with right amount of spacing
set magic        " Use 'magic' patterns (extended regular expressions).
set textwidth=80 " max line width
" }}}

" Make it obvious where 80 characters is
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(80,999),',')

" rename current file
  nnoremap <Leader>rn :Move <C-R>=expand("%")<CR>

" replace word under cursor, globally, with confirmation
  nnoremap <Leader>k :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
  vnoremap <Leader>k y :%s/<C-r>"//gc<Left><Left><Left>

" ====================================
" Deoplete:
" ====================================

let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
         \ pumvisible() ? "\<C-n>" :
         \ <SID>check_back_space() ? "\<TAB>" :
         \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~? '\s'
endfunction

" ====================================
" Vim multiple cursors + DEOPLETE:
" ====================================
augroup VimMultiCursors
  autocmd!
  autocmd User MultipleCursorsPre let g:deoplete#disable_auto_complete=1
  autocmd User MultipleCursorsPost let g:deoplete#disable_auto_complete=0
augroup END

" ====================================
" Neosnippet:
" ====================================

let g:neosnippet#enable_completed_snippet = 1

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_snipmate_compatibility = 1

" Matchup
let g:matchup_matchparen_status_offscreen = 0

" NERDTree
let NERDTreeIgnore=['\.vim$', '\~$', '\.beam', 'elm-stuff']
nnoremap <Leader>nt :NERDTreeToggle<CR>


"Neovim

if has('nvim')
  " set cursor modes
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
        \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
        \,sm:block-blinkwait175-blinkoff150-blinkon175

  " interactive find replace preview
  set inccommand=nosplit

  " Navigate neovim + neovim terminal emulator with alt+direction
  tnoremap <c-h> <C-\><C-n><C-w>h
  tnoremap <c-j> <C-\><C-n><C-w>j
  tnoremap <c-k> <C-\><C-n><C-w>k
  tnoremap <c-l> <C-\><C-n><C-w>l

  " easily escape terminal
  tnoremap <leader><esc> <C-\><C-n><esc><cr>
  tnoremap <C-o> <C-\><C-n><esc><cr>
endif

" ======================================
" FZF
" ======================================
  let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --color=always --exclude .git --ignore-file ~/.gitignore'
  let $FZF_DEFAULT_OPTS='--ansi'
  let g:fzf_files_options = '--preview "(bat --color \"always\" --line-range 0:100 {} || head -'.&lines.' {})"'

  command! -bang -nargs=* FzfRg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  nnoremap <silent> <C-p> :Files<CR>
  nnoremap <silent> <C-b> :Buffers<CR>
  nnoremap <silent> <C-g>g :FzfRg!<CR>
  nnoremap <silent> <leader><leader> :Commands<CR>

" open editing file
  nnoremap <silent> <leader>vr :call OpenConfigFile('~/.vimrc')<cr>
  nnoremap <silent> <leader>vb :call OpenConfigFile('~/.vimrc.bundles')<cr>

" Pasting support
  " Press F2 in insert mode to preserve tabs when pasting from clipboard into
  " terminal (not necessary in NeoVim)
  set pastetoggle=<F2>

" re-indent file and jump back to where the cursor was
  map <F7> mzgg=G`z

" Allow j and k to work on visual lines (when wrapping)
  nnoremap k gk
  nnoremap j gj

" copy to end of line
  nnoremap Y y$

" copy to system clipboard
  noremap gy "+y

" copy whole file to system clipboard
  nnoremap gY gg"+yG

" Switch between the last two files with tab tab
  nnoremap <tab><tab> <c-^>

" Search for selected text
  vnoremap * "xy/<C-R>x<CR>

" ====================================
" indentLine
" ====================================
  let g:indentLine_fileType = [
        \ 'java',
        \ 'ruby',
        \ 'elixir',
        \ 'javascript',
        \ 'javascript.jsx',
        \ 'html',
        \ 'eruby',
        \ 'vim'
        \ ]

  let g:indentLine_char = '│'
  let g:indentLine_color_term = 238
  let g:indentLine_color_gui = '#454C5A'

" Incsearch Vim Plugin
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

" Index ctags from any project, including those outside Rails
  map <Leader>ct :!ctags -R .<CR>

" Map space as alias for leader
  nmap <space> \

" clear highlight when pressing esc in normal mode
  nmap <silent> <esc> :nohlsearch<cr>

" sort selected lines
  vmap <silent> gs :sort<cr>
