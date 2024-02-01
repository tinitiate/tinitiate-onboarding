#!/bin/sh

export HOMEBREW_BREW_GIT_REMOTE="..."  # put your Git mirror of Homebrew/brew here
export HOMEBREW_CORE_GIT_REMOTE="..."  # put your Git mirror of Homebrew/homebrew-core here

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew_install() {
    echo "\n Installing $1"
    if brew list $1 &> /dev/null; then
        echo "${1} is already installed"
    else 
        brew tap aws/tap
        brew install $1 && echo "$1 is installed"
    fi
}

brew_install "pyenv"
pyenv install 3.9.10
pyenv global 3.9.10
brew_install "visual-studio-code" 
brew_install "awscli" 
brew_install "aws-sam-cli" 
brew_install "dbeaver-community" 
brew_install "brew-pip"
brew_install "git"
brew_install "docker"


# Install VS Code extensions
echo "\n Installing VS Code extensions"
    code --install-extension alefragnani.project-manager
    code --install-extension amazonwebservices.aws-toolkit-vscode
    code --install-extension bierner.markdown-preview-github-styles
    code --install-extension Boto3typed.boto3-ide
    code --install-extension evilz.vscode-reveal
    code --install-extension gera2ld.markmap-vscode
    code --install-extension marp-team.marp-vscode
    code --install-extension ms-python.python
    code --install-extension ms-python.vscode-pylance
    code --install-extension ms-vscode.live-server
    code --install-extension ms-vscode.notepadplusplus-keybindings
    code --install-extension qcz.text-power-tools
    code --install-extension zeshuaro.vscode-python-poetry

# Install Python packages
pip3 install PyMySQL
pip3 install django
pip3 install djangorestframework
pip3 install pytz 
pip3 install psycopg2-binary
