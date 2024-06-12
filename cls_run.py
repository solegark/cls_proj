# coding: utf-8

#!/usr/bin/python
from bottle import route, run, request

import pickle
import re
import logging
import sys
import numpy as np
from sklearn import linear_model
import nltk
from pymystem3 import Mystem
from string import punctuation

mystem = Mystem() 
nltk.download('stopwords')

from nltk.corpus import stopwords
russian_stopwords = stopwords.words("russian")

root = logging.getLogger()
root.setLevel(logging.INFO)
handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
root.addHandler(handler)

Model = pickle.load(open('bin/model_20231108.m', 'rb')) # Загружаем модель
vec = pickle.load(open('bin/vectorizer_20231108.pkl', 'rb')) #Загружаем словари с векторами

def clean_text(text): #чистим текст
	logging.info('start clean text')
	tokens = mystem.lemmatize(text.lower())
	tokens = [token for token in tokens if token not in russian_stopwords \
		and token != " " \
		and token.strip() not in punctuation]

	text = " ".join(tokens)
	logging.info('incomming text clean')
	return text

def analyze(text): #анализируем текст, на выходе отдаём код шаблона HPSM
	logging.info('start analyze text')
	text = clean_text(text)
	text = [text]
	logging.info('start classification')
	res = Model.predict(vec.transform(text))[0]
	logging.info('end classification')
	#logging.info('!!!!! 4 TEXT: {0}   ---------- set template: {1}'.format(text, res))
	return res


@route('/', method='POST')
def index():
	logging.info('call service')
	text = request.POST.getunicode('text','').strip()
	logging.info('send request')
	return str(analyze(text))

if __name__ == "__main__":
	logging.info('start service')
	run(host="0.0.0.0", port=5000, reloader=True)
