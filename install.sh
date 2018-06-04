function config() {
	echo "[INFO] Writting to .bash_profile..."
	SOURCE_SCRIPT_LINE="source $HOME/code/scripts/palanrc.sh"
	if ! grep -x -q "$SOURCE_SCRIPT_LINE" ~/.bash_profile ; then
		echo $SOURCE_SCRIPT_LINE >> ~/.bash_profile
	fi
	source ~/.bash_profile
	echo "[INFO] Writting to .bash_profile complete."

	echo "[INFO] Copying gitconfig file to '$HOME'..."
	if [[ ! -f $HOME/.gitconfig ]]; then
		cp $HOME/code/scripts/gitconfig $HOME/.gitconfig && echo "[INFO] Copying gitconfig file to '$HOME' complete."
	else
		echo "[WARN] Aborted: gitconfig file already exists."
	fi

}

function install() {
	echo "[INFO] Installing brew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "[INFO] Installing brew complete."

	echo "[INFO] Installing GNU parallel..."
	brew install parallel
	echo "[INFO] Installing GNU parallel complete."

	echo "[INFO] Installing brew programs..."
	echo "[INFO] This will take a while and you wont see any download progress."
	parallel brew fetch ::: elasticsearch kibana node yarn mysql thefuck ctop sbt unrar httpie git bash-completion hub
	brew install elasticsearch kibana node yarn mysql thefuck ctop sbt unrar httpie git bash-completion hub
	brew upgrade
	echo "[INFO] Installing brew programs complete."

	echo "[INFO] Installing brew cask programs..."
	echo "[INFO] This will take a while and you wont see any download progress."
	parallel brew cask fetch ::: google-chrome spotify whatsapp java8 intellij-idea docker-edge datagrip webstorm slack font-fira-code spectacle steam sublime-text tomighty qbittorrent spotify-notifications vlc
	brew cask install google-chrome spotify whatsapp java8 intellij-idea docker-edge datagrip webstorm slack font-fira-code spectacle steam sublime-text tomighty qbittorrent spotify-notifications vlc
	brew cask upgrade
	echo "[INFO] Installing brew cask programs complete."
}

function fetch() {
	cd $PALAN_SCRIPTS && git pull && echo "[INFO] Repo succesfully updated" || echo "[ERROR] Couldn't update repo"
	cd - > /dev/null
}

function cleanup() {
	"[INFO] Erasing brew and brew cask cache..."
	rm -rf $(brew --cache)
	brew cask cleanup
	"[INFO] Erasing brew and brew cask cache complete."
}

function update() {
	echo "not implemented yet."
}

if [[ $1 == "install" ]]; then
	install
fi

if [[ $1 == "config" ]]; then
	config
fi

if [[ $1 == "fetch" ]]; then
	fetch
fi

if [[ $1 == "cleanup" ]]; then
	cleanup
fi

if [[ $1 == "" ]]; then
	echo "usage: . install.sh {install|config|fetch|update|cleanup}"
fi
