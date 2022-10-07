#!/bin/bash
# Requires that Environment folder is located in home directory
if [[ $OSTYPE == 'darwin'* ]]; then
  echo "Mac Specific Setup..."
  LINUX_SETUP=0
else 
  echo "Linux Specific Setup..."
  LINUX_SETUP=1
fi

function linux_install {
    echo "Installing apps"
    sudo apt install\
        python3\
        python3-setuptools\
        vim\
        tmux\
        minicom\
        picocom\
        stow
}

function setup_dirs {
  echo
  echo "Creating bin directory"
  mkdir -p $HOME/bin

  echo
  echo "Linking dot files and bin directory"

  cd $HOME/Environment
  stow -v vim\
          bash\
          tmux\
          git\
          bin

  if ! (ls -a $HOME | grep -qi .bash_local); then
    touch $HOME/.bash_local
    cat "#!/bin/bash \n # Add extra setup here!" >> $HOME/.bash_local
  fi
  source $HOME/.bashrc

}


# Mac or linux specific behaviour
if [[ $OSTYPE == 'darwin'* ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install tmux
else
    linux_install 
    setup_dirs
fi

# link all files to home directory. 
