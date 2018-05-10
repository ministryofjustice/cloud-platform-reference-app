FROM python:3-slim

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
COPY django-reference-app/django-reference-app/static/* /usr/local/lib/python3.6/site-packages/govuk_template_base/
COPY django-reference-app/django-reference-app/static/submit-button.html /usr/local/lib/python3.6/site-packages/govuk_forms/templates/govuk_forms/
CMD python3 django-reference-app/manage.py runserver 0.0.0.0:8000
