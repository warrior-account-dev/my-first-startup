chmod +x setup.sh



#!/bin/bash

# Update and upgrade system
echo "Updating system..."
sudo apt update -y && sudo apt upgrade -y

# Install system monitoring tools
echo "Installing btop and htop..."
sudo apt install -y btop htop

# Install Git and GitHub CLI
echo "Installing Git and GitHub CLI..."
sudo apt install -y git
curl -fsSL https://cli.github.com/packages/githubcli-archive.key | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
sudo apt update
sudo apt install gh

# Install VSCode
echo "Installing Visual Studio Code..."
sudo apt install -y software-properties-common apt-transport-https curl
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft-archive-keyring.gpg
sudo mv microsoft-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code

# Install Cursor (Terminal Management)
echo "Installing Cursor..."
curl -fsSL https://github.com/cursor-so/cursor/releases/download/v1.0.0/cursor-linux-x64.tar.gz -o cursor.tar.gz
tar -xvzf cursor.tar.gz
sudo mv cursor /usr/local/bin/cursor
rm cursor.tar.gz

# Install Google Chrome
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Install tldr (Simplified man pages)
echo "Installing tldr..."
sudo apt install -y tldr

# Install Discord
echo "Installing Discord..."
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install -y ./discord.deb
rm discord.deb

# Install OBS Studio
echo "Installing OBS Studio..."
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update
sudo apt install -y obs-studio

# Install DBeaver
echo "Installing DBeaver..."
sudo apt install -y dbeaver-ce

# Install MongoDB Compass
echo "Installing MongoDB Compass..."
wget https://downloads.mongodb.com/compass/mongodb-compass_1.32.3_amd64.deb
sudo dpkg -i mongodb-compass_1.32.3_amd64.deb
sudo apt-get install -f  # Fix missing dependencies
rm mongodb-compass_1.32.3_amd64.deb

echo "Installation complete!"





#!/bin/bash

# Update and upgrade system
echo "Updating system..."
sudo apt update -y && sudo apt upgrade -y

# Install Docker and Docker Compose
echo "Installing Docker..."
# Install dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# Set up the stable Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update and install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
# Start Docker and enable it to run on boot
sudo systemctl start docker
sudo systemctl enable docker

# Install Docker Compose
echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker and Docker Compose installation
docker --version
docker-compose --version

# Install Python and pip
echo "Installing Python and pip..."
sudo apt install -y python3 python3-pip python3-venv

# Verify Python and pip installation
python3 --version
pip3 --version

# Install Node.js
echo "Installing Node.js..."
# Install dependencies
sudo apt install -y curl
# Add NodeSource repository for the latest Node.js
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
# Install Node.js
sudo apt install -y nodejs

# Verify Node.js installation
node -v
npm -v

echo "Installation complete!"

