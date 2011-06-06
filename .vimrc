set nocompatible
set foldlevelstart=99
set guioptions+=m		" menubar
set guioptions+=r		" right=hand scrollbar
set guioptions+=a		" autoselect
set guioptions-=T		" toolbar
set number				" line numbers
set spelllang=en_gb
set nospell
set textwidth=79
set autoindent
set history=50			" keep 50 lines of command line history
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set incsearch			" do incremental searching
set visualbell t_vb=	" turn off noisy bell
set tabstop=2
set shiftwidth=2
set expandtab			" replace tabs with spaces
set encoding=utf-8

"fix keys for screen
map [1~ <Home>
map [4~ <End>
map [5~ <kPageUp>
map [6~ <kPageDown>
imap [1~ <Home>
imap [4~ <End>
imap [5~ <kPageUp>
imap [6~ <kPageDown>

if $TERM == 'screen'
	set term=xterm
	let g:GNU_Screen_used = 1
else
	let g:GNU_Screen_used = 0
endif

if has("unix")
	" code common to Cygwin and Linux
	set grepprg=grep\ -nH\ $*	" recommended for Latex Suite
	if has("win32unix")
		"code for Cygwin but not Linux
		set shellslash
		set t_Co=256
	else
		"code for Linux but not Cygwin
		set t_Co=256
	end
elseif has("win16") || has("win32") || has("win64")
	set shellslash	" recommended for Latex Suite
	"set guifont=DejaVu_Sans_Mono:h10
else
	echoerr "Unknown OS"
endif

if &t_Co > 2 || has("gui_running")
	"syntax enable
  	syntax on
  	"set hlsearch
	"set background=dark
	"colorscheme xoria256
  colorscheme zenburn
endif

"if has("gui_running")
	"colorscheme desert
	"colorscheme xoria256
"endif

if has("autocmd")
	filetype plugin indent on
endif

if has('mouse')
  	set mouse=a
endif

"set default help tags
"let thisfile = readfile($VIM."/vimfiles/doc/default/tags","b")
"call writefile(thisfile,$VIM."/vimfiles/doc/tags","b")

"au BufNewFile,BufRead *orc so ~/.vim/syntax/csound_orc.vim
"au BufNewFile,BufRead *sco so ~/.vim/syntax/csound_sco.vim
"au BufNewFile,BufRead *csd so ~/.vim/syntax/csound_csd.vim
"au BufNewFile,BufRead *.csd so ~/.vim/macros/csound_macros.vim
"au BufNewFile *.csd 0r ~/.vim/templates/template.csd
"au BufNewFile *.orc 0r ~/.vim/templates/template.orc

"autocmd BufNewFile * silent! 0r ~/.vim/templates/template/%:e.tpl
autocmd BufNewFile *.csd 0r ~/.vim/templates/template.csd
autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh

autocmd Filetype html,xml,xsl runtime scripts/closetag.vim
autocmd Filetype html set noignorecase

