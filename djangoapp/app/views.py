import os, platform, configparser
from django.shortcuts import render
import boto3
import botocore

def index(request):
  BUCKET_NAME = 'cloud-platform-reference-bucket'
  FILE_NAME = 'hello.txt'
  with open(FILE_NAME, 'rb') as f:
    fstr = f.read()
  if request.method == 'POST':
    pass
  else:
    if (os.getppid() == 1):
      osname = 'Docker'
      table = ProfilesTable()
    else:
      osname = platform.system()
      awsconfig = configparser.ConfigParser()
      awsconfig.read(os.path.expanduser('~/.aws/credentials'))
      profiles = []
      p = {}
      good_profile = "default"
      for s in awsconfig.sections():
        p["name"] = s
        session = boto3.Session(profile_name=s)
        s3_client = session.client('s3')
        try:
          f = s3_client.head_object(Bucket=BUCKET_NAME, Key=FILE_NAME)
          if (f['ContentLength'] != len(fstr)):
            p["status"] = 'Wrong Size'
          else:
            p["status"] = 'Read OK'
            good_profile = s
        except botocore.exceptions.ClientError as e:
          p["status"] = 'Read Failed'
        profiles.append(dict(p))
      p["name"] = "using "+good_profile+" "
      try:
        session = boto3.Session(profile_name=good_profile)
        s3_client = session.client('s3')
        s3_client.put_object(Body=fstr, Bucket=BUCKET_NAME, Key='upload-'+FILE_NAME)
        p["status"] = "Write OK"
      except botocore.exceptions.ClientError as e:
        p["status"] = "Write Failed"
      profiles.append(dict(p))
  return render(request, 'index.html', {'osname':osname, 'profiles':profiles})
