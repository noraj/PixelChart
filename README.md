![](docs/images/logo.png)

# PixelChart

> Map binary data into a beautiful chart

PixelChart let's you create an image, a pixel chart / plot, based on binary data.
The idea is that truthy and falsy values will be represented by a different color
to be able to  quickly visualize boolean values.

For example:

![](docs/images/default.png)

## Requirements

You have to install the _system_ requirements for **both** backends.

- [imagemagick](https://imagemagick.org/)
- [libvips](https://libvips.github.io/libvips/)

Example for Linux distros:

- ArchLinux: `pacman -S libvips imagemagick`
- openSUSE: `zypper in libvips42 ImageMagick`
- Ubuntu: `apt install libvips42 imagemagick`

## Installation

```
$ gem install pixelchart
```

## Usage

**CLI**

```
$ pixelchart draw test.csv test.png -w 100 -h 100 -s 3
[+] Image saved
```
**library**

**scenarios**

