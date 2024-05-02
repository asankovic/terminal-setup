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
# Using leaves
brew leaves > homebrew/leaves.txt

# Using brew bundle (pass -f to override/update existing dump)
brew bundle dump
```

### Import homebrew manually

```bash
# Using leaves
xargs brew install < homebrew/leaves.txt

# Using brew bundle (make sure to be in the same folder as Brewfile, or pass --file argument"
brew bundle check
brew bundle
```
