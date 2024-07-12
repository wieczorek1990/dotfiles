source "${HOME}/.project"

alias be="cd ~/Software/${PROJECT}"
alias init="ssh-add ~/.ssh/id_rsa${SSH_KEY_POSTFIX}"
alias server="python -m http.server 80"

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
