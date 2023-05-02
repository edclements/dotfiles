let errormarker_errortext = ">>"
let errormarker_errortextgroup = "Error"
let errormarker_errorgroup = "Normal"

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

set number " line numbers
set visualbell t_vb= " turn off noisy bell
set tabstop=2
set shiftwidth=2
set expandtab " replace tabs with spaces
set encoding=utf-8
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif
set modeline

set background=dark
colorscheme solarized

set rtp+=~/.fzf
if filereadable('/usr/share/doc/fzf/examples/fzf.vim')
  source /usr/share/doc/fzf/examples/fzf.vim
endif

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()

let g:coc_global_extensions = ['coc-tsserver']

let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop', 'ruby'], 'typescript': ['eslint', 'tsserver']}
" let g:ale_linters = {'javascript': ['eslint']}
let g:ale_enabled=0
" autocmd FileType ruby setlocal makeprg=rubocop
" autocmd BufWritePost *.rb silent lmake! <afile> | silent redraw!
" autocmd QuickFixCmdPost [^l]* cwindow

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

map <Leader>f :FZF<CR>

" set window title in tmux
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

" function! s:ShowErrorAtCursor()
"     if mode(1) isnot# 'n'
"         return
"     endif
"     let [l:bufnr, l:lnum] = getpos(".")[0:1]
"     let l:bufnr = bufnr("%")
"     for l:d in getloclist(0)
"         if (l:d.bufnr != l:bufnr || l:d.lnum != l:lnum)
"             continue
"         endif
"         redraw | echomsg l:d.text
"     endfor
"     echo
" endfunction

" autocmd CursorMoved * call s:ShowErrorAtCursor()

function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction

map <F3> :call QuickFix_toggle()<cr>

set statusline=
set statusline+=%{FugitiveStatusline()}
set statusline+=\ %f
set statusline+=%h%m%r
set statusline+=%=
set statusline+=%{len(getqflist())}
set statusline+=\ %{len(getloclist(0))}
set statusline+=\ %y
set statusline+=\[%{&fileencoding?&fileencoding:&encoding}\]
set statusline+=\[%{&fileformat}\]
set statusline+=\ %-14.(%l,%c%)
set statusline+=\ %-4.(%p%%%)

set exrc
set secure
