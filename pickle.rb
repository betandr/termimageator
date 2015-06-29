#!/usr/bin/env ruby

require "tco"
require "rmagick"
require "json"

include Magick

image = Image.read(ARGV[0]).first

if ((image.columns > 300) || (image.rows > 50))
  image = image.resize_to_fit(50, 300)
end

pixels = Hash.new(0)
image.rows.times do |row|
  pixels[row] = image.export_pixels(0, row, image.columns, 1, "RGB")
end

p "rows: #{image.rows}"
p "columns: #{image.columns}"
p "pixels: #{pixels}"

# replace [0-9]+=> with \n$0 to format