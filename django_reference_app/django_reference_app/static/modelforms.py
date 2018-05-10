from django import forms
from govuk_template_base.dbmodels import Person

class tableForms(forms.ModelForm):
    class Meta:
        model= Person
        fields= ["name","job"]
