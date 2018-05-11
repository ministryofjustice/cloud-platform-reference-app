FROM python:3-slim

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
COPY django_reference_app/django_reference_app/templates/submit-button.html /usr/local/lib/python3.6/site-packages/govuk_forms/templates/govuk_forms/
CMD python3 django_reference_app/manage.py runserver 0.0.0.0:8000
