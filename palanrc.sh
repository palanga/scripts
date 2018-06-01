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

export COOKIE='Cookie: ajs_user_id=null; ajs_group_id=null; ajs_anonymous_id=%2277e4565f-6bb7-4e92-8668-0472363bdb61%22; _ga=GA1.2.739551777.1526926135; _gid=GA1.2.615781134.1527482715; sfcsrf-infralogin.spredfast.com=9ab4834186c04a4fbc31c18f8cdc5910; sfui-infralogin.spredfast.com="{\"userId\":141948,\"companyId\":78708,\"impersonatorUserId\":null}"; csrf_token=9ab4834186c04a4fbc31c18f8cdc5910; PHPSESSID=9seglhp9nhqp03hechgkcopfk3; sfauth-infralogin.spredfast.com=H4sIAAAAAAAAAG2QQU/DIBiG/8t3brbiaAs9aeYOHvSinoyHr/ChTVpogDVzy/67sGVTEzmQkI+H93k5wDaQf9DQMs4kFwXQiP0ALeCHs3scaH8bJk/aYIgL5UYoIO0T2q8MNaIpM2Pne4qJC9C+HWDyTm9VPL1aXE5POFJ6du3sTD5g7J0NcJ1u7Nx7Z0eyZ4zf/Df6rZVY2kXyFof1jxAwOOlciFefu3zGOIV2udQ0d263+Fvo+F5AoBCS0HNEHynnVzdNLRmXQlRNAb0e6KUfyW3jnUmZjyEr8jKvK7zZTb0/9Trz6WdkJWXmVfAmaUjsuFhxJmpVcuSmUyummDBCaVVJVkJOyh0Z1dxgXXc18a5UgnNalZVgVYeaOp3uoR77lGNwCHT8BscP9ePFAQAA; sfsig-infralogin.spredfast.com=MFBeC9Dz30wGo0fFaqd9FWpdwic=; sfjwt-infralogin.spredfast.com=eyJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIxNDE5NDgiLCJleHAiOjE1Mjc3MDg5NTksImF1ZCI6IndlYmFwcCIsInNlc3Npb24iOiJINHNJQUFBQUFBQUFBRzJRUVUvRElCaUcvOHQzYnJiaWFBczlhZVlPSHZTaW5veUhyL0NoVFZwb2dEVnp5LzY3c0dWVEV6bVFrSStIOTNrNXdEYVFmOURRTXM0a0Z3WFFpUDBBTGVDSHMzc2NhSDhiSmsvYVlJZ0w1VVlvSU8wVDJxOE1OYUlwTTJQbmU0cUpDOUMrSFdEeVRtOVZQTDFhWEU1UE9GSjZkdTNzVEQ1ZzdKME5jSjF1N054N1owZXlaNHpmL0RmNnJaVlkya1h5Rm9mMWp4QXdPT2xjaUZlZnUzekdPSVYydWRRMGQyNjMrRnZvK0Y1QW9CQ1MwSE5FSHlublZ6ZE5MUm1YUWxSTkFiMGU2S1VmeVczam5VbVpqeUVyOGpLdks3elpUYjAvOVRyejZXZGtKV1htVmZBbWFVanN1Rmh4Sm1wVmN1U21VeXVtbURCQ2FWVkpWa0pPeWgwWjFkeGdYWGMxOGE1VWduTmFsWlZnVlllYU9wM3VvUjc3bEdOd0NIVDhCc2NQOWVQRkFRQUEifQ.HSzFleoLaCm8ECEOLXsqVDko3pOZkq7voJvXIEdo_0QleWYrkhOJ8oUCNW_Gt8uQqUAfsmmNBCOLEBNMaFnLZvRlansPqsoC3y-jQqp_6g_jyw5Wsn6KqVv3b1jcl31PJTyCvXj9Rx9hzWMYU5m1ESjh9figcdUqkcLTexcJ7ngcKdh5t-OoBujm1fFXsJ_LgYJoWDMc9P30KD66dV9DAieJ8fAZyshpnZCmNEF3a48W-CYYQnjJ349VJpnYZUuLzTZpLYnKuOc1BbjjGRzfjfMCGN8tnKhXiJOU6XAiVbPLtkGYBAL612AA6jl22mOW3rg1IxQd1NhHvBPsKhCrOIedSDYt9UhVfy8kvuKbdt8MAJCz115IwOIwxw6NaXw86YEd8gA9WM3opUkaJeqroSdssTSxchmGFaHmPf7zkcp-1gTwBkL5hQSVTpAsxuHfuB3CLDb-KA2UyjtIF_WN_iOtD9DLPQB_U93Q37vp2BXoUa9tHMktXq-YEa1zUkjX'

function pegale() {
	http $1 "$COOKIE" $@
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
