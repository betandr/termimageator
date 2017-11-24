# term-image-ator

Simple Ruby code to display an image on the terminal. A bit of an experiment in 'pickling'; to turn an image into a simple hash containing rows of pixels which can be pasted into code to draw an image from code.

# dependencies

Needs ImageMagick, installed using `brew install imagemagick` on OS X. YMMV.

# running

To create a new pickle (it's just a hash really), run `bundle exec ruby pickle.rb filename.png >> pickled_file.txt`, which can be pasted into the `unpickle.rb` file which will draw the actual image on the terminal. Means you can print an image from just code.

To run pickle/unpickle use `bundle exec ruby pickle_unpickle.rb filename.png` which will display a file in the terminal but firstly pickle it then unpickle it. It's a bit pointless so best to just use `bundle exec display.rb filename.png` which will display the image anyway:

## hmmkay

So, the pickling and unpicking thing is all well and good, the real point of this is to display an image in the terminal using `bundle exec display.rb filename.png` which displays the data from the source image:

![Input Image](https://raw.githubusercontent.com/betandr/termimageator/master/beemo.png)

..in the terminal as:

![Output Image](https://raw.githubusercontent.com/betandr/termimageator/master/beemo_output.png)

...which is pretty rad!
