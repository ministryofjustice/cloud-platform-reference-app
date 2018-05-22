from django import test
from django_reference_app.models import Person


class PersonTest(test.TestCase):

    def test_person_creation(self):
        person = Person.objects.create(name='test_user', job='test_job')
        self.assertEqual(person.__str__(), person.name)
