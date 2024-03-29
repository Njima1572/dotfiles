alias g="git"
alias l="ls"
alias llr="ls -lR"
alias v="nvim"
alias nv="nvim"
alias mv="mv -i"
alias ..="cd .."
alias scd='cd ~/Singularity'


function copy
  cat $argv | xsel -bi
end

function google-search
  if set -q BROWSER
    echo Using $BROWSER
  else
    set BROWSER firefox
  end
  $BROWSER "https://www.google.com/search?q=$argv"
end
  

function cl
  cd $argv | ls
end

function activate
  source $VIRTUALENV_DIR/$argv/bin/activate.fish
end
