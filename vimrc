" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

"Q 格式化文本
"—g 可视模式下复制并搜索其在c文件的出现
":Diff0rig 打开一个新窗口，加载原始文件内容，并与当前缓冲区进行比较。
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" 设置行号
set number

" 启用文件类型检测和插件
 filetype plugin on


" 设置缩进为2个格
set tabstop=2
set shiftwidth=2
set expandtab


" 设置不区分大小写的搜索
set ignorecase


" plugin {{{1


" mapping{{{1
let g:mapleader = ';'
nnoremap \ ;

inoremap jf <esc>

" switch comma-separated arguments
nnoremap [w  :normal F,h]w2w<cr>
nnoremap ]w  :let s=&isk \| setl isk+=\",' \| exe "norm diwmmebgPdw'mP" \| let &isk=s<cr>

" paragraph function block
nnoremap }   }zz
nnoremap {   {zz
nnoremap ]]  ]]zz
nnoremap [[  [[zz
nnoremap []  []zz
nnoremap ][  ][zz

nnoremap g;  g;zvzz
nnoremap g,  g,zvzz

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap <left>   <c-w>>
nnoremap <right>  <c-w><
nnoremap <up>     <c-w>-
nnoremap <down>   <c-w>+

" quickly open files{{{1
nnoremap <leader>ev :edit $MYVIMRC<cr>


nnoremap <leader>m  :Messages<cr>
nnoremap <leader>M  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
" nnoremap <leader>o  :!echo `git url`/blob/`git rev-parse --abbrev-ref
" HEAD`/%\#L<C-R>=line('.')<cr> \| xargs open<cr><cr>
nnoremap <leader>o  :silent !open <c-r>=fnameescape('<c-r><c-a>')<cr><cr>
nnoremap <leader>w  :update<cr>
nnoremap <leader>x  :xit<cr>
