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
	cp $HOME/code/scripts/gitconfig $HOME/.gitconfig && log -i "Copying gitconfig file to '$HOME' complete."

}

function install() {
	log -i "Installing brew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	log -i "Installing brew complete."

	log -i "Installing GNU parallel..."
	brew install parallel
	log -i "Installing GNU parallel complete."

	log -i "Installing brew programs..."
	cat formulaes
	log -i "This will take a while and you wont see any download progress."
	cat formulaes | xargs parallel brew fetch :::
	cat formulaes | xargs brew install
	brew upgrade
	log -i "Installing brew programs complete."

	log -i "Tapping homebrew/cask-fonts..."
	brew tap homebrew/cask-fonts
	log -i "Tapping homebrew/cask-fonts complete."

	log -i "Tapping homebrew/cask-versions..."
	brew tap homebrew/cask-versions
	log -i "Tapping homebrew/cask-versions complete."

	log -i "Installing brew cask programs first round..."
	cat cask-formulaes-1
	log -i "This will take a while and you wont see any download progress."
	cat cask-formulaes-1 | xargs parallel brew cask fetch :::
	cat cask-formulaes-1 | xargs brew cask install
	brew cask upgrade
	log -i "Installing brew cask programs first round complete."

	log -i "Installing brew cask programs second round..."
	cat cask-formulaes-2
	log -i "This will take a while and you wont see any download progress."
	cat cask-formulaes-2 | xargs parallel brew cask fetch :::
	cat cask-formulaes-2 | xargs brew cask install
	brew cask upgrade
	log -i "Installing brew cask programs second round complete."

	log -i "Installing brew cask programs third round..."
	cat cask-formulaes-3
	log -i "This will take a while and you wont see any download progress."
	cat cask-formulaes-3 | xargs parallel brew cask fetch :::
	cat cask-formulaes-3 | xargs brew cask install
	brew cask upgrade
	log -i "Installing brew cask programs third round complete."
}

function fetch() {
	cd $PALAN_SCRIPTS && git pull && log -i "Repo succesfully updated" || log -e "Couldn't update repo"
	cd - > /dev/null
}

function cleanup() {
	log -i "Erasing brew and brew cask cache..."
	rm -rf $(brew --cache)
	brew cleanup
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
