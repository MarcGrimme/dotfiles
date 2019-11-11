#!/bin/bash
DOTFILES_DIR=${DOTFILES_DIR:-src/dotfiles}
FILES=${FILES:-bashrc profile profile.d gitconfig global-gitignore vim vimrc}
backup() {
    local file=$1
    if ! [ -L .$file ]; then
        mv .$file .$file.orig
        true
    fi
    false
}

link() {
    local file=$1

    ln -sf $DOTFILES_DIR/$file .$file
}

vim_setup() {
    vim_vundle
}

vim_vundle() {
    [ -d ~/vim/bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

echo -n "Creating/Updating links to dotfiles"
for file in $FILES; do
    backup $file && \
    link $file
    echo -n "."
done
echo "(OK)"

echo -n "Application specific stuff "
vim_setup
echo "(OK)"
