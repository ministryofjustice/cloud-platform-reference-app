from django.shortcuts import render
from django_reference_app.modelforms import tableForms


def showform(request):
    form = tableForms(request.POST or None)
    if form.is_valid():
        form.save()
    #name = request.GET['name']
    name = request.POST['name']
    job = request.POST['job']

    context = {'name': name, 'job': job}
        
    return render(request, 'infopage.html', context)

