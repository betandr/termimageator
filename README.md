# term-image-ator

Simple Ruby code to display an image on the terminal. Uses 'pickling' to turn an image into a simple hash containing rows of pixels.

To create a new pickle, run `bundle exec ruby pickle.rb filename.png >> pickled_file.txt`, which can be pasted into the `unpickle.rb` file which will draw the actual image on the terminal.

To run pickle/unpickle use `bundle exec ruby pickle_unpickle.rb filename.png` which will display a file in the terminal but firstly pickle it then unpickle it. It's a bit pointless so best to just use `bundle exec display.rb filename.png` which will display the image anyway, like:

[term-image-ator Output]()