#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade --all
brew install findutils
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget --with-iri


brew install python
brew install python3

brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

brew install screen
brew install dark-mode
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install heroku/brew/heroku
heroku update
brew install mysql
brew install mongo
brew install redis
brew install elasticsearch
brew install caskroom/cask/brew-cask
brew cask install --appdir="~/Applications" java8
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" google-backup-and-sync
brew cask install --appdir="/Applications" intellij-idea
brew cask install --appdir="/Applications" clion
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" microsoft-office
brew cask install --appdir="/Applications" luyten
brew cask install --appdir="/Applications" teamviewer
brew cask install --appdir="/Applications" postman
brew cask install --appdir="/Applications" mas

mas lucky Trello
mas lucky WeatherBug
mas lucky Bandwidth+
mas lucky "Microsoft Remote Desktop 10"

brew install docker
brew install docker-compose
brew install node

npm install -g jshint
npm install -g less
npm install -g typescript
npm install -g ts-node


brew cleanup


###############################################################################
# Virtual Enviroments                                                         #
###############################################################################

echo "------------------------------"
echo "Setting up virtual environments."

# Install virtual environments globally
# It fails to install virtualenv if PIP_REQUIRE_VIRTUALENV was true
export PIP_REQUIRE_VIRTUALENV=false
pip install virtualenv
pip install virtualenvwrapper

echo "------------------------------"
echo "Source virtualenvwrapper from ~/.extra"

EXTRA_PATH=~/.extra
echo $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "# Source virtualenvwrapper, added by pydata.sh" >> $EXTRA_PATH
echo "export WORKON_HOME=~/.virtualenvs" >> $EXTRA_PATH
echo "source /usr/local/bin/virtualenvwrapper.sh" >> $EXTRA_PATH
echo "" >> $BASH_PROFILE_PATH
source $EXTRA_PATH

echo "------------------------------"
echo "Setting up AWS."
echo "------------------------------"
source ~/.extra

###############################################################################
# Python 2 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Updating py2-data virtual environment with AWS modules."

# Create a Python2 data environment
# If this environment already exists from running pydata.sh,
# it will not be overwritten
mkvirtualenv py2-data
workon py2-data

pip install boto
pip install awscli
pip install mrjob
pip install s3cmd

EXTRA_PATH=~/.extra
echo $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "# Configure aws cli autocomplete, added by aws.sh" >> $EXTRA_PATH
echo "complete -C '~/.virtualenvs/py2-data/bin/aws_completer' aws" >> $EXTRA_PATH
source $EXTRA_PATH

###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Updating py3-data virtual environment with AWS modules."

# Create a Python3 data environment
# If this environment already exists from running pydata.sh,
# it will not be overwritten
mkvirtualenv --python=/usr/local/bin/python3 py3-data
workon py3-data

pip install boto
pip install awscli

EXTRA_PATH=~/.extra
echo $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "# Configure aws cli autocomplete, added by aws.sh" >> $EXTRA_PATH
echo "complete -C '~/.virtualenvs/py3-data/bin/aws_completer' aws" >> $EXTRA_PATH
source $EXTRA_PATH

brew install apache-spark

###############################################################################
# Install IPython Notebook Spark Integration
###############################################################################

echo "------------------------------"
echo "Installing IPython Notebook Spark integration"

# Add the pyspark IPython profile
cp -r init/profile_pyspark/ ~/.ipython/profile_pyspark

BASH_PROFILE_PATH=~/.bash_profile
echo $BASH_PROFILE_PATH
echo "" >> $BASH_PROFILE_PATH
echo "" >> $BASH_PROFILE_PATH
echo "# IPython Notebook Spark integration, added by aws.sh" >> $BASH_PROFILE_PATH
# Run $ brew info apache-spark to determine the Spark install location
echo "export SPARK_HOME='/usr/local/Cellar/apache-spark/1.4.1'" >> $BASH_PROFILE_PATH
echo "# Appending pyspark-shell is needed for Spark 1.4+" >> $BASH_PROFILE_PATH
echo "export PYSPARK_SUBMIT_ARGS='--master local[2] pyspark-shell'" >> $BASH_PROFILE_PATH
echo "" >> $BASH_PROFILE_PATH
source $BASH_PROFILE_PATH

echo "------------------------------"
echo "TODO: Update .aws/ with your AWS credentials and region, or run aws --configure."
echo "TODO: Update .mrjob.conf with your credentials, keypair, keypair location, region, and bucket info."
echo "TODO: Update .s3cfg with your credentials, location, and passphrase or run s3cmd --configure."
echo "Script completed."