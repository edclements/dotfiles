typeset -U path
export path=(~/bin $path)
export path=(.git/safe/../../bin $path)

if which brew > /dev/null; then
export path=($(brew --prefix coreutils)/libexec/gnubin $path)
fi

source ~/.cargo/env
