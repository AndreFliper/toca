# Generated by Django 5.1.4 on 2025-01-30 18:23

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='usuario',
            old_name='cidades',
            new_name='cidade',
        ),
    ]
