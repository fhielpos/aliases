# Kubernetes aliases and functions

# kubectx with argument
function kxx() {
    kubectx teleport.giantswarm.io-$1
}

# Annotate chart
function annotate_chart() {
    kubectl annotate chart -n giantswarm "$1" "chart-operator.giantswarm.io/values-md5-checksum=" --overwrite
}

# kubectl logs for deployments
function kld() {
    kubectl logs -f deploy/"$1"
}

# kubectl logs for statefulsets
function kls() {
    kubectl logs -f statefulset/"$1"
}

# kubectl logs for jobs
function klj() {
    kubectl logs -f job/"$1"
}

# kubectl logs for daemonsets
function klds() {
    kubectl logs -f daemonset/"$1"
}

# Watch pods, optionally filtered by name ($1), namespace ($2), interval secs ($3)
function wp() {
    local name="$1" ns="$2" secs="$3" cmd="kubectl get pods"
    local -a watch_opts=(-c)
    [[ -n "$ns" ]] && cmd+=" -n $ns"
    [[ -n "$name" ]] && cmd+=" | grep $name"
    [[ -n "$secs" ]] && watch_opts+=(-n "$secs")
    watch "${watch_opts[@]}" "$cmd"
}

# Watch apps, optionally filtered by name ($1), namespace ($2), interval secs ($3)
function wa() {
    local name="$1" ns="$2" secs="$3" cmd="kubectl get apps"
    local -a watch_opts=(-c)
    [[ -n "$ns" ]] && cmd+=" -n $ns"
    [[ -n "$name" ]] && cmd+=" | grep $name"
    [[ -n "$secs" ]] && watch_opts+=(-n "$secs")
    watch "${watch_opts[@]}" "$cmd"
}

# Kubectl admin stuff
alias k="kubectl"
alias kc="kubecolor"
alias kcg="kubecolor get"
alias kkn="kubens kyverno"
alias knk="kubens kyverno"
alias knks="kubens kube-system"
alias kns="kubens security-bundle"
alias knp="kubens policy-exceptions"
alias knf="kubens org-franco"
alias kng="kubens giantswarm"
alias kn="kubens"
alias kx="kubectx"
alias klk="kubectl logs -n kyverno -l app.kubernetes.io/component=admission-controller -f"

# Kubectl deletes
alias kdd="kubectl delete"
alias kdda="kubectl delete app"
alias kdds="kubectl delete secret -l \"status=pending-upgrade\""
alias kddsk="kubectl delete secret -l \"status=pending-upgrade\" -n kyverno"
alias kddsf="kubectl delete secret -l \"status=failed\""
alias kddc="kubectl delete chart -n giantswarm"
alias kddj="kubectl delete job --all"

# Kubectl get/describe
alias kd="kubectl describe"
alias kdp="kubectl describe pod"
alias kda="kubectl describe app"
alias kga="kubectl get app"
alias kgp="kubectl get pods"
alias kg="kubectl get"
alias kgd="kubectl get polexdraft -n policy-exceptions"
alias kk="kubectl get pods -n kyverno"

# Kubectl GS
alias kgsga="kubectl gs get cluster -A"
alias kgs="kubectl gs"
alias kgsl="kubectl gs login --cluster-admin --certificate-group system:masters --certificate-ttl 8h --insecure-namespace"
alias kgg="kubectl get app -n giantswarm"
alias kgc="kubectl get chart -n giantswarm"

# Misc kubectl
alias kl="kubectl logs -f"
alias klc="kubectl logs -f -n giantswarm deploy/chart-operator"
alias kwebhooks='kubectl delete -l "webhook.kyverno.io/managed-by=kyverno" mutatingwebhookconfigurations.admissionregistration.k8s.io && kubectl delete -l "webhook.kyverno.io/managed-by=kyverno" validatingwebhookconfigurations.admissionregistration.k8s.io'
alias restart="kubectl rollout restart deployment"
alias rcg="kubectl rollout restart -n giantswarm deploy/chart-operator"
alias notrunning="kubectl get pods -A | grep -vE \"Running|Completed\""
alias an="annotate_chart"
alias ank="annotate_chart kyverno"
