sudo add-apt-repository contrib
sudo add-apt-repository non-free
sudo apt-get update

# nvidia
sudo apt -y install nvidia-driver


sudo apt-get -y install \
    ddclient \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    iptables \
    git \
    python3 \
    python3-pip \
    default-jre \
    default-jdk \
    maven \
    lshw \
    npm \
    sysvinit-utils \
    xrdp \
    htop \



# yarn
npm install -g yarn

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 12
nvm use 12
# docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install \
    docker-ce \
    docker-ce-cli \
    containerd.io \

