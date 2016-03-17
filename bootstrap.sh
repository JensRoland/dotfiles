#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

echo "Pulling latest dotfiles from Git..."
git pull origin master;

function doIt() {

    if command -v rsync >/dev/null 2>&1; then
        echo "Syncing dotfiles to home directory..."
        rsync --exclude ".git/" --exclude ".DS_Store" --exclude "*.sh" \
            --exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
    else
        echo "Rsync not found."
        if [[ "$(uname -s)" = "MINGW32_NT-6.2" ]]; then
            echo "Windows environment detected. This is going to be a little different. Copying dotfiles to home directory..."
            cp .* ~
            cp -r .vim ~
        else
            echo "Environment unknown or incompatible. Exiting.."
            exit 1;
        fi
    fi

    echo "Reloading bash profile..."
    source ~/.bash_profile;
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY = "y" ]]; then
        doIt;
        echo "Bootstrap done"
    else
        echo "Bootstrap aborted"
    fi;
fi;
unset doIt;

