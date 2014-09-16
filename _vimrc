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

" ��Ҫ������ 
" ���ƺ����ʹ��ctrl-p, ctrl-n,�л�ճ�����ݡ� 
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
"�رձ���" 
set nobackup
"������swp�ļ�" 
set noswapfile
" ˵���� 
" ���� tabstop ��ʾһ�� tab ��ʾ�����Ƕ��ٸ��ո�ĳ��ȣ�Ĭ�� 8�� 
set tabstop=4
" softtabstop ��ʾ�ڱ༭ģʽ��ʱ���˸����ʱ���˻������ĳ��ȣ���ʹ�� expandtab ʱ�ر����á� 
set softtabstop=4
" shiftwidth ��ʾÿһ�������ĳ��ȣ�һ�����óɸ� softtabstop һ���� 
set shiftwidth=4
" �����ó� expandtab ʱ�������ÿո�����ʾ��noexpandtab �������Ʊ����ʾһ��������
" set noexpandtab / expandtab
" VimĬ���ǶԴ�Сд���еģ���������Vim���Դ�Сд�ļ��ַ����� 
:set ignorecase
" encoding �� Vim �ڲ�ʹ�õ��ַ����뷽ʽ�������������� encoding ֮��Vim �ڲ����е� buffer���Ĵ������ű��е��ַ����ȣ�ȫ��ʹ��������롣Vim �ڹ�����ʱ��������뷽ʽ�������ڲ����벻һ�£������Ȱѱ���ת�����ڲ����롣��������õı����к����޷�ת��Ϊ�ڲ�������ַ�������Щ�ַ��ͻᶪʧ����ˣ���ѡ�� Vim ���ڲ������ʱ��һ��Ҫʹ��һ�ֱ��������㹻ǿ�ı��룬����Ӱ������������
"���� encoding ѡ���漰�� Vim �������ַ����ڲ���ʾ�����ֻ���� Vim ������ʱ������һ�Ρ��� Vim �����������޸� encoding ����ɷǳ�������⡣���û���ر�����ɣ���ʼ�ս� encoding ����Ϊ utf-8��Ϊ�˱����ڷ� UTF-8 ��ϵͳ�� Windows �£��˵���ϵͳ��ʾ�������룬��ͬʱ���⼸�����ã� 
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
" ������Զ�ʶ����ͨ������ fileencodings ʵ�ֵģ�ע���Ǹ�����ʽ��fileencodings ��һ���ö��ŷָ����б��б��е�ÿһ����һ�ֱ�������ơ������Ǵ��ļ���ʱ��VIM ��˳��ʹ�� fileencodings �еı�����г��Խ��룬����ɹ��Ļ�����ʹ�øñ��뷽ʽ���н��룬���� fileencoding ����Ϊ���ֵ�����ʧ�ܵĻ����ͼ���������һ�����롣 
"��ˣ����������� fileencodings ��ʱ��һ��Ҫ��Ҫ���ϸ�ġ����ļ�������������ʱ������׳��ֽ���ʧ�ܵı��뷽ʽ����ǰ�棬�ѿ��ɵı��뷽ʽ���ں��档 
" ���磬latin1 ��һ�ַǳ����ɵı��뷽ʽ���κ�һ�ֱ��뷽ʽ�õ����ı����� latin1 ���н��룬�����ᷢ������ʧ�ܡ�����Ȼ������õ��Ľ����ȻҲ����������Ȼ�ġ����롱����ˣ������� latin1 �ŵ��� fileencodings �ĵ�һλ�Ļ������κ������ļ���������Ҳ����������Ȼ���ˡ� 
"�����ǵ���Ƽ���һ�� fileencodings ���ã� 
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
" ������Linuxϵͳ�У�ʹ��vi��vim�У�Ҫ��ʾ�кž�ʹ�����
set nu  
