FROM python:3-slim

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD python3 clusterapp/manage.py runserver 0.0.0.0:8000
