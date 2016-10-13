" Settings for pairing nicely with others
" Last Change:  Wed 12 Oct 2016
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
set gdefault     " Use 'g' flag by default with :s/foo/bar/.
set magic        " Use 'magic' patterns (extended regular expressions).
" }}}

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" Pasting support
set pastetoggle=<F2>  " Press F2 in insert mode to preserve tabs when pasting from clipboard into terminal

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

" FZF shortcuts
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g>g :Ag<CR>
nnoremap <leader><leader> :Commands<CR>

" Incsearch Vim Plugin
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" CtrlSF shortcuts
nnoremap <C-F>f :CtrlSF
nnoremap <C-F>g :CtrlSF<CR>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Map space as alias for leader
nmap <space> \

" Coverage via Cadre + github.com/killphi/vim-legend
let g:legend_active_auto = 0
let g:legend_hit_color = 'ctermfg=64 cterm=bold gui=bold guifg=Green'
let g:legend_ignored_sign = '◌'
let g:legend_ignored_color = 'ctermfg=234'
let g:legend_mapping_toggle = '<Leader>cv'
let g:legend_mapping_toggle_line = '<localleader>cv'
