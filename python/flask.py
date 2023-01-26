from flask import Flask, jsonify
from flask import request
import json

import pickle
import pandas as pd
import numpy as np
#import model.pkl


import os
#import cPickle as pickle

my_dir = os.path.dirname(__file__)
pickle_file_path = os.path.join(my_dir, 'model.pkl')

with open(pickle_file_path, 'rb') as pickle_file:
    demo = pickle.load(pickle_file)


#################
#arr0 = np.array([[1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,0,1,0,1]]
#arr1 = np.array([[1,1,1,1,1,1,1,0,0,0,1,0,1,0,0,1,1,1,1,1,0,1,0,1]]
#arr2 = np.array([[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1]]
#arr3 = np.array([[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]
ar =[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]


########33333
response =''
app = Flask(__name__)

@app.route('/name', methods = ['GET', 'POST'])
def nameRoute():
    global response
    if(request.method == 'POST'):
       request_data =request.data
       request_data = json.loads(request_data.decode('utf-8'))
       name = request_data['name']

       # temp ar = name after conversion if it is required
       '''
       if(name == 'zero'):
           ar = []

       if (name =='yes'):
           ar.append(1)
       elif(name =='no'):
           ar.append(0)
'''

       #response = f'HI {name}! this is python'
       response = name

       return " "
    else:

        '''
      data =  run.fun()
        numpyData = {'name':data}
        encodedNumpyData = json.dumps(numpyData, cls=NumpyArrayEncoder)
        return(encodedNumpyData)
'''

        #numpyData = {"array": numpyArrayOne}
#encodedNumpyData = json.dumps(numpyData, cls=NumpyArrayEncoder)  # use dump() to write array into file
#print("Printing JSON serialized NumPy array")
#print(encodedNumpyData)

        #return jsonify({'name':'h'})

        pred= pd.DataFrame(np.array([response]),
                   columns = ['feeling.nervous','panic','breathing.rapidly','sweating','trouble.in.concentration',
                              'having.trouble.in.sleeping',
                             'having.trouble.with.work','hopelessness','anger','over.react',
                             'change.in.eating','suicidal.thought','feeling.tired','close.friend','social.media.addiction',
                             'weight.gain','material.possessions'
                             ,'introvert','popping.up.stressful.memory',
                             'having.nightmares','avoids.people.or.activities',
                             'feeling.negative','trouble.concentrating','blamming.yourself'])
        data = demo.predict(pred)
        tojeson = data.tolist()
        s = [str(integer) for integer in tojeson]
        a_string = "".join(s)
        res = int(a_string)
        if(res == 0):
            disorder = 'Anxiety'
        elif(res == 1):
            disorder = 'Depression'

        elif(res == 2):
            disorder = 'Loneliness'
        elif(res == 3):
            disorder = 'Normal'
        elif(res == 4):
            disorder = 'Stress'
        return jsonify({'name':disorder})






def afun():




    return('hi')


if __name__ == "__main__":
    app.run(debug = True)




