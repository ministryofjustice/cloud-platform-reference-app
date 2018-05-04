# Reference Django app
Functional skeleton for a Django app that employs secrets management and AWS resources
Requirements: 
 * any recent Python 3
   * macOS: ```$ brew install python```
   * CentOS: ```$ yum -y install epel-release && yum -y update && yum -y install python34```
 * Django & AWS SDK
   ```$ pip3 install --upgrade pip```
   ```$ pip3 install -r requirements.txt```
Exec:
 * directly ```./manage.py runserver```
 * Docker:
   * in the parent folder, ```$ docker build -t djangoapp -f Dockerfile-djangoapp .```
   * ```$ docker run -d --rm -p8000:8000 djangoapp```
   * ```$ curl http://localhost:8000```
