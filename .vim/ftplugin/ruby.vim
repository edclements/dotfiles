let b:coc_enabled=0
let b:ale_enabled=1

if !empty(glob('spec'))
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>
else
  nmap <Leader>t <Plug>vim-minitest#RunCurrentTestFile
  nmap <Leader>s <Plug>vim-minitest#RunNearestTest
  nmap <Leader>l <Plug>vim-minitest#RunLastTest
  nmap <Leader>a <Plug>vim-minitest#RunAllTests
endif

let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
"let g:rspec_command = "Dispatch rspec {spec}"
"let g:rspec_command = "Dispatch docker-compose exec web bundle exec rspec {spec}"
let g:minitest_command = "Dispatch ruby -Itest {test}"
