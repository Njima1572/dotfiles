alias g="git"
alias l="ls"
alias llr="ls -lR"
alias v="vim"
alias py2="python2"
alias py3="python3"


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
