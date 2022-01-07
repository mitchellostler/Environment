# Requires that Environment folder is located in home directory

# Mac or linux specific behaviour
if [[ $OSTYPE == 'darwin'* ]]; then
  echo "Mac Specific Setup..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install tmux
else
  echo "Linux Specific Setup..."
  sudo apt-get install tmux	
fi

# link all files to home directory. 
cp -r .vim ~
cp .bashrc .vimrc .tmux.conf ~

