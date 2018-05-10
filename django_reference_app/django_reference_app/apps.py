from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class ClusterwebConfig(AppConfig):
    name = 'django_reference_app'
    verbose_name = _('GOV.UK Template')
