from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class MojAppConfig(AppConfig):
    name = 'moj_app'
    verbose_name = _('GOV.UK Template')
