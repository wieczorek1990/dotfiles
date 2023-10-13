source "${HOME}/.project"

alias init="ssh-add"
alias server="python -m http.server 80"

alias b="./bin/bash"
alias be="cd ~/Software/${PROJECT}/"
alias f="./bin/format"
alias fix="./bin/sort_imports && ./bin/format"
alias g="./bin/guard"
alias i="./bin/sort_imports"
alias l="./bin/lint"
alias k="(klavaro &) &"
alias m="./bin/migrate"
alias mm="./bin/makemigrations"
alias pt="./bin/parallel_test"
alias r="./bin/run"
alias re="./bin/restart"
alias s="./bin/shell"
alias st="./bin/style"
alias t="./bin/test"
alias ty="./bin/typing"
alias u="./bin/update"

# Kubernetes

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

function rlogin {
    gcloud auth login
    gcloud container clusters get-credentials "$CLUSTER" --region "$REGION"
}

function rlogout {
    gcloud auth revoke $EMAIL
}

function rlist {
    kubectl get pod -n "$PROJECT"
}

function rbash {
    pod="$1"
    id=$(kubectl get pod -n "$PROJECT" | tail -n +2 | tr -s " " | cut -d " " -f 1 | grep "$pod")
    kubectl exec -it -n "$PROJECT" "$id" -- bash
}
