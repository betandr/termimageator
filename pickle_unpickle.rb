#!/usr/bin/env ruby

require "tco"
require "rmagick"
require "json"

include Magick

class PickledImage
  attr_accessor :rows
  attr_accessor :columns
  attr_accessor :pixels
end

def pickle_image(file)
  image = Image.read(file).first

  if ((image.rows > 50) || (image.columns > 300))
    image = image.resize_to_fit(50, 300)
  end

  scanlines = Hash.new(0)
  image.rows.times do |row|
      scanlines[row] = image.export_pixels(0, row, image.columns, 1, "RGB")
  end

  pickled_image = PickledImage.new
  pickled_image.rows = image.rows
  pickled_image.columns = image.columns
  pickled_image.pixels = Marshal.dump(scanlines)

  pickled_image
end

def unpickle_image(pickled_image)
  image = Image.new(pickled_image.columns, pickled_image.rows);
  pixels = Marshal.load(pickled_image.pixels)

  pixels.each do |row, scanline|
    image.import_pixels(0, row, pickled_image.columns, 1, "RGB", scanline)
  end
  image
end

def draw_image(image)
  image.each_pixel do |pixel, column, row|
    colour = [pixel.red, pixel.green, pixel.blue].map { |v| 256 * (v / 65535.0) }
    pixel.opacity == 65535 ? print("  ") : print("  ".bg colour)
    puts if column >= image.columns - 1
  end
end

pickled_image = pickle_image(ARGV[0])

image = unpickle_image(pickled_image)

draw_image(image)
