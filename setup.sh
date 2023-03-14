#!/usr/bin/env bash

BRANCH_NAME="main"

BRANCH_LIST=`git branch -r | grep -v -- '->'`
for branch in ${branch_list[@]}
do  
    if [ $branch != 'origin/$BRANCH_NAME' ]; then
        git branch --track ${branch##origin/} $branch; 
    fi
done
git checkout $BRANCH_NAME && git branch --merged | egrep -v "(^\*|${BRANCH_NAME})" | xargs git push origin -d
echo "🗑️ Done!"
