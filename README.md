# Installation instruction

1. Create nvim directory and download latest neovim appimage from https://github.com/neovim/neovim/releases

```
mkdir ~/nvim
wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage -P ~/nvim
```
2. Add appropriate access permissions
```
chmod u+x ~/nvim/nvim.appimage
```
3. Install vim-plug https://github.com/junegunn/vim-plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
3. Create configuration directory and copy configuration file
   
```
mkdir ~/.config/nvim
cp init.vim ~/.config/nvim
```
4. Add alias to your rc file (e.g. .bashrc)

```
echo 'alias vim="~/nvim/nvim.appimage"' >> ~/.bashrc
source ~/.bashrc
```
5. Install pynvim and jedi python packages (preferably in separate env)
```
pip install -U jedi pynvim
```
6. Install all plugins
```
vim -c PlugInstall -c qall
vim -c UpdateRemotePlugins -c qall 
```
7. Your vim is ready to use