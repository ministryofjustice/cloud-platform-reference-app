import os, platform
from django.shortcuts import render
from django_reference_app.modelforms import tableForms
import boto3
import botocore


def showform(request):
    form = tableForms(request.POST or None)
    if form.is_valid():
        form.save()
    #name = request.GET['name']
    name = request.POST['name']
    job = request.POST['job']

    context = {'name': name, 'job': job}
        
    return render(request, 'clusterwebtwo.html', context)

def s3test(request):
  BUCKET_NAME = 'cloud-platform-reference-bucket'
  FILE_NAME = 'hello.txt'
  with open(FILE_NAME, 'rb') as f:
    fstr = f.read()
  if request.method == 'POST':
    pass
  else:
    if (os.getppid() == 1):
      osname = 'Docker'
    else:
      osname = platform.system()
  status = ""
  try:
    session = boto3.Session()
    s3_client = session.client('s3')
    s3_client.put_object(Body=fstr, Bucket=BUCKET_NAME, Key='upload-'+FILE_NAME)
    status = "Write OK"
  except botocore.exceptions.ClientError as e:
    status = "Write Failed"
  return render(request, 'test-s3.html', {'osname':osname, 'status': status})
  