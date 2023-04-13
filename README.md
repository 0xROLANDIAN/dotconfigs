# dotconfigs

## nvim

Migrated basic setup for nvim with lua config and Lazy plugin manager

Includes the followihg

### LSP Zero
https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/tutorial.md

https://github.com/LuaLS/lua-language-server/wiki/Formatter


### Included
* lazy vim // Plugin manager
* mason // package manager
* CMP // autocompletion
* null-ls-vim // prettier formatting
* prettier // Typescript / JS formatting
* telescope // finding files rip-grep
* vim fugitive
* Vim legacy commands wrapped in vim.cmd (to be migrated)

```
├── init.lua
└── lua
    └── plugins.lua
```
### Luarocks macOS 
#### macports
`xcode-select --install`
`sudo xcodebuild -license`
`sudo port install luarocks`
