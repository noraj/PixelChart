![](docs/images/logo.png)

[![Gem Version](https://badge.fury.io/rb/pixelchart.svg)](https://badge.fury.io/rb/pixelchart)
![AUR version](https://img.shields.io/aur/version/pixelchart)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/noraj/PixelChart)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/noraj/PixelChart)
[![GitHub forks](https://img.shields.io/github/forks/noraj/PixelChart)](https://github.com/noraj/PixelChart/network)
[![GitHub stars](https://img.shields.io/github/stars/noraj/PixelChart)](https://github.com/noraj/PixelChart/stargazers)
[![GitHub license](https://img.shields.io/github/license/noraj/PixelChart)](https://github.com/noraj/PixelChart/blob/master/LICENSE.txt)

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

See [the documentation](https://noraj.github.io/PixelChart/yard/file.Install.html) for more more advanced options.

## Usage

**CLI**

```
$ pixelchart draw test.csv test.png -w 100 -h 100 -s 3
[+] Image saved
```

See the [CLI documentation](https://noraj.github.io/PixelChart/yard/file.CLI.html).

**library**

See the [library documentation](https://noraj.github.io/PixelChart/yard/PixelChart.html).

**scenarios**

See some [scenarios](https://noraj.github.io/PixelChart/yard/file.Scenarios.html) with examples.

## Documentation

- [Custom domain](https://noraj.github.io/PixelChart/yard/PixelChart.html)
- [Backup GitHub domain](https://noraj.github.io/PixelChart/yard/PixelChart.html)
- [RubyDoc hosted](https://www.rubydoc.info/gems/pixelchart/PixelChart)
