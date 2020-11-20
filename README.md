## Available functionality and shortcuts

- `jj` - escape insert mode
- changed standard leader key `\` to `Space`
- `Ctrl+N` show directory tree
- `F12` toggle terminal, `F10` save the current file and execute
- Python motions and text object e.g. whole function `af` or go to next function `]m`, more on https://github.com/jeetsukumaran/vim-pythonsense
- autocompletion with deoplete-jedi, Tab key can be used to choose completions
- code navigation provided by jedi-vim, e.g. go to definition `Space-d`, show documentation `Shift-K`, more on 
https://github.com/davidhalter/jedi-vim
- vim-sorround for easy deletion, adding and changing of "sorroundings"  https://github.com/tpope/vim-surround
- vim-commentary https://github.com/tpope/vim-commentary
- vim-exchange for swapping text https://github.com/tommcdo/vim-exchange
- vim-easymioton - activate with `s` in normal mode, line motions activated with `Space-j` and `Space-k` https://github.com/easymotion/vim-easymotion


## Installation instruction

1. Create nvim directory and download the latest neovim appimage from https://github.com/neovim/neovim/releases

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
3. Create a configuration directory and copy the configuration file
   
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