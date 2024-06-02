#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2024-06-02 16:47 
# @description: 

sudo apt install zsh autojump -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZDOTDIR:-$HOME}/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR:-$HOME}/.zsh/zsh-syntax-highlighting

cat >> ${ZDOTDIR:-$HOME}/.zshrc << EOF

source /usr/share/autojump/autojump.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

source ${ZDOTDIR:-$HOME}/.zshrc