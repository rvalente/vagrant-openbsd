# OpenBSD Vagrant Image

OpenBSD VM built for Vagrant to be run within VirtualBox.

## Prerequisites

This uses [Packer](https://packer.io), [Vagrant](https://www.vagrantup.com), and [Virtualbox](https://www.virtualbox.org)
as core dependencies. These can be quickly installed on macOS using Homebrew.

```bash
brew cask install virtualbox
brew cask install vagrant
brew install packer
```

## Building

To build the vagrant box from scratch for OpenBSD 6.7 run the following:

```
make
```

This will take care of the packer build as well as adding the box to vagrant.

## Running OpenBSD Locally

```
mkdir tmp && cd tmp
vagrant init openbsd67
vagrant up
```

## Todo

- [ ] Support Latest Snapshot
- [ ] Additional customizations and auto install features
- [ ] Hyperkit support
