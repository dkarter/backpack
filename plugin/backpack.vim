" Settings for pairing nicely with others
" Last Change: Tue 1 Nov 2016
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
set textwidth=80 " max line width
" }}}


" Make it obvious where 80 characters is
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(80,999),',')

" NERDTree
let NERDTreeIgnore=['\.vim$', '\~$', '\.beam', 'elm-stuff']
nnoremap <Leader>nt :NERDTreeToggle<CR>

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g>g :Ag<CR>
nnoremap <leader><leader> :Commands<CR>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[]
let g:syntastic_html_tidy_ignore_errors = [
    \ ' proprietary attribute \"ng-',
    \  'plain text isn''t allowed in <head> elements',
    \  '<base> escaping malformed URI reference',
    \  'discarding unexpected <body>',
    \  'escaping malformed URI reference',
    \  'trimming empty <i>',
    \  '</head> isn''t allowed in <body> elements'
    \ ]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
let g:syntastic_ruby_mri_exec='~/.rvm/rubies/ruby-2.2.2/bin/ruby'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_shell = '/bin/sh'
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_cucumber_cucumber_args = '--profile syntastic'
let g:syntastic_cucumber_cucumber_exe = 'bin/cucumber'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_vim_checkers = ['vint']

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

" Switch between the last two files with tab tab
nnoremap <tab><tab> <c-^>

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
