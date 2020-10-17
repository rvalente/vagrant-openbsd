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

To build the vagrant box for OpenBSD run the following

```
make openbsd67.box
```

This will take care of the packer build as well as adding the box to vagrant.

### Running OpenBSD Locally

```
mkdir tmp && cd tmp
vagrant init openbsd67
vagrant up
```
