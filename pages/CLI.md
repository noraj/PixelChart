## Usage

```
PixelChart

Usage:
  pixelchart draw <input> <output> (--width <pixel> --height <pixel>) [--colors <colors>] [--backend <name>] [--scale <ratio>] [--no-color] [--debug]
  pixelchart calc (--area <size>|<input>) [--no-color] [--debug]
  pixelchart -H | --help
  pixelchart -V | --version

Options:
  <input>                         Input file containing values
  <output>                        Output image (filename)
  -w <pixel>, --width <pixel>     Width of the output image (in number pixel)
  -h <pixel>, --height <pixel>    Height of the output image (in number pixel)
  -c <colors>, --colors <colors>  Colors of the image (in RGB or random)
  -b <name>, --backend <name>     Image processing backend (rmagick or ruby-vips)
  -s <ratio>, --scale <ratio>     Scale ratio or dimensions
  --area <size>                   Area, number of values, total number of pixel
  --no-color      Disable colorized output
  --debug         Display arguments
  -H, --help      Show this screen
  -V, --version   Show version

Examples:
  pixelchart draw test.csv test.png -w 100 -h 100
  pixelchart draw test.csv test.png -w 100 -h 100 -c 'random|125,125,125' -b rubyvips
  pixelchart calc test.csv
  pixelchart calc --area 10000 --no-color
```

## draw

The input is a file file containing data that will be used to generate the image.
Values must be 0, 1, true, false and separated by commas.

Then we choose the destination image and the desired dimensions.

```
$ pixelchart draw test.csv test.png -w 100 -h 100
[+] Image saved
```

We can also choose the color of the pixels, the first value will be the falsy
color (0 or false) and the second value will be the truthy color (1 or true).
The magic `random` keyword can be used to pick a random color. Else the color
value must be specified as RGB.

```
$ pixelchart draw test.csv test.png -w 100 -h 100 -c 'random|125,125,125'
[+] Image saved
```

By default the Rmagick (Imagemagick) backend is used for image processing but
it is also possible to use ruby-vips (libvips).

Rmagick will generally output a smaller image (in bytes) but ruby-vips will
operate a bit faster and requires less memory (RAM).

```
$ pixelchart draw test.csv test.png -w 100 -h 100 -b rubyvips
[+] Image saved
```

If you have a dataset of 10,000 values and choose a 100x100 dimensions but feel
that a 100x100 image is too small, you can use the scale option to scale the
image differently (smaller, bigger, different aspect ratio).
So if want a final image of 500x500 size, you can apply a x5 ratio.

Note: the scale factor must be a ratio or dimensions. Ratio must be a positive
(non-nul) float or integer, and dimensions must be a set of width and height
separated by a comma. Eg. `10`, `4.2`, `100,500`. The aspect ratio may be
different than the initial dimensions chosen, eg. `-w 100 -h 100 -s 600,70`.
rubyvips backend only supports a ratio, not dimensions.

```
$ pixelchart draw test.csv test.png -w 100 -h 100 -s 5
[+] Image saved
```

## calc

As `pixelchart draw` requires a width and a height that match the total number
of pixels/values, I you don't know which resolutions are possible use
`pixelchart calc` to display the possible dimensions.

```
$ pixelchart calc test.csv
Possible dimensions: width x height or height x width
1 x 10000
2 x 5000
4 x 2500
5 x 2000
8 x 1250
10 x 1000
16 x 625
20 x 500
25 x 400
40 x 250
50 x 200
80 x 125
100 x 100

$ pixelchart calc --area 775
Possible dimensions: width x height or height x width
1 x 775
5 x 155
25 x 31
```

## misc

The `--no-color` flag can be used to disable the color in output but the
[NO_COLOR](https://no-color.org/) environment variable is also checked.

Use `export NO_COLOR` to disable color and `unset NO_COLOR` to remove this
behavior.
