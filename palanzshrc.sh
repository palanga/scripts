export PALAN_SCRIPTS="$HOME/code/scripts"

# haskell stuff
# export PATH=$PATH:/Users/palan/.local/bin
# elasticsearch
# export PATH=$PATH:/usr/local/Cellar/elasticsearch/6.2.4/libexec/bin/x-pack/
# my scripts
export PATH="$PATH:$PALAN_SCRIPTS"

export PATH="$PATH:/Users/palan/sbt/bin"

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home"


# export CLICOLOR=1

function repos() {
    http GET "https://api.github.com/users/palanga/repos?sort=created&direction=asc"
}

# alias ls='gls --color=always'
alias lsl='gls -FAhlX --group-directories-first --color=always'
alias androidstudio='open -a /Applications/Android\ Studio.app'
alias src='source ~/.zshrc'
alias cdcode='cd ~/code'
alias cdscripts='cd ~/code/scripts'
alias mrebase='git checkout master && git pull && git checkout - && git rebase master'
alias editscripts='subl $PALAN_SCRIPTS'

function tiles_2() {
	filename=$1
	extension="${filename##*.}"
	image_name="${filename%.*}"

	width=`vipsheader -f width $filename`
	height=`vipsheader -f height $filename`

	half_width=$((width / 2))

	first="${image_name}_1.${extension}"
	second="${image_name}_2.${extension}"

	echo $filename
	echo $image_name
	echo $extension
	echo $width
	echo $height
	echo $half_width
	echo $first
	echo $second

	vips extract_area $filename $first 0 0 $half_width $height
	vips extract_area $filename $second $half_width 0 $half_width $height

}


# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

eval $(thefuck --alias)
