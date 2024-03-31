from ultralytics import YOLO
import os
from roboflow import Roboflow


# home=os.getcwd()
# os.makedirs("datasets",exist_ok=True)
# os.chdir("datasets")

# rf = Roboflow(api_key="sxpwZx8OXwtNa8X3WhFL")
# project = rf.workspace("prince-francis-ui7ap").project("hand-gesture-recognition-6jt0x")
# version = project.version(1)
# dataset = version.download("yolov5")

# os.chdir(home)



# model=YOLO('yolov8n.pt')
# results = model.train(data = r'C:\Users\Prince\Desktop\Upgrad\Yolo\datasets\Hand-gesture-recognition-1\data.yaml',epochs=5)

model = YOLO('runs/detect/train20/weights/best.pt')
prediction_img = 'stop.jpg'
model.predict(prediction_img,save=True)
