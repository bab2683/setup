#### DOCKER aliases ####

# Stops container by name
alias ds='docker stop'
# Stops all containers
alias dsa='docker stop $(docker ps -aq)'
# Deletes container
alias drc='docker rm'
# Deletes all container in exited or created status
alias drca='docker rm $(docker ps -a -f status=exited -f status=created -q)'
# Shows all containers
alias dcls='docker ps -a'
# Show all images
alias dils='docker images'
# Deletes all images
alias dria='docker rmi $(docker images -q)'