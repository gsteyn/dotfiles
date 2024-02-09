# dotfiles

This repository contains all my dotfiles and config files.

## Prerequisites

The following tools need to be installed:

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

Firstly, checkout the `dotfiles` repository to your `$HOME` directory using `git`.

```
$ git clone git@github.com/gsteyn/dotfiles
$ cd dotfiles
```

Then, use `GNU stow` to create symlinks of the files in the `dotfiles` folder.

```
$ stow .
```

