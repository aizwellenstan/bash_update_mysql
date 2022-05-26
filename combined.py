import pandas as pd
from google.colab import files
uploaded = files.upload()
uploaded = files.upload()

aadf = pd.read_csv('newId.csv')
nasdf = pd.read_csv('oldId.csv')

aadict = dict(zip(aadf.iloc[:, 0], aadf.iloc[:, 1]))
nasdict = dict(zip(nasdf.iloc[:, 0], nasdf.iloc[:, 1]))

newId = []
oldId = []
for k, v in aadict.items():
  for k2, v2 in nasdict.items():
    if v2==v:
      newId.append(k)
      oldId.append(k2)
df = pd.DataFrame()
df['oldId'] = oldId
df['newId'] = newId
df.reset_index(drop=True, inplace=True)
df.to_csv('new.csv')