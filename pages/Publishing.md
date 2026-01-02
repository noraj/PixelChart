## On Rubygems.org

```bash
git tag -a vx.x.x
git push --follow-tags
gem push pixelchart-x.x.x.gem
```

See https://guides.rubygems.org/publishing/.

On new release don't forget to rebuild the library documentation:

```bash
bundle exec yard doc
```

## On AUR

```bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
```
