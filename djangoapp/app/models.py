from django.db import models
import django_tables2 as tables

class ProfilesTable(tables.Table):
  name = tables.Column()
  status = tables.Column()
