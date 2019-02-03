export SPREDFAST_HOME="$HOME/code/sf-webapp"
export PATH="$SPREDFAST_HOME/scripts/dev:$PATH"

export NPM_TOKEN=1eee195c-91ca-4e26-9709-f5a797052b43

alias cdanalytics='cd ~/code/analytics-ui'
alias cdreactlib='cd ~/code/react-lib'
alias cdwebapp='cd ~/code/sf-webapp'
alias cdjmvc='cd ~/code/sf-webapp/jmvc/src/main/jmvc'
alias cdjava='cd ~/code/sf-webapp/java'
alias cdagent='cd ~/code/agent-inbox'

alias renewkube='d2 renew-cert'



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
