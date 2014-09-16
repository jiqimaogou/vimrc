set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 18
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
	" set guifont=Consolas:h11:cANSI
    " set guifont=Inconsolata:h22:cANSI
    set guifont=Anonymous\ Pro:h22:cANSI
  endif
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" 主要方法： 
" 复制后可以使用ctrl-p, ctrl-n,切换粘贴内容。 
Plugin 'YankRing.vim' 
let g:yankring_window_auto_close = 0

" vim-easyclip
" Plugin 'https://github.com/svermeulen/vim-easyclip.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
""" NERDCommenter
Plugin 'The-NERD-Commenter'
let NERDSpaceDelims=1           " place spaces after comment chars

Plugin 'surround.vim'
let g:surround_45 = "<# \r #>"
let g:surround_39 = "`\r^"

Plugin 'camelcasemotion'

" vim-easy-align
Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" vim-move
" https://github.com/matze/vim-move
Bundle 'matze/vim-move'
"<C-k>   Move current line/selections up
"<C-j>   Move current line/selections down
let g:move_key_modifier = 'C'

" EasyMotion
" Type <Leader><Leader>w(<Plug>(easymotion-w)) to trigger the word motion w. 
Plugin 'EasyMotion'

" abolish.vim
Plugin 'abolish.vim'

" vim-bookmarks
Plugin 'MattesGroeger/vim-bookmarks'

" The-NERD-tree
Plugin 'The-NERD-tree'

" taglist
Plugin 'taglist.vim'

" minibufexpl
Plugin 'minibufexpl.vim'
" xptemplate
Plugin 'xptemplate'
Bundle 'djoshea/vim-autoread'
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'easytags.vim'

" ctrlp
Plugin 'ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky']

" Solarized
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
call vundle#end()            " required

syntax enable
set background=light
" set background=dark
colorscheme solarized
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"关闭备份" 
set nobackup
"不产生swp文件" 
set noswapfile
" 说明： 
" 其中 tabstop 表示一个 tab 显示出来是多少个空格的长度，默认 8。 
set tabstop=4
" softtabstop 表示在编辑模式的时候按退格键的时候退回缩进的长度，当使用 expandtab 时特别有用。 
set softtabstop=4
" shiftwidth 表示每一级缩进的长度，一般设置成跟 softtabstop 一样。 
set shiftwidth=4
" 当设置成 expandtab 时，缩进用空格来表示，noexpandtab 则是用制表符表示一个缩进。
" set noexpandtab / expandtab
" Vim默认是对大小写敏感的，下面是让Vim忽略大小写的几种方法： 
:set ignorecase
" encoding 是 Vim 内部使用的字符编码方式。当我们设置了 encoding 之后，Vim 内部所有的 buffer、寄存器、脚本中的字符串等，全都使用这个编码。Vim 在工作的时候，如果编码方式与它的内部编码不一致，它会先把编码转换成内部编码。如果工作用的编码中含有无法转换为内部编码的字符，在这些字符就会丢失。因此，在选择 Vim 的内部编码的时候，一定要使用一种表现能力足够强的编码，以免影响正常工作。
"由于 encoding 选项涉及到 Vim 中所有字符的内部表示，因此只能在 Vim 启动的时候设置一次。在 Vim 工作过程中修改 encoding 会造成非常多的问题。如果没有特别的理由，请始终将 encoding 设置为 utf-8。为了避免在非 UTF-8 的系统如 Windows 下，菜单和系统提示出现乱码，可同时做这几项设置： 
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
" 编码的自动识别是通过设置 fileencodings 实现的，注意是复数形式。fileencodings 是一个用逗号分隔的列表，列表中的每一项是一种编码的名称。当我们打开文件的时候，VIM 按顺序使用 fileencodings 中的编码进行尝试解码，如果成功的话，就使用该编码方式进行解码，并将 fileencoding 设置为这个值，如果失败的话，就继续试验下一个编码。 
"因此，我们在设置 fileencodings 的时候，一定要把要求严格的、当文件不是这个编码的时候更容易出现解码失败的编码方式放在前面，把宽松的编码方式放在后面。 
" 例如，latin1 是一种非常宽松的编码方式，任何一种编码方式得到的文本，用 latin1 进行解码，都不会发生解码失败——当然，解码得到的结果自然也就是理所当然的“乱码”。因此，如果你把 latin1 放到了 fileencodings 的第一位的话，打开任何中文文件都是乱码也就是理所当然的了。 
"以下是滇狐推荐的一个 fileencodings 设置： 
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
" 我们在Linux系统中，使用vi或vim中，要显示行号就使用命令：
set nu  
