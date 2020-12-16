sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    git \
    python3 \
    python3-pip \
    default-jre \
    default-jdk \
    maven \
    lshw \
    sysvinit-utils \
    htop \


# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.bashrc && nvm install 12
source ~/.bashrc && nvm use 12

# yarn
npm install -g yarn