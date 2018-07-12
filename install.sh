# update osx
# install xcode
xcode-select --install

# brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew install git
# install python
brew install python
# pip
curl -O http://python-distribute.org/distribute_setup.py
python distribute_setup.py

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py


# virtualenv
pip install virtualenv

# tmux
brew install tmux

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#fonts
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
brew tap caskroom/fonts && brew cask install font-source-code-pro

# neovim
#install plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install nvm

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash


echo source ~/dotfiles/.tmux.conf > ~/.tmux.conf
echo source ~/dotfiles/.zshrc > ~/.zshrc

curl ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

