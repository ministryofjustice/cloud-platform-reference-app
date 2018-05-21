from django import forms
from .models import Person


class tableForms(forms.ModelForm):
    class Meta:
        model = Person
        fields = ["name", "job"]
