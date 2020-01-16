####  Git configuration Start  ####

# Show branch name in terminal
parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


# Git Autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Git Command Aliases
alias gco='git checkout'
__git_complete gco _git_checkout
alias gst='git status'		
alias ga='git add .'
alias glg='git log --graph --decorate --pretty=format:"%C(yellow)%h%Cred%d %Creset%s %Cgreen[%ae,%ar]"'
alias gpr='git pull --rebase'
alias gfiles='git diff-tree --no-commit-id --name-only -r'
alias gstashu='git stash -k -u'
# Commit related aliases
alias gnc='git commit -m'
alias gnce='git commit --allow-empty -m'
alias gcm='git log --format=%B -n 1'
alias gamend='git commit --amend --no-edit'
alias gamende='git commit --amend'
alias guc='git reset --soft HEAD~1'
alias grec='git commit -c ORIG_HEAD'
# Branch related aliases
alias gb='git checkout -b'
alias grb='git branch -m'
alias gdb='git branch -D'
__git_complete gdelb _git_checkout
# Rebasing
alias grr='git rebase -r'
__git_complete grr _git_checkout
alias grc='git rebase --continue'
alias gra='git rebase --abort'
# Pushing
alias gpu='git push'
alias gpuf='git push -f'

####  Git configuration End  ####