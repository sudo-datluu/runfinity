# Generated by Django 4.2.4 on 2023-09-11 06:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_lobby_history'),
    ]

    operations = [
        migrations.AddField(
            model_name='lobby',
            name='currentMembers',
            field=models.PositiveSmallIntegerField(default=1),
        ),
    ]
