from django.urls import path
from guestbook.views import showform, s3test


app_name = 'guestbook'
urlpatterns = [
    path('s3test/', s3test, name='s3test'),
    path('infopage/', showform, name='infopage'),
]
