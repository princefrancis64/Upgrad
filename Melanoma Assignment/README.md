## MELANOMA DETECTION
> Problem Statement : To build a CNN based model which can accurately detect melanoma. Melanoma is a type of cancer that can be deadly if not detected early. It accounts for 75% of skin cancer deaths. A solution which can evaluate images and alert the dermatologists about the presence of melanoma has the potential to reduce a lot of manual effort needed in diagnosis.


### TABLE OF CONTENT
1. Importing libraries
2. Creating Dataset
3. Simple CNN Architecture
4. Data Augmentation 
5. Adding Dropout Layer
6. Batch Normalization
7. Handling Class imbalance
8. Final Model
9. Prediction on the dataset
10. Inference  



### 1. Importing libraries
## Importing important libraries
import pathlib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
import requests
import zipfile
import os


import tensorflow as tf
import PIL
from PIL import Image
import keras
# import Augmentor
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.models import Sequential
from keras.layers import Conv2D,MaxPool2D,Dropout,Activation,Flatten,Dense,Rescaling,BatchNormalization
import tensorflow.keras.preprocessing.image as load_img
from keras.utils import image_dataset_from_directory
from keras.layers import RandomFlip,RandomRotation,RandomZoom


## 2. Creating dataset
- Create a training a validation dataset using image_dataset_from_directory.
- Use 80% of the data as training data and 20% as validation set
- check the class names
- visualize one image corresponding to each class

## 3. Simple CNN architecture
- normalized the data
- autotuning for performance:
    - cache is used to load the images to disk and there is no need to load it again and again
    - prefetch help us to preprocess the next batch of data when it is still processing the current one
    - Use AUTOTUNE = tf.data.experimental.AUTOTUNE 
- Building first CNN
    - Activation functions used: Relu - Rectilinear unit in every convolutional layer
    - Activation function: softmax - for multi class classification

- Inference
    - Highly overfitted model with Train acc - 72% and val acc - 48%

## 4. Data Augmentation
- Adding a data augmentation layer on top of the simple cnn.
- Data Augmentation will process some of the images such that it may be rotated, flipped or zoomed to create a new instance of the same image.
- This is done inorder for the data to perform well on unseen data.
- Inference: Training Acc reduced however the model performs well on val accu. The problem of overfitting is resolved.

## 5. Adding Dropout layer
- Adding a dropout layer with 25% mask. This would make 25% of the weights to zero. 
- It is a regularization technique to reduce overfitting.
- Inference
    - model accuracy increased however it was minimal. No overfitting observed.
## 6. Batch Normalization
- Adding Batch normalization significantly brought back the overfitting which we got rid off.
- Removing this in the next model.

## 7.Class Imbalance
- Handling class imbalance using the augmentor libary
- Sampling 500 samples in each of the subfolder
- create new train and val set with newly added images


## 8. Final Model
- added augmentation,dropout and handled class imbalance dataset
- Inference - Final Model accuracy-70%
            -Val Acc - 67.85%
            - No overfitting involved
- Define a test set

## 9. Predictions
- Model evaluation on test set resulted in 68.3%
