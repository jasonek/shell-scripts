## git_push_loop
Apps are either 1 or 2 folders deep inside my development folder. This script iterates through each directory, checks if it is a git repo and if it is, loops through `git branch` checking if there are any non-comitted code. If it is not a git repo, it loops through the subdirectories checking if those are repos. If they are, it again loops through `git branch` checking for changes.

#### I made the bash command `checkgit` an alias to run _git_push_loop.sh_. [Click here for instruction on how to do that.](http://www.hostingadvice.com/how-to/set-command-aliases-linuxubuntudebian/)
