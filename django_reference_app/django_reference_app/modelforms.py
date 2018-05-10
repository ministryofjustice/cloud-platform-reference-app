from django import forms
from django_reference_app.dbmodels import Person

class tableForms(forms.ModelForm):
    class Meta:
        model= Person
        fields= ["name", "job"]
