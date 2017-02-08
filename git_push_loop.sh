#!/bin/bash
# Loop through my directories inside Development and check if any outstanding commits

function LoopGitBranches {
  pwd
  for branch in $(git for-each-ref --format='%(refname)' refs/heads/); do
    git log --oneline "$branch" ^origin/master
  done
}

function LoopIfRepo {
  if [[ -d .git ]]; then LoopGitBranches; fi # If it is a git repo, then Loop (Don't want a bunch of "fatal not a git repo" spamming the output)
}
function cdIfDirectory {
  if [[ -d $f ]]; then
    cd $f
    pwd
    LoopIfRepo
    cd ..
  fi
}



for f in *; do
    if [[ -d $f ]]; then #if it is a directory, then cd into it
      cd $f
      LoopIfRepo
      for f in *; do # Checking for more subfolders. If there are any, cd into them and check if they are git repos
        if [[ -d $f ]]; then
          cd $f
          LoopIfRepo
          cd ..
        fi
      done
    cd ..
    fi
done
