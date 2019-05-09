FROM python:3.6-alpine

RUN apk add --no-cache build-base bash make postgresql-client postgresql-dev


RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .

EXPOSE 8000

USER 1000

CMD python3 ./manage.py runserver 0.0.0.0:8000
