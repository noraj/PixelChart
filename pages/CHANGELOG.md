## [1.4.0]

- **Breaking change**: drop Ruby 3.1 support (EOL)
- Library:
  - Fix replacing newlines with commas when loading multilines CSV (previously removed, that was causing a loss of pixels)
- Chore:
  - Add support for Ruby 4.0
  - Update dependencies

## [1.3.0]

- **Breaking change**: drop Ruby 3.0 support (EOL)
- Chore:
  - Add support for Ruby 3.4
  - Update dependencies

## [1.2.0]

- Deprecation: now requires ruby 3.0+ instead of 2.7+
- Chore:
  - Add support for Ruby 3.2
- Lib: define a bit depth of 1 (fix [#1](https://github.com/noraj/PixelChart/issues/1)), even if it seems to be automatic with newer version of (ruby-)vips, to save some storage

## [1.1.0]

- Dependencies:
  - Update to yard [v0.9.27](https://github.com/lsegal/yard/releases/tag/v0.9.27)
    - Move from Redcarpet to CommonMarker markdown provider
    - Move doc syntax from Rdoc to markdown
  - Move dev dependencies from gemspec to gemfile
- Chore:
  - Add support for Ruby 3.1

## [1.0.2]

- lib: code lint
- dependencies: update
- rubocop: new rules for new cops
- deprecation: now requires ruby 2.7+ instead of 2.4+
- doc: fix a CLI value name

## [1.0.1]

- doc: final documentation
- gem: add metadata to gemspec

## [1.0.0]

- Initial version
