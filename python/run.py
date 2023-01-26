import pandas as pd
import numpy as np
df=pd.read_csv("./dataset.csv")
#print(df.head(10))
from sklearn.preprocessing import LabelEncoder
le=LabelEncoder()
dfle=df
dfle.Disorder=le.fit_transform(dfle.Disorder)
input=dfle.drop("Disorder",axis="columns")
#input.head(10)
for i in input.columns:
    input[i]=le.fit_transform(input[i])

output=dfle.Disorder
from sklearn import tree

model=tree.DecisionTreeClassifier()
from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test=train_test_split(input,output,train_size=0.8)
model.fit(x_train,y_train)
#print(model.predict(x_test))
#print(model.score(x_test,y_test))
pred= pd.DataFrame(np.array([[1,0,1,1,1,0,1,0,0,0,1,0,1,0,0,1,1,1,1,1,0,1,0,1]]),
                   columns = ['feeling.nervous','panic','breathing.rapidly','sweating','trouble.in.concentration',
                              'having.trouble.in.sleeping',
                             'having.trouble.with.work','hopelessness','anger','over.react',
                             'change.in.eating','suicidal.thought','feeling.tired','close.friend','social.media.addiction',
                             'weight.gain','material.possessions'
                             ,'introvert','popping.up.stressful.memory',
                             'having.nightmares','avoids.people.or.activities',
                             'feeling.negative','trouble.concentrating','blamming.yourself'])
#print(model.predict(pred))

import pickle
'''
with open('model_pickle','wb') as file:
    pickle.dump(model,file)
print(model.predict(pred))
'''
def fun():
    return(model.predict(pred))
    
pickle.dump(model, open("model.pkl" ,"wb"))

def hello():
    return('hello')





















    
