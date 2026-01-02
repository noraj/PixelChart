## Production

### Install from rubygems.org

```bash
gem install pixelchart
```

Gem: [pixelchart](https://rubygems.org/gems/pixelchart)

### Install from ArchLinux

Manually:

```bash
git clone https://aur.archlinux.org/pixelchart.git
cd pixelchart
makepkg -sic
```

With an AUR helper ([Pacman wrappers](https://wiki.archlinux.org/index.php/AUR_helpers#Pacman_wrappers)), eg. pikaur:

```bash
pikaur -S pixelchart
```

AUR: [pixelchart](https://aur.archlinux.org/packages/pixelchart/)

## Development

It's better to use [rbenv][rbenv] to have latests version of ruby and to avoid trashing your system ruby.

[rbenv]:https://github.com/rbenv/rbenv

### Install from rubygems.org

```bash
gem install --development pixelchart
```

### Build from git

Just replace `x.x.x` with the gem version you see after `gem build`.

```bash
git clone https://github.com/noraj/PixelChart.git pixelchart
cd pixelchart
gem install bundler
bundler install
gem build pixelchart.gemspec
gem install pixelchart-x.x.x.gem
```

Note: if an automatic install is needed you can get the version with `gem build pixelchart.gemspec | grep Version | cut -d' ' -f4`.

### Run the library/CLI in irb without installing the gem

Library:

```bash
irb -Ilib -rpixelchart
```

CLI tool:

```bash
ruby -Ilib -rpixelchart bin/pixelchart 
```


### Build the gem doc

**Building locally: for library users**

For developers who only want to use the library.

```bash
bundle exec yard doc
```

**Building locally: for developer**

For developers who want to participate to the development.

```bash
bundle exec yard doc --yardopts .yardopts-dev
```
