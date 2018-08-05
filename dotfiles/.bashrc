# Use Vim as the default editor
export EDITOR=vim

# Set the Bash prompt. Newlines are preserved, and
# `\w` is the working directory
export PS1="\n\n\w\n"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
