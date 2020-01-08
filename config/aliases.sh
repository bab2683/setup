# ----------------------
# Git Command Aliases
# ----------------------
gco(){ git checkout "$1";}
alias gst='git status'		
alias ga='git add .'
alias glg='git log --pretty=format:%C(yellow)%h%Cred%d\\ %Creset%s%Cgreen\\ [%ae,%ar]” --decorate --graph'
alias gpr='git pull --rebase'
alias gfiles='git diff-tree --no-commit-id --name-only -r'	# Show files changed in last commit
alias gstashu='git stash -k -u'								# Stash all (even newly created files)
# Commit related aliases
gnc(){ git commit -m "$1";}									# Creates new commit
alias gcm='git log --format=%B -n 1' 						# Show last commit message
alias gamend='git commit --amend --no-edit' 				# Amend
alias gamende='git commit --amend'							# Amend and edit
alias guncommit='git reset --soft HEAD~1'					# Destroys last commit
alias grecommit='git commit -c ORIG_HEAD'					# Recommit
# Branch related aliases
gcob(){ git checkout -b "$1";}								# Checkout to new branch
grenameb(){ git branch -m "$1";}							# Rename active branch
gdelb(){ git branch -D "$1";}								# Delete branch