from wordcloud import WordCloud
import matplotlib.pyplot as plt
import numpy as np
import csv
import pandas as pd

#Modify hereby the path to text.csv
df = pd.read_csv("/WordCloud/text.csv", header=None)
df = df.to_numpy()

text = df[0]
for i in range(1,df.shape[0]):
  text += ' '
  text += df[i]

text = str(text)
