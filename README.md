# Nvim

Neovim configuration

### Quick start

1. Remove or backup your current configuration

```sh
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/site/nvim
```

2. Clone the repo, and place in `~/.config`

That's it. That's the quick start.

### Modifications

Installation of servers and tooling is managed by Mason, so adjust the list of installed tools and servers if you want add more, just copy the existing pattern for server configuration, which is pretty self-documenting.

### Colors

Theme is Noctu which passes your terminal theme into Nvim. I'm using a modified version of [pap][1] to set my color theme.

[1]: https://github.com/fehawen/pap
