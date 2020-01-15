# Git essentials

Just a common guide to add essentials git functionality to your workflow

## Autocompletion
To enable autocompletion to your terminal for git commands and even branch naming (if the branch have a naming convention) do as follow:

```bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
```
This command will download the git-completion script into your home folder. Then into your `~/bash_profile` add the following:

```bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
```

## Parse git branch on terminal
Add the following to your `~/bash_profile` to show current branch on terminal

```bash
parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
```

## Delete remote branch
```bash
git push origin --delete branch_name
```

## Renaming remote commits
To rename already pushed commits you can do as follow
```bash
git rebase -i HEAD~N
#N is the number of commits you want to rename
```
Once Vim opens, press `I` to activate the insert mode
```vim
pick asdasd My super commit
```
Change `pick` to `r` or `reword`, then press `esc` and finally `:wq` followed by the `enter` key.

Afterwards, you need to `push -f`

## Zip changed files
```bash
zip modified-files.zip $(git ls-files --modified)
cp $(git ls-files --modified) ~/Desktop/modified-files
```

## Aliases
### Generale aliases
- `gco (git checkout)`: checkout to branch
- `gst (git status)`: show status of changes
- `ga (git add .)`: add all files into the staging area
- `glg (git log --graph --decorate --pretty=format:"%C(yellow)%h%Cred%d %Creset%s %Cgreen[%ae,%ar]")`: format the log
- `gpr (git pull --rebase)`: pulls remote branch and rebase changes on top of it
- `gfiles (git diff-tree --no-commit-id --name-only -r)`: Show files changed in last commit
- `gstashu (git stash -k -u)`: Stash all (even newly created files)
### Commit related aliases
- `gnc (git commit -m)`: Creates new commit
- `gnce (git commit --allow-empty -m)`: Creates new empty commit
- `gcm (git log --format=%B -n 1)`: Shows last commit message
- `gamend (git commit --amend --no-edit)`: Amend commit with staged changes
- `gamende (git commit --amend)`: Amend and edit commit message
- `guc (git reset --soft HEAD~1)`: Destroys last commit
- `grec (git commit -c ORIG_HEAD)`: Creates commit using the last commit message
### Branch related aliases
- `gb (git checkout -b)`: Checkout to new branch locally
- `grb (git branch -m)`: Rename active branch locally
- `gdb (git branch -D)`: Deletes local branch
### Rebase related aliases
- `grr (git rebase -r)`: Rebase current branch with given branch
- `grc (git rebase --continue)`: Continue rebasing after conflicts have been solved
- `gra (git rebase --abort)`: Abort rebasing
### Push related aliases
- `gpu (git push)`: Push to remote branch
- `gpuf (git push -f)`: Force Push to remote branch