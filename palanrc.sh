export PALAN_SCRIPTS="$HOME/code/scripts"

# elasticsearch
export PATH=$PATH:/usr/local/Cellar/elasticsearch/6.2.4/libexec/bin/x-pack/
# my scripts
export PATH="$PATH:$PALAN_SCRIPTS"

export CLICOLOR=1

alias ls='gls --color=always'
alias lsl='ls -FAhlX --group-directories-first'
alias androidstudio='open -a /Applications/Android\ Studio.app'
alias cdunacucha='cd ~/code/una-cucha'
alias cdhome='cd ~'
alias dup='docker-compose up -d'
alias src='source ~/.bash_profile'
alias cdcode='cd ~/code'
alias cdscripts='cd ~/code/scripts'
alias mrebase='git checkout master && git pull && git checkout - && git rebase master'

function repos() {
	http GET "https://api.github.com/users/palanga/repos?sort=created&direction=asc"
}

function dlogs() {
	tail=1
	if [[ $2 ]]; then
		tail=$2
	fi
	docker logs -f --tail ${tail} $1
}

function dstopall() {
	docker ps -q | xargs docker stop
}

function dremoveall() {
	docker ps -aq | xargs docker rm
}

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

eval $(thefuck --alias)


# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=$(git status --porcelain | awk '{print $1}')

	modified=`echo $status | grep "M" -q; echo $?`
	untracked=`echo $status | grep "??" -q; echo $?`
	newfile=`echo $status | grep "A" -q; echo $?`
	renamed=`echo $status | grep "R" -q; echo $?`
	deleted=`echo $status | grep "D" -q; echo $?`

	# TODO find a way to parse despite of the output language
	# ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`

	bits=''

	if [ $modified == 0 ]; then
		bits="✏️${bits}"
	fi
	if [ $untracked == 0 ]; then
		bits="🔍${bits}"
	fi
	if [ $newfile == 0 ]; then
		bits="✨${bits}"
	fi
	if [ $renamed == 0 ]; then
		bits="🌈${bits}"
	fi
	if [ $deleted == 0 ]; then
		bits="🗑 ${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits} "
	else
		echo ""
	fi
}

# export PS1="
# \[\e[34m\]\u@\h
# \[\e[00m\]\w
# \[\e[31m\]\`parse_git_branch\`\\$ 
# \[\e[m\]
# "

export PS1="\[\e[32m\]\u🧀\h\[\e[34m\]\w\[\e[31m\]\`parse_git_branch\`🍷 \[\e[m\]"

# export PS1="
# \[\e[00m\] 00 default \[\e[m\]
# \[\e[30m\] 30 black \[\e[m\]
# \[\e[31m\] 31 red \[\e[m\]
# \[\e[32m\] 32 green \[\e[m\]
# \[\e[33m\] 33 yellow \[\e[m\]
# \[\e[34m\] 34 blue \[\e[m\]
# \[\e[35m\] 35 violet \[\e[m\]
# \[\e[36m\] 36 grey? \[\e[m\]
# \[\e[37m\] 37 white \[\e[m\]
# "
