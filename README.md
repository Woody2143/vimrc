My VIMRC directory...

Upon cloneing the directory you must run:
# cd .vim
# mkdir bundle
# git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim
# open vim
# :BundleInstall
# exit vim
# cd bundle/tern_for_vim
# npm install
# cd ../YouCompleteMe
# ./install.py --tern-completer

All that installs and sets up the various vim plugins...

Likely you'll need some dependincies for YCM, see the documentation...
