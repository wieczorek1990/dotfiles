export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/luke/.local/bin:$PATH"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

alias init='ssh-add'
alias server='python -m http.server 80'
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
alias st='./bin/style'
alias t='./bin/test'
alias ty='./bin/type'
alias u='./bin/update'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "${HOME}/Software/google-cloud-sdk/path.zsh.inc" && source "${HOME}/Software/google-cloud-sdk/path.zsh.inc"

current_project=$(cat .current_project)

function rlist {
    kubectl get pod -n $current_project
}

function rbash {
    id=$(kubectl get pod -n $current_project | tail -n +2 | tr -s ' ' | cut -d ' ' -f 1 | grep "$1")
    kubectl exec -it -n $current_project "$id" -- bash
}
