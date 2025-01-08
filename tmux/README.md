# Tmux Cheatsheet

## Key Commands

Document: https://tmuxcheatsheet.com/

Install Tmux: `brew install tmux`

Load Config in Tmux mode: `tmux source-file ~/.tmux.conf`

Enable plugins

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install plugins: `Prefix + I`

Reload config tmux in tmux mode: `Prefix + r`

Reload theme: `tmux kill-server && rm -rf /tmp/tmux-*`

## Shortcuts

Prefix: `CTRL + b`

Sessions:

- Save sessions: `Prefix + CTRL + s`
- Restore session: `Prefix + CTRL + r`

Pane:

- Resize pane: `Prefix + j k l h`
- Maximize pane: `Prefix + m`
- Split horizontal: `Prefix + \`
- Split vertical: `Prefix + -`
