# nvim 

## Requirements

- nvim
- bat (optional)
- fzf (installed automatically)
- python (optional, remove `Plug 'wakatime/vim-wakatime'` from `init.vim` if you don't want it)
- ripgrep for `:Rg` support (optional, but recommended)
    - Add this in your `~/.bashrc/` or `~/.zshrc` 
    ```sh
    if type rg &> /dev/null; then
        export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!.git/'"
    fi
    ```

## How to setup

0. Install `neovim`
1. Copy the contents `nvim` directory into `~/.config/nvim`
2. Install `node`
3. `yarn global add neovim` or `npm -g install neovim`
4. Run `nvim`, type `:PlugInstall` and restart `nvim`
5. If you're going to be using `wakatime`, you'll be prompted to add your API key, otherwise, remove the line in `init.vim`

## Plugins

alot.

- coc.nvim
    - autocompletion
    - go to definition / references / implementations
- vim-polyglot
    - syntax highlighting for a lot of languages
- wakatime
    - stats and stuff
- vim-go
    - golang related tooling (goimpl, building, testing, running, goimports etc)
    - autocompletion is disabled, due to me wanting to handle all autocompletion and goto definition through coc
- ale
    - linter only
