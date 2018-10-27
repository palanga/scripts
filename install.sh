function log() {
	option=$1
	message=$2

	GREEN='\033[0;32m'
	YELLOW='\033[0;33m'
	BLUE='\033[0;34m'
	RED='\033[0;31m'
	NC='\033[0m'

	BASE=''
	case $option in
		-i )
			BASE="${GREEN}INFO${NC} "
			;;
		-w )
			BASE="${BLUE}WARN${NC} "
			;;
		-e )
			BASE="${RED}ERROR${NC} "
			;;
	esac
	echo -e "${BASE}${message}"
}

function config() {
	log -i "Writting to .bash_profile..."
	SOURCE_SCRIPT_LINE="source $HOME/code/scripts/palanrc.sh"
	if ! grep -x -q "$SOURCE_SCRIPT_LINE" ~/.bash_profile ; then
		echo $SOURCE_SCRIPT_LINE >> ~/.bash_profile
	fi
	source ~/.bash_profile
	log -i "Writting to .bash_profile complete."

	log -i "Copying gitconfig file to '$HOME'..."
	if [[ ! -f $HOME/.gitconfig ]]; then
		cp $HOME/code/scripts/gitconfig $HOME/.gitconfig && log -i "Copying gitconfig file to '$HOME' complete."
	else
		log -w "Aborted: gitconfig file already exists."
	fi

}

function install() {
	log -i "Installing brew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	log -i "Installing brew complete."

	log -i "Installing GNU parallel..."
	brew install parallel
	log -i "Installing GNU parallel complete."

	log -i "Installing brew programs..."
	log -i "This will take a while and you wont see any download progress."
	parallel brew fetch ::: elasticsearch kibana node yarn mysql thefuck ctop sbt unrar httpie git bash-completion hub postgresql coreutils
	brew install elasticsearch kibana node yarn mysql thefuck ctop sbt unrar httpie git bash-completion hub postgresql coreutils
	brew upgrade
	log -i "Installing brew programs complete."

	log -i "Installing brew cask programs..."
	log -i "This will take a while and you wont see any download progress."
	parallel brew cask fetch ::: google-chrome spotify whatsapp java8 intellij-idea docker-edge datagrip webstorm slack font-fira-code spectacle steam sublime-text tomighty qbittorrent spotify-notifications vlc
	brew cask install google-chrome spotify whatsapp java8 intellij-idea docker-edge datagrip webstorm slack font-fira-code spectacle steam sublime-text tomighty qbittorrent spotify-notifications vlc
	brew cask upgrade
	log -i "Installing brew cask programs complete."
}

function fetch() {
	cd $PALAN_SCRIPTS && git pull && log -i "Repo succesfully updated" || log -e "Couldn't update repo"
	cd - > /dev/null
}

function cleanup() {
	log -i "Erasing brew and brew cask cache..."
	rm -rf $(brew --cache)
	brew cask cleanup
	log -i "Erasing brew and brew cask cache complete."
}

function update() {
	log -e "Not implemented yet."
}

# TODO: change these with a switch case
if [[ $1 == "install" ]]; then
	install
fi

if [[ $1 == "config" ]]; then
	config
fi

if [[ $1 == "fetch" ]]; then
	fetch
fi

if [[ $1 == "update" ]]; then
	update
fi

if [[ $1 == "cleanup" ]]; then
	cleanup
fi

if [[ $1 == "" ]]; then
	echo "Usage: . install.sh { install | config | fetch | update | cleanup }"
fi
