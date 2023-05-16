from django.shortcuts import render

def index(request):
    # render => 그려준다(구현한다)
    return render(request, 'index.html', {'name': 'Jaejung'})