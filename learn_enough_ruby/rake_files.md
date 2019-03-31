# Working with Rake Tasks

## Rake and ZSH
ZSH can't parse arguments passed to a rake task:
```bash
$ rake link_dotfile["test"]  
```
So you'll have to escape the brackets in a zsh terminal:
```bash
$ rake link_dotfile\["test"\]  
```