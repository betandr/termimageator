#!/usr/bin/env ruby

require "tco"
require "rmagick"
require "json"

include Magick

image = Image.read(ARGV[0]).first

if ((image.rows > 50) || (image.columns > 300))
  image = image.resize_to_fit(50, 300)
end

image.each_pixel do |pixel, column, row|
  colour = [pixel.red, pixel.green, pixel.blue].map { |v| 256 * (v / 65535.0) }
  pixel.opacity == 65535 ? print("  ") : print("  ".bg colour)
  puts if column >= image.columns - 1
end
