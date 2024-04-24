import sys

#Pillow libarary
from PIL import Image

images = []

for arg in sys.argv[1:]:
    image = Image.open(arg)
    images.append(image)


### the duration of dispalying the images is 200 ms, loop=0 means looping forever
#appending next images
images[0].save(
    "costumes.gif",save_all=True,append_images=[images[1]],duration=200,loop=0
)