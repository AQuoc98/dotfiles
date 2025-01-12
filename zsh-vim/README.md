# ZSH Configuration

## Installed

- Fonts

  - Search font: brew search nerd-font
  - Installed fonts: fira-code, fira-mono

- Warp

- Starship 

- CLI
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - fzf
  - fd
  - bat
  - eza
  - zoxide

## Terminal Command
- https://github.com/0nn0/terminal-mac-cheatsheet

- Aliases
  - `c`: clear
  - `ls`: list horizontal
  - `ll`: list vertical 

- FZF 
  - Type `fzf` or press `<C-t>`: get a list of files and directories 
    - `<C-c`: quit mode
    - `<C-j>` or `<C-k`: move down / up
    - `<Tab>` or `<S-Tab`: mark multiple items 
    - `<C-/`: change preview window
  - `COMMAND [DIRECTORY/][FUZZY_PATTERN]**<Tab>`
  - `<C-r`: paste the selected command from history onto the command-line
  - `<ALT-c>`: get a list of directories 

- Zoxide
  - Use `z` to move
  - `z <Tab>`: show different possible directories

- Lazygit: type `lg`

## VIM In VSCODE Command
- Cheatsheet
  - https://github.com/VSCodeVim/Vim/blob/master/ROADMAP.md
  - https://vim.rtorr.com/
  - https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/cheatsheet 

- VIM 
  - `leader = space`
  - `x`: delete not yank
  - `jk`: exit insert mode 
  - visual - `< || >`: stay in indent mode
  - visual - `J || K`: move line up and down
  - `<leader>v`: split window vertically
  - `<leader>s`: split window horizontally
  - `<C-h> || <C-j> || <C-k> || <C-l>`: navigate between split
  - `jk`: quit insert mode
  - `<Tab>`: tab previous
  - `<S-Tab>`: tab next
  - `C-n`: clear search highlight
  - `<leader>p`: format
  - `<C-z>`: toggle zen mode

- LSP
  - `gd`: go to definition
  - `gpd`: peek definition
  - `K`: show hover
    - `h j k l`: scroll when hover
  - `gi`: go to implementations
  - `gpi`: peek implementations
  - `gq`: quick fix (open the code action lightbulb menu)
  - `gr`: go to references
  - `gs`: rename
  - `gt`: go to type definition
  - `gpt`: peek type definition
  - `[d || ]d`: show diagnostic

- Finder
  - `<Command-p>`: Go to file
  - `<C-n>` || `<C-p>`: move next or previous

- Suggestion
  - `C-c`: toggle suggestion
  - `<C-n>` || `<C-p>`: move next or previous

- File Explore
  - `<C-e>`: toggle open
  - `n`: new file
  - `r`: rename file
  - `<S-n`: new folder
  - `d`: delete file

- Terminal
  - `Cmd-J`: toggle terminal visibility
  - `<C-;>`: switch between terminal and active editor
  - `<C-S-;>`: maximize/minimize terminal panel and focus terminal
  - `<C-S-j>`: focus next terminal
  - `<C-S-k>`: focus previous terminal
  - `<C-S-n>`: new terminal
  - `<C-S-w>`: kill terminal