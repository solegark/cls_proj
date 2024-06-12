FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt
CMD ["python3","cls_run.py"]
