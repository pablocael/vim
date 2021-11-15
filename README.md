# vim

for installing coc.nvim:
```
brew install node
npm install -g yarn
```

and in my_configs.vim:

```
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
```

coc-settings.json must go to ~/.vim folder

my_configs.vim must to to .vim_runtime folder after installing the vim tooling: https://github.com/amix/vimrc
