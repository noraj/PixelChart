# frozen_string_literal: true

# Ruby internal
require 'set'
# Project internal
require 'pixelchart/version'
# External
require 'rmagick'
require 'vips'

# PixelChart class
class PixelChart
  # Constants
  include Version

  # A new instance of PixelChart
  # @param data [Array<Boolean>] An array containing values
  #   (0, 1) used to generate the image.
  # @param width [Integer] Desired width of the image.
  # @param height [Integer] Desired height of the image.
  # @option opts [Array<Color>] :colors Must be an array containing 2 values.
  #   Each value is either the `:random` symbol to get a random color or a
  #   color given as RGB, so 3 integers in an array.
  # @option opts [Scale] :scale Scale the image to dimensions or with a ratio.
  #   Ratio must be a positive (non-nul) float or integer, and dimensions must
  #   be a set of width and height separated by a comma.
  def initialize(data, width, height, opts = {})
    @width = check_int(width)
    @height = check_int(height)
    @data = check_data(data)
    opts[:colors] ||= [[255, 255, 255], [0, 0, 0]] # white, black
    check_colors(opts[:colors])
    opts[:colors].each_with_index do |color, i|
      opts[:colors][i] = (0..2).map { |_x| rand(256) } if color == :random
    end
    @colors = opts[:colors]
    opts[:scale] ||= nil
    @scale = opts[:scale]
  end

  # Generate and save the image
  # @param filename [String] Name of the output image.
  # @param opts [Hash] options for image processing
  # @option opts [Symbol] :backend Image processing backend, `:rmagick` for
  #   Rmagick/Imagemagick or `:rubyvips` for ruby-vips/libvips.
  def draw(filename, opts = {})
    opts[:backend] ||= :rmagick
    backend = check_backend(opts[:backend])
    case backend
    when :rmagick
      draw_rmagick(filename)
    when :rubyvips
      draw_rubyvips(filename)
    end
  end

  # Calculate the possible dimensions (width, height) for a given area
  # @param area [Integer] number of values, total of pixels
  # @return [Array<Array<Integer>>] Array of possible dimensions
  def self.dimensions(area)
    dim = []
    (1..Math.sqrt(area).to_i).each do |x|
      y, rem = area.divmod(x)
      dim.push([x, y]) if rem.zero?
    end
    dim
  end

  # Calculate the possible dimensions (width, height) for the data of the object
  # @return [Array<Array<Integer>>] Array of possible dimensions
  def dimensions
    dimensions(@data.size)
  end

  # Read the input file to extract the values
  # @param filename [String] Name of the input file containing data. Values must
  #   be 0, 1, true, false and separated by commas.
  # @return [Array<Integer>] Array of 0, 1. Can be directly passed to initialize
  def self.load_file(filename)
    content = File.read(filename).gsub(/\s+/, '')
    data = content.split(',')
    data.each_with_index do |x, i|
      data[i] = 0 if x == '0' || x.downcase == 'false'
      data[i] = 1 if x == '1' || x.downcase == 'true'
    end
    data
  end

  private

  # Generate and save the image with Rmagick
  # @param filename [String] Name of the output image.
  def draw_rmagick(filename)
    img = Magick::Image.new(@width, @height)
    i = 0
    (0...@height).each do |y|
      (0...@width).each do |x|
        if [1, true].include?(@data[i]) # true color
          img.pixel_color(x, y, "rgb(#{@colors[1].join(',')}")
        else # false color
          img.pixel_color(x, y, "rgb(#{@colors[0].join(',')})")
        end
        i += 1
      end
    end
    unless @scale.nil?
      case @scale
      when Numeric
        raise(ArgumentError, 'Scale must be a ratio or a set of width and height') if @scale.zero?

        img.scale!(@scale)
      when Array
        img.scale!(@scale[0], @scale[1])
      else
        raise(ArgumentError, 'Scale must be a ratio or a set of width and height')
      end
    end
    img.write(filename)
  end

  # Generate and save the image ruby-vips
  # @param filename [String] Name of the output image.
  def draw_rubyvips(filename)
    # true -> 1, false -> 0
    @data.map! { |x| x == true ? 1 : x }
    @data.map! { |x| x == false ? 0 : x }
    # make a 2D image from the data array
    im = Vips::Image.new_from_array(@data.each_slice(@width).to_a)
    im = (im == 1).ifthenelse(@colors[1], @colors[0], blend: true)
    if @scale.is_a?(Numeric)
      opts = { kernel: :nearest }
      im = im.resize(@scale, **opts)
    end
    im.write_to_file(filename, compression: 9, palette: true, colours: 2, Q: 0)
  end

  # Check if the argument is an integer else raise an error
  # @param data [Object] The object to check
  # @return [Object] Untouched input object
  def check_int(data)
    raise(ArgumentError, 'Argument is not an integer') unless data.is_a?(Integer)

    data
  end

  # Check if the data is in the format expected by #initialize else raise an
  #   error
  # @param data [Object] The object to check
  # @return [Object] Untouched input object
  def check_data(data)
    raise(ArgumentError, 'Argument is not an array') unless data.is_a?(Array)

    possible_values = PixelChart.dimensions(data.size)
    possible_sets = possible_values.map(&:to_set)

    unless possible_sets.include?(Set[@width, @height])
      raise(ArgumentError, 'The number of values does not match with the possible dimensions')
    end

    data
  end

  # Check if the colors are in the format expected by #initialize else raise an
  #   error
  # @param data [Object] The object to check
  # @return [Object] Untouched input object
  def check_colors(data)
    raise(ArgumentError, 'Argument is not an array') unless data.is_a?(Array)

    data.each do |item|
      case item
      when :random
        # nothing
      when Array
        raise(ArgumentError, 'RGB must contains 3 values') unless item.size == 3

        item.each do |i|
          raise(ArgumentError, 'RGB values are not integers') unless i.is_a?(Integer)
          raise(ArgumentError, 'RGB values must be between 0 and 255') unless (0..255).include?(i)
        end
      else
        raise(ArgumentError, 'Colors are not a RGB array or :random')
      end
    end
    data
  end

  # Check if the backend option is in the format expected by #draw else raise
  #   an error
  # @param data [Object] The object to check
  # @return [Object] Untouched input object
  def check_backend(data)
    accepted_values = %i[rmagick rubyvips]
    raise(ArgumentError, "Backend must be #{accepted_values.join(' or ')}") unless accepted_values.include?(data)

    data
  end
end
