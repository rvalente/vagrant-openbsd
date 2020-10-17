# vagrant openbsd base image

OpenBSD built for Vagrant

## Getting Started

### Installing Dependencies

```bash
brew cask install virtualbox
brew cask install vagrant
brew install packer
```

### Building

To build the vagrant box for OpenBSD 6.7 run the following:

```
make
```

This will take care of the packer build as well as adding the box to vagrant.

### Running OpenBSD Locally

```
mkdir tmp && cd tmp
vagrant init openbsd67
vagrant up
```

## Todo

- [ ] Support Latest Snapshot
- [ ] Additional customizations and auto install features
