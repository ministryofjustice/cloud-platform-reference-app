FROM python:3.6-alpine

RUN apk add --no-cache build-base bash make postgresql-client postgresql-dev

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .

CMD python3 ./manage.py runserver 0.0.0.0:8000
