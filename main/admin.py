from django.contrib import admin
from main.models import Nombre

# Register your models here.


@admin.register(Nombre)
class NombreAdmin(admin.ModelAdmin):
    pass