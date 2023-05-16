from django.db import models

class Profile(models.Model):
    title = models.CharField(max_lenght=255)
    image = models.ImageField(upload_to='images/')

    def __str__(self):
        return self.title