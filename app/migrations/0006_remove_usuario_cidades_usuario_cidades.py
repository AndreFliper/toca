# Generated by Django 5.1.4 on 2025-02-01 16:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0005_rename_cidade_usuario_cidades'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usuario',
            name='cidades',
        ),
        migrations.AddField(
            model_name='usuario',
            name='cidades',
            field=models.ManyToManyField(blank=True, related_name='usuarios', to='app.cidade'),
        ),
    ]
