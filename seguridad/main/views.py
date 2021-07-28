from django.shortcuts import render
from main.models import Nombre
import socket

# Create your views here.


def full_names(request):
    nombres = Nombre.objects.all()
    context = {"pc": socket.gethostname(), "nombres": nombres}
    return render(request=request, template_name="index.html", context=context)
