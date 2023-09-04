{ pkgs, ... }:

{
  enable = true;
  vimAlias = true;

  coc = {
    enable = true;

    pluginConfig = ''
      "CoC Settings
      " Use tab for trigger completion with characters ahead and navigate.
      " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
      " other plugin before putting this into your config.
      inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

      function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      " Make <CR> to accept selected completion item or notify coc.nvim to format
      " <C-g>u breaks current undo, please make your own choice.
      inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
      "Ultisnips Settings
      let g:UltiSnipsExpandTrigger="<tab>"
      let g:UltiSnipsJumpForwardTrigger="<c-b>"
      let g:UltiSnipsJumpBackwardTrigger="<c-z>"

      " If you want :UltiSnipsEdit to split your window.
      let g:UltiSnipsEditSplit="vertical"

      "coc-snippets Settings
      "inoremap <silent><expr> <TAB>
      "      \ coc#pum#visible() ? coc#_select_confirm() :
      "      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',\'\'])\<CR>" :
      "      \ CheckBackspace() ? "\<TAB>" :
      "      \ coc#refresh()
      "
      "function! CheckBackspace() abort
      "  let col = col('.') - 1
      "  return !col || getline('.')[col - 1]  =~# '\s'
      "endfunction
      "
      "let g:coc_snippet_next = '<tab>'
    '';

    settings = {
      languageserver = {
        nix = {
          command = "rnix-lsp";
          filetypes = [ "nix" ];
          rootPatterns = [ "flake.nix" ];
        };
      };
    };
  };

  extraConfig = ''    

    """"""""""""""""""""""""""""""""""""""
    " => Settings
    """""""""""""""""""""""""""""""""""""""
    set clipboard=unnamedplus
    set number relativenumber
    set encoding=UTF-8
    set autoindent
    set smartindent
    set nocompatible
    filetype plugin on
    autocmd BufNew,BufRead *.S set ft=asm
    augroup initial_fold
        autocmd!
        autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
    augroup END

    """""""""""""""""""""""""""""""""""""""
    " => Code sytling
    """""""""""""""""""""""""""""""""""""""
    set tabstop=4
    set shiftwidth=4
    set expandtab

    let g:rainbow_active = 1

    let g:clang_format#detect_style_file = 1
    let g:clang_format#enable_fallback_style = 0
    nmap <Leader>c :ClangFormat<CR>

    """"""""""""""""""""""""""""""""""""""
    " => File explorer   
    """""""""""""""""""""""""""""""""""""""
    :nnoremap <C-e> :NERDTreeToggle<CR>
    :nnoremap <C-p> :FZF<CR>

    """""""""""""""""""""""""""""""""""""""
    " => Theme
    """""""""""""""""""""""""""""""""""""""
    syntax on
    set t_Co=256
    set termguicolors
    "sonokai
    set background=dark
    colorscheme sonokai
    let g:airline_theme = "sonokai"

    """""""""""""""""""""""""""""""""""""""
    " => Keymaps
    """""""""""""""""""""""""""""""""""""""
    "Some key remap
    inoremap jj <Esc>
    let mapleader = "," 
    nnoremap <C-j> <C-w>j
    nnoremap <C-h> <C-w>h
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    
    nnoremap <C-left> :tabprevious<CR>
    nnoremap <C-Right> :tabnext<CR>
    nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
    nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

    nnoremap <silent> <Leader>= :exe "vertical resize +5"<CR>
    nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>

    """""""""""""""""""""""""""""""""""""""
    " Vimtex
    """""""""""""""""""""""""""""""""""""""
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal='abdmg'
    let g:vimtex_compiler_method = 'tectonic'
    
    """""""""""""""""""""""""""""""""""""""
    " NerdCommenter
    """""""""""""""""""""""""""""""""""""""
    " Create default mappings
    let g:NERDCreateDefaultMappings = 1

    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    '';

  plugins = with pkgs.vimPlugins; [
    # Themes
    vim-airline
    vim-airline-themes
    palenight-vim
    sonokai
    # Utility
    vim-polyglot
    rainbow
    vimtex
    vim-css-color
    vim-clang-format
    nerdtree
    nerdcommenter
    fzf-vim
    coc-pairs
    coc-clangd
    coc-markdownlint
    coc-prettier
    coc-java
    coc-snippets
    coc-yaml
    coc-pyright
    coc-tsserver
    coc-json
    coc-sh
    coc-docker
    coc-rust-analyzer
    copilot-vim
    DoxygenToolkit-vim
  ];

}

