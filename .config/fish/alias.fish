alias l=ls
alias v=nvim
alias vim=nvim
alias d=docker
alias g=git
alias python=python3

alias mon='watch -n 1 "mpstat | tail -n +3; echo ;  free -m -h ; echo; nvidia-smi | tail -n +8 ; sensors --no-adapter"'

bind \ce 'cd ..; commandline -f repaint'
bind \cf accept-autosuggestion
