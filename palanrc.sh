export PALAN_SCRIPTS="$HOME/code/scripts"
export SPREDFAST_HOME="$HOME/code/sf-webapp"

# elasticsearch
export PATH=$PATH:/usr/local/Cellar/elasticsearch/6.2.4/libexec/bin/x-pack/
# spredfast
export PATH="$SPREDFAST_HOME/scripts/dev:$PATH"
# my scripts
export PATH="$PATH:$PALAN_SCRIPTS"

export CLICOLOR=1

alias lsl='ls -Fahl'
alias androidstudio='open -a /Applications/Android\ Studio.app'
alias cdwebapp='cd ~/code/sf-webapp'
alias cdjmvc='cd ~/code/sf-webapp/jmvc/src/main/jmvc'
alias cdjava='cd ~/code/sf-webapp/java'
alias cdagent='cd ~/code/agent-inbox'
alias cdandroid='cd ~/code/android-first'
alias cdhome='cd ~'
alias dup='docker-compose up -d'
alias ydev='yarn build:dev'
alias src='source ~/.bash_profile'
alias cdfilter='cd ~/code/sf-webapp/jmvc/src/main/jmvc/stream_filter'
alias cdsocial='cd ~/code/sf-webapp/jmvc/src/main/jmvc/social_inbox'
alias cdcode='cd ~/code'
alias cdreactlib='cd ~/code/react-lib'
alias cdfetch='cd ~/code/sf-dataservices'
alias cdhutson='cd ~/code/hutson'
alias cdgateway='cd ~/code/sf-social-gateway'
alias cdscripts='cd ~/code/scripts'
alias jrun='./gradlew jettyRun'
alias mrebase='git checkout master && git pull && git checkout - && git rebase master'
alias renewkube='d2 renew-cert'

function repos() {
	http GET "https://api.github.com/users/palanga/repos?sort=created&direction=asc"
}

LOGIN_BASE_URL='https://infralogin.spredfast.com/user/login'
HTTPIE_SPREDFAST_SESSION_PATH='/tmp/spredfast-session.json'

function logueame() {
	# $1: password
	http POST "${LOGIN_BASE_URL}?email=agonzalez%40spredfast.com&password=${1}" \
	'Content-Type: application/x-www-form-urlencoded' \
	--session=$HTTPIE_SPREDFAST_SESSION_PATH

	echo "usage: logueame \$password"
}

function pegale() {
	# $1: http method
	# $2: url
	http $1 $2 --session=/tmp/spredfast-session.json

	echo "usage: pegale \$http_method \$url"
}

function dlogs() {
	tail=1
	if [[ $2 ]]; then
		tail=$2
	fi
	docker logs -f --tail ${tail} $1
}

function dstopall() {
	docker stop $(docker ps -q)
}

function dremoveall() {
	docker rm $(docker ps -aq)
}

function drestart() {
	docker restart $@
}

function dstop() {
	docker stop $@
}

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

eval $(thefuck --alias)


# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
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
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
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

export PS1="\[\e[32m\]\u@\h\[\e[34m\]\w\[\e[31m\]\`parse_git_branch\`\\$ \[\e[m\]"

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
