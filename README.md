# nvim

Neovim configuration, assumes you are building from Nightly. At the time of writing, that is v0.10.0-dev-XXXX. Quite a few of the plugins I use are from [mini.nvim][1] and I highly recommend checking it out, and keeping an eye on upcoming releases.

`Setup` and `Configuration` are logically separate just because I think that is the direction plugins are going to take with all the commotion lately around `.setup { }`

### Quick start

1. Remove or backup your current configuration

```sh
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/site/nvim
```

2. Clone the repo, and place in `~/.config`

### Colors

Color theme is Noctu which passes your terminal theme into Nvim. I'm using a modified version of [pap][2] to set my color theme.

[1]: https://github.com/echasnovski/mini.nvim
[2]: https://github.com/fehawen/pap
