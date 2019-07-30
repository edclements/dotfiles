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
set incsearch
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif

syntax enable
set background=dark
colorscheme solarized

set rtp+=~/.fzf

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

let g:ale_linters = {'javascript': ['eslint']}

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

map <Leader>f :FZF<CR>

" let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
"let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_command = "Dispatch docker-compose exec web bundle exec rspec {spec}"

" set window title in tmux
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
