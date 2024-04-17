### Link dotfiles
```bash
./installer
```

### Unlink dotfiles
```bash
./installer rm
```

### Export homebrew
```bash
brew leaves > leaves.txt
```

### Import homebrew
```bash
xargs brew install < leaves.txt
```
