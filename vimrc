call plug#begin('~/.vim/bundle')

call plug#end()

set nocompatible
"set number
set relativenumber

set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab

if has("vms")
  set nobackup
else
  set backup
endif

set backupdir=/tmp,.
set directory=/tmp,.

set history=50
set ruler
set showcmd

syntax enable

set laststatus=2

set path+=**		" Search in subfolders

set wildmenu

let g:netrw_preview=1     " Vertical preview window
let g:netrw_banner=1      " Hide banner
"let g:netrw_altv="&spl"
"let g:netrw_browse_split=2
let g:netrw_winsize=-40
let g:netrw_liststyle=3
let g:netrw_localrmdir="rm -r"
let  g:netrw_localcopycmd="cp"
let g:netrw_keepdir=0
" Toggle Vexplore with Ctrl-E
function! ToggleLexplore()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Lexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleLexplore()<CR>

filetype plugin indent on	" for omni completion

" Snippets
autocmd FileType php abbr afre foreach ( as ) {<CR>}<ESC>O<ESC>kf(a
autocmd FileType php abbr afr for ($i=0; $i < $length; $i++) {<CR>}<ESC>O


