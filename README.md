# 🎒 BACKPACK.VIM

When you go pairing don't forget to bring your backpack.


Add these plugins to your vim bundle

```vim
" Dorian's Backpack
Plug 'dkarter/backpack'

" Warm fuzzy feelings
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Better :Gitv!
Plug 'junegunn/gv.vim'

" use multiple cursors to edit multiple things
Plug 'terryma/vim-multiple-cursors'

" the official tree of nerds
Plug 'scrooloose/nerdtree'

" incremental search when pressing tab during search
Plug 'haya14busa/incsearch.vim'

" Highlight Yanked String - NEOVIM ONLY
Plug 'machakann/vim-highlightedyank'

" replacement for matchit
Plug 'andymass/vim-matchup'

" Indent lines (visual indication)
Plug 'Yggdroot/indentLine'

" Auto close matching pairs {} \"\", etc..
Plug 'jiangmiao/auto-pairs'

" RipGrep - grep is dead. All hail the new king RipGrep.
Plug 'jremmen/vim-ripgrep'

" Deoplete: {{{
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/neco-vim', { 'for': 'vim' }
  Plug 'fszymanski/deoplete-emoji'
  Plug 'zchee/deoplete-go'
  Plug 'wokalski/autocomplete-flow'

  " For func argument completion
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'

  " include ctags for deoplete
  Plug 'Shougo/neoinclude.vim'

  " ruby sources for deoplete
  Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
" }}}
```

Install fzf from homebrew:

```sh
brew install fzf
```

Install rubocop

```sh
gem install rubocop
```

Install Rougify

```sh
gem install rouge
```
