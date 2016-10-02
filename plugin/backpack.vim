" Settings for pairing nicely with others
" Last Change:  Sun 2 Oct 2016
" Maintainer: Dorian Karter
" License: MIT

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

" Allow j and k to work on visual lines (when wrapping)
nnoremap k gk
nnoremap j gj

" copy to end of line
nnoremap Y y$
" copy to system clipboard
noremap gy "*y
" copy whole file to system clipboard
nnoremap gY gg"*yG

" FZF shortcuts
nnoremap <C-p> :FZF<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-m> :Maps<CR>
nnoremap <leader><leader> :Commands<CR>

" Incsearch Vim Plugin
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" highlight fenced code blocks in markdown
let g:markdown_fenced_languages = [
      \ 'html',
      \ 'elm',
      \ 'vim',
      \ 'js=javascript',
      \ 'python',
      \ 'ruby',
      \ 'sql',
      \ 'bash=sh'
      \ ]

" Map space as alias for leader
nmap <space> \
