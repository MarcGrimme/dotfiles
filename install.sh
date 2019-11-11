#!/bin/bash
DOTFILES_DIR=${DOTFILES_DIR:-$HOME/src/dotfiles}
FILES=${FILES:-bashrc profile profile.d/google.sh gitconfig global-gitignore vim vimrc}
PROFILE_D=${PROFILE_D:-.profile.d}
backup() {
    local file=$1
    if ! [ -L .$file ] && [ -f .$file ]; then
        mv .$file .$file.orig
    fi
}

link() {
    local file=$1

    [ -L .$file ] || ln -sf $DOTFILES_DIR/$file .$file
}

vim_setup() {
    vim_vundle
}

vim_vundle() {
    [ -d ~/vim/bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

[ -d ~/${PROFILE_D} ] || mkdir ~/${PROFILE_D}
echo -n "Creating/Updating links to dotfiles"
for file in $FILES; do
    backup $file
    link $file
    echo -n "."
done
echo "(OK)"

if [ -z "$NO_VIM" ]; then
    echo -n "Application specific stuff "
    vim_setup
    echo "(OK)"
fi
