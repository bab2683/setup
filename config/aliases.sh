# ----------------------
# Git Command Aliases
# ----------------------
alias gco='git checkout'
__git_complete gco _git_checkout
alias gst='git status'		
alias ga='git add .'
alias glg='git log --graph --decorate --pretty=format:"%C(yellow)%h%Cred%d %Creset%s %Cgreen[%ae,%ar]"'
alias gpr='git pull --rebase'
alias gfiles='git diff-tree --no-commit-id --name-only -r'	# Show files changed in last commit
alias gstashu='git stash -k -u'								# Stash all (even newly created files)
# Commit related aliases
alias gnc='git commit -m'									# Creates new commit
alias gcm='git log --format=%B -n 1' 						# Show last commit message
alias gamend='git commit --amend --no-edit' 				# Amend
alias gamende='git commit --amend'							# Amend and edit
alias guncommit='git reset --soft HEAD~1'					# Destroys last commit
alias grecommit='git commit -c ORIG_HEAD'					# Recommit
# Branch related aliases
alias gcob='git checkout -b'								# Checkout to new branch
alias grenameb='git branch -m'								# Rename active branch
alias gdelb='git branch -D'									# Delete branch
__git_complete gdelb _git_checkout