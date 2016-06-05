#!/usr/bin/env bash

apt-get update
apt-get upgrade -y

# Python 2.7
sudo apt-get -y install build-essential python-dev libsqlite3-dev libreadline6-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 zip python-pip python-dev libmysqlclient-dev python-virtualenv git
sudo easy_install pip
echo "alias activate='. /home/vagrant/venv/bin/activate'" >> ~/.bashrc
echo "alias run-app='python manage.py runserver'" >> ~/.bashrc
echo "alias shell='python manage.py shell'" >> ~/.bashrc
echo "export CLICOLOR=1" >> ~/.bashrc
echo "export PS1='\w :>'" >> ~/.bashrc

# Latest update for Python 2 & 3 plus pyenv
sudo apt-get install git python-pip make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
sudo pip install virtualenvwrapper

git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'pyenv virtualenvwrapper' >> ~/.bashrc

# source ~/.bashrc
# pyenv install 2.7.9
# pyenv install 3.4.3
# pyenv global 3.4.3
# pyenv virtualenv 2.7.9 my-virtual-environment
# cd path/to/my/project
# pyenv local my-virtual-environment

# Install Node.js with Node Version Manager
# First, make sure you have a C++ compiler. Open the terminal and install the build-essential and libssl-dev packages if needed. By default, Ubuntu does 
# not come with these tools — but they can be installed in the command line.
# Use apt-get to install the build-essential package:
   sudo apt-get install build-essential checkinstall

# Employ a similar process to get libssl-dev:
   sudo apt-get install libssl-dev

# You can install and update Node Version Manager, or nvm, by using cURL:
   curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

# You will be asked to close and reopen the terminal. To verify that nvm has been successfully installed after you reopen the terminal, use:
   command -v nvm
# That command will output nvm if the installation worked.

# To download, compile and install the latest version of Node:
   nvm install 5.0

# In any new shell, you’ll need to tell nvm which version to use:
   nvm use 5.0

# To set a default Node.js version to be used in any new shell, use the alias default:
 nvm alias default node

# Not only does nvm allow you to run newer versions of Node.js and npm, you can install and migrate any desired versions you’d prefer. Go to the 
# nvm GitHub repository for more information.

# Move the node_modules folder out of the synced folder (vagrant)
# let's get "node_modules" out of the synced folder
mkdir /home/vagrant/node_modules
cd /vagrant

# Vagrant Issue
# The source and target of the symlink must have the same name or some npm installs might fail
ln -s /home/vagrant/node_modules/ node_modules
# or, but could through errors 
cd /vagrant/react/some-particular-project
ln -s /home/vagrant/node_modules_some-particular-project/ node_modules

# install a node.js package locally in the project
npm install karma
