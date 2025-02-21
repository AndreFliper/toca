# Criação de modelos no banco de dados

from django.db import models
from django.contrib.auth.models import AbstractUser

class Cidade(models.Model):
    nome = models.CharField(max_length=255)
    def __str__(self):
        return self.nome

class Genero(models.Model):
    nome = models.CharField(max_length=255, unique=True)
    def __str__(self):
        return self.nome

class Festa(models.Model):
    nome = models.CharField(max_length=255)
    link = models.URLField(max_length=500, blank=True, null=True)
    data = models.DateField()
    generos = models.ManyToManyField(Genero, blank=True)  # Definido como ManyToManyField
    cidades = models.ManyToManyField(Cidade, blank=True)
    def __str__(self):
        return self.nome
    
class Usuario(AbstractUser):
    apelido = models.CharField(max_length=255, blank=True, null=True)
    email = models.EmailField(unique=True)
    consentimento = models.BooleanField(default=False)
    cidades = models.ManyToManyField(Cidade, blank=True) # <- Deve ser ManyToManyField
    generos_favoritos = models.ManyToManyField(Genero, blank=True)

    def __str__(self):
        return self.username