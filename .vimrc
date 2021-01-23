set number
set encoding=utf-8
set mouse=a
set wildmenu
set lazyredraw
set showmatch
set laststatus=2
set ruler
set visualbell
syntax enable
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set cursorline

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
