from wordcloud import WordCloud, STOPWORDS, ImageColorGenerator
from PIL import Image
import matplotlib.pyplot as plt
import numpy as np
import csv
import pandas as pd

#Setup words
df = pd.read_csv("/content/text.csv", header=None)
df = df.to_numpy()
text = df[0]
for i in range(1,df.shape[0]):
  text += ', '
  text += df[i]
text = str(text)

wordcloud = WordCloud(background_color="white", stopwords=STOPWORDS, random_state=63).generate(text)
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis("off")
plt.show()
