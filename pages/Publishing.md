## On Rubygems.org

```
$ git tag -a vx.x.x
$ git push --follow-tags
$ gem push pixelchart-x.x.x.gem
```

See https://guides.rubygems.org/publishing/.

On new release don't forget to rebuild the library documentation:

```
$ bundle exec yard doc
```

## On AUR

```
$ updpkgsums
$ makepkg --printsrcinfo > .SRCINFO
```
