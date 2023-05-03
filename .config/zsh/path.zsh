typeset -U path
export path=(~/bin $path)
export path=(.git/safe/../../bin $path)
export path=($(brew --prefix coreutils)/libexec/gnubin $path)

source ~/.cargo/env
