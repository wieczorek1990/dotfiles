export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
export PATH="/usr/local/opt/python@3.10/libexec/bin:$PATH"
export PATH="/Users/luke/.local/bin:$PATH"

alias init='ssh-add'
alias serve='python -m http.server 80'
alias update='source ~/Software/luca-backend-ve/bin/activate && cd ~/Software/luca/backend/ && ./bin/local && deactivate'

alias b='./bin/bash'
alias be='cd ~/Software/luca/backend/'
alias devops='cd ~/Software/luca/devops/'
alias f='./bin/format'
alias fe='cd ~/Software/luca/frontend/'
alias fix='./bin/imports && ./bin/format'
alias g='./bin/guard'
alias l='./bin/lint'
alias i='./bin/imports'
alias m='./bin/migrate'
alias mm='./bin/makemigrations'
alias r='./bin/run'
alias re='./bin/restart'
alias s='./bin/shell'
alias t='./bin/test'
alias u='./bin/update'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
