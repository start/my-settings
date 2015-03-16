if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# If an app is installed with Homebrew, we want that installation to take
# precedence over any other installation. To do accomplish this, we put the
# following directory at the front of `$PATH`:
export PATH=/usr/local/bin:$PATH
