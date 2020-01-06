# ----------------------
# Git Command Aliases
# ----------------------
alias ga='git add .'
alias glg='git log --pretty=format:%C(yellow)%h%Cred%d\\ %Creset%s%Cgreen\\ [%ae,%ar]” --decorate --graph'
alias gpr='git pull --rebase'
alias guncommit='git reset --soft HEAD~1'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gfilelist='git diff-tree --no-commit-id --name-only -r'
alias gdelb='git branch -D'
alias gst='git status'
alias gcmm='git log --format=%B -n 1'
alias gamend='git commit --amend --no-edit'
alias gamende='git commit --amend'
alias grecommit='git commit -c ORIG_HEAD'
alias grenameb='git branch -m'
alias gstashu='git stash -k -u'