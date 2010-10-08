# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if [[ $(uname -s) == "Darwin" ]]; then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="ls -l --color"
  alias la='gls -A --color'
fi
if [[ $(uname -s) == "Linux" ]]; then
  alias ls="ls -F --color"
  alias l="ls -lAh --color"
  alias ll="ls -l --color"
  alias la='ls -A --color'
fi
