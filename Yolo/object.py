from ultralytics import YOLO,settings
from PIL import Image
import cv2

## create a new YOLO model from scratch
# model = YOLO('yolov8n.yaml')
model= YOLO('yolov8n.pt') ## loading pretrained model

# Train the model using the 'coco128.yaml' dataset for 3 epochs
# results = model.train(data='coco128.yaml',epochs=3)

# Evaluate the model's performance on the validation set
# metrics = model.val()
# metrics.box.maps

# Define path to the image file
source = 'https://ultralytics.com/images/bus.jpg'

# Run inference on 'bus.jpg' with arguments
# model.predict('bus.jpg', save=True, imgsz=320, conf=0.5)
# model.predict('cr7.jpg',save=True,conf=0.5)
# model.predict('barca.jpg',save=True,conf=0.5)
model.predict('https://www.youtube.com/watch?v=l90gs0-gcjo',save=True,conf=0.7)





