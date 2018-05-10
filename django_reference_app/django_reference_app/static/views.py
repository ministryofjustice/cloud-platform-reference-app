from django.shortcuts import render
from govuk_template_base.modelforms import tableForms


def showform(request):
    form= tableForms(request.POST or None)
    if form.is_valid():
        form.save()
    #name = request.GET['name']
    name = request.POST['name']
    job = request.POST['job']

    context= {'name': name, 'job': job}
        
    return render(request, 'clusterwebtwo.html', context)

