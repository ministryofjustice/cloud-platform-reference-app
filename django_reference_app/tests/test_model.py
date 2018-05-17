from django import test
from django_reference_app.models import Person

class PersonTest(test.TestCase):
  def create_person(self, name="test", job="only a test"):
    return Person.objects.create(name=name, job=job)

  def test_person_creation(self):
    w = self.create_person()
      self.assertTrue(isinstance(w, Person))
      self.assertEqual(w.__str__(), w.name)
