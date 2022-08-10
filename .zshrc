export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
export PATH="/usr/local/opt/python@3.10/libexec/bin:$PATH"
export PATH="$HOME/Software/sonar-scanner/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

alias init='ssh-add'
alias serve='python3 -m http.server 8888'

alias g='./bin/guard'
alias l='cd ~/Software/luca/backend/'
alias ps='cd ~/Software/pismo-swiete-backend'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -Uz compinit
compinit
if [ -f '/Users/luke/Software/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/luke/Software/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/luke/Software/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/luke/Software/google-cloud-sdk/completion.zsh.inc'; fi
