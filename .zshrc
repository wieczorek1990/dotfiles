export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
export PATH="/usr/local/opt/python@3.10/libexec/bin:$PATH"

alias init='ssh-add'
alias serve='python -m http.server 80'
alias update='source ~/Software/luca-backend-ve/bin/activate && cd ~/Software/luca/backend/ && ./bin/local && deactivate'

alias b='./bin/bash'
alias g='./bin/guard'
alias gl='./bin/guard --no-lint'
alias r='./bin/run'
alias s='./bin/shell'
alias t='./bin/test'
alias l='cd ~/Software/luca/backend/'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -Uz compinit
compinit
if [ -f '/Users/luke/Software/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/luke/Software/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/luke/Software/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/luke/Software/google-cloud-sdk/completion.zsh.inc'; fi
