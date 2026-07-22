# Git and release aliases

alias ddb="git for-each-ref --format '%(refname:short)' refs/heads | grep -v \"master\|main\" | xargs git branch -D"
alias pr='gh pr create --base "main" --reviewer "giantswarm/team-shield" -a "@me" --fill-first'
alias gp="git pull"
alias gpo="git push origin"
alias gcc="git checkout -b"
alias gcs="git commit --signoff"
alias gca="git commit --amend --no-edit"
alias main="git checkout main && git pull origin main"
alias master="git checkout master && git pull origin master"
alias legacy="git checkout legacy && git pull origin legacy"
alias release-patch='main && git checkout -b "main#release#patch" && git push origin "main#release#patch" && git checkout main && git branch -D "main#release#patch"'
alias release-minor='main && git checkout -b "main#release#minor" && git push origin "main#release#minor" && git checkout main && git branch -D "main#release#minor"'
alias release-major='main && git checkout -b "main#release#major" && git push origin "main#release#major" && git checkout main && git branch -D "main#release#major"'
alias update-chart='git checkout -b "main#update-chart" && git push origin "main#update-chart" && git checkout main && git branch -D "main#update-chart"'
alias signall="git rebase main --exec \"git commit --amend --no-edit -S\""
alias gitclean='git branch -vv | awk '\''$1 != "*" && $3 !~ /^\[/ {print $1}'\'' | xargs -r git branch -d'
