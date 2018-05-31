echo "[INFO] Writting to .bash_profile..."
SOURCE_SCRIPT_LINE="source $HOME/code/scripts/palanrc.sh"
if ! grep -x -q "$SOURCE_SCRIPT_LINE" ~/.bash_profile ; then
	echo $SOURCE_SCRIPT_LINE >> ~/.bash_profile
fi
source ~/.bash_profile
echo "[INFO] Writting to .bash_profile complete."

echo "[INFO] Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "[INFO] Installing brew complete."

echo "[INFO] Installing GNU parallel..."
brew install parallel
echo "[INFO] Installing GNU parallel complete."

echo "[INFO] Installing brew programs..."
echo "[INFO] This will take a while and you wont see download progress."
parallel brew fetch ::: hub elasticsearch yarn kibana mysql thefuck ctop node sbt unrar httpie bash-completion
brew install hub elasticsearch yarn kibana mysql thefuck ctop node sbt unrar httpie bash-completion
brew upgrade
# rm -rf $(brew --cache)
echo "[INFO] Installing brew programs complete."

echo "[INFO] Installing brew cask programs..."
echo "[INFO] This will take a while and you wont see download progress."
parallel brew cask fetch ::: datagrip docker font-fira-code intellij-idea java8 spectacle steam sublime-text tomighty webstorm whatsapp
brew cask install datagrip docker font-fira-code intellij-idea java8 spectacle steam sublime-text tomighty webstorm whatsapp
brew cask upgrade
# brew cask cleanup
echo "[INFO] Installing brew cask programs complete."
