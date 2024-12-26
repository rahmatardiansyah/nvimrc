# Personal Neovim Configuration

## dependencies

- [tree-sitter](https://github.com/tree-sitter/tree-sitter)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [stylua](https://github.com/JohnnyMorganz/StyLua)
- [typescript](https://github.com/microsoft/TypeScript)
- [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)
- [prettier](https://github.com/prettier/prettier)
- [beautysh](https://github.com/lovesegfault/beautysh)
- [lua-language-server](https://github.com/sumneko/)
- [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted)
- [trash-cli](https://github.com/andreafrancia/trash-cli)

### Fedora dnf

```shell
$ sudo dnf install neovim gcc-c++ tree-sitter-cli ripgrep fd-find trash-cli
```

### Arch Linux / Pacman Package Manager

```shell
$ sudo pacman -S neovim xsel xclip tree-sitter ripgrep fd stylua lua-language-server trash-cli
```

### NPM / package manager for Node.js

```shell
$ npm install -g typescript typescript-language-server prettier vscode-langservers-extracted @olrtg/emmet-language-server @astrojs/language-server prettier-plugin-astro @tailwindcss/language-server eslint_d @fsouza/prettierd
```

### Nix

```shell
$ nix-env -iA nixpkgs.nixfmt
```

### Mason

- stylua
- shfmt
- lua-language-server
- latexindent

# Todo

- [ ] add colorscheme
- [ ] make some plugin lazy
