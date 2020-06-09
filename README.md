<h1 align="center">Neovim Dotfiles</h1>
<br>

Uses [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.

Installation
------------

    mkdir ~/.config
    brew install neovim fzf ripgrep
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'  # Install Plug
    git clone https://github.com/corymb/neovim-dotfiles.git ~/.config/nvim
    nvim +PlugInstall  # Install Plugins
