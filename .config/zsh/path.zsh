typeset -U path
export path=(~/bin $path)
export path=(.git/safe/../../bin $path)

if [[ $(uname) == 'Darwin' ]]; then
  export path=($(brew --prefix coreutils)/libexec/gnubin $path)
fi

if [ -d ~/.cargo ]; then
  source ~/.cargo/env
fi
