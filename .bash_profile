# GIT
alias ckn='git checkout -b'
alias ck='git checkout'
alias br='git branch'
alias remove='git branch -D'
alias pull='pullCurrent'
alias push='pushCurrent'
alias commit='commitCurrent'
alias st='git status'
alias clone='git clone'

# System
alias ..='cd ../ && ls'
alias ...='cd ../../ && ls'
alias .='explorer .'
alias c='clear'
alias e='exit'


# function
#!/bin/sh

# update code
pullCurrent() {
    local br
    br=`git branch | grep "*"`
    echo "Current git branch is ${br/* /}"
    git push origin ${br/* /}
}

# Auto friendly commit
commitCurrent() {
    local br
    br=`git branch | grep "*"`
    echo "Current git branch is ${br/* /}"

    echo "the file status ====>>>>"
    git status

    echo "add file ====>>>>"

    git add .

    echo "add file ====>>>> success"

    read -p "please input the commit message: " message

    git commit -m "$message"



    echo "the file status ====>>>>"

    git status


    read -p "Do you want to push the commits (y/n)?" result

    if [ "$result"x = "y"x ];

    then

        git push origin ${br/* /}

        git open

    else
        echo "Canceled to push commit"

    fi
}