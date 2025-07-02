#for https authentication
export GITHUB_TOKEN="<git token>"

#set this in git config
# user.email=<usermail>
# user.name=<username>
# credential.helper=!f() { sleep 1; echo "username=${GITHUB_TOKEN}"; echo "password=${GITHUB_TOKEN}"; }; f


#git setup for ux in terminal
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#command line user name
export PS1="\[\033[00;91m\]~>:\[\033[01;34m\]\w\[\033[00m\] \[\033[00;32m\]\$(git_branch)\[\033[00m\]\$ "

#git setup for alias
alias gadd='git add'
alias gall='git add .' #add all files to stage
alias gb='git branch'
alias gba='git branch -a' #list all branch
alias gbd='git branch -d' #delete branch
alias gbv='git branch -v' #list all branch in local
alias gout='git checkout'
alias goutb='git checkout -b' #create new branch from current branch
alias gcmt='git commit -m'
alias gcmta='git commit -am' #add and commit all files
alias gset='git reset --hard' #reset to commit
alias glog='git log'
alias giff='git diff'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias gmerge='git merge'
alias gpull='git pull'
alias gpush='git push'
alias grs='git restore'
alias gs='git status'
alias gash='git stash'
alias gashy='git stash apply'
alias gtag='git tag' #list the tags
alias gtagd='git tag -d' #delete the tag
alias gup='git fetch upstream'


#git setup alias autocompletion

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
  __git_complete gadd _git_add
  __git_complete gb _git_branch
  __git_complete gout _git_checkout
  __git_complete giff _git_diff
  __git_complete gmerge _git_merge
  __git_complete gpull _git_pull
  __git_complete gpush _git_push
  __git_complete grs _git_restore
  __git_complete gtag _git_tag
else
  echo "Error loading git completions"
fi

#others
alias c='clear'
alias mybash='cat ~/.bashrc' 

#docker
alias lkosh='docker run -e POSTGRES_USER=<username> -e POSTGRES_PASSWORD=<password> -e POSTGRES_DB=<database_name> -p 5432:5432 -v "/<path to backup>:/var/lib/postgresql/data" postgres:latest'
alias dup='docker-compose up --build -d'
alias dwn='docker-compose down'
alias dlog='docker exec -it <conatiner_name> bash'

#alias for python virtual ENV
alias actenv='source virEnv/bin/activate'
alias sget='sudo apt install'

#jupyter notebook
alias jpn='jupyter notebook'
