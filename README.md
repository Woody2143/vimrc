My VIMRC directory...

Upon cloneing the directory you must run:

1. cd .vim

2. mkdir bundle

3. git clone https://github.com/gmarik/Vundle.vim.git bundle/vundle

4. open vim

5. :BundleInstall

6. exit vim

7. cd bundle/tern_for_vim

8. npm install

9. cd ../YouCompleteMe

10. ./install.py --tern-completer

All that installs and sets up the various vim plugins...

Likely you'll need some dependincies for YCM, see the documentation...
