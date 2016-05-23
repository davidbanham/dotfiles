These are my dotfiles. There are many like them, but these ones are mine.

The directory structure is set up for [Gnu Stow](https://www.gnu.org/software/stow/).

To install all of my dotfiles:

```
git clone git@github.com:davidbanham/dotfiles.git
cd dotfiles
./install.sh
```

To install a subset of my dotfiles, vim for example:

```
git clone git@github.com:davidbanham/dotfiles.git
cd dotfiles
stow vim -t ~
```

If stow is not present on your system, you probably want something like:

```
sudo apt-get install stow
brew install stow
etc...
```

Stow will not overwrite any existing files. Nor will it copy files around. All it does is create symlinks. It's quite lovely.
