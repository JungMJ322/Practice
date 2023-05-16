from django.contrib import admin
from .models import MyBoard, MyMember

admin.site.register(MyBoard)
admin.site.register(MyMember)

# db를 손쉽게 관리할 수 있도록 django에서 제공해주는 기능
# db를 편리하게 볼 수 있다.