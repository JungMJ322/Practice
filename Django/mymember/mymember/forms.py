from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class MyMemberForm(UserCreationForm):
    '''
    UserCreationForm 이 가진 기본적인 필드 : username, password1, password2
    password1 : 비밀번호 / password2 : 비밀번호 확인
    '''

    # 추가적으로 사용하고 싶은 것(forms 기본으로 제공되는 것 말고)
    email = forms.EmailField()
    first_name = forms.CharField()
    last_name = forms.CharField()

    # 이너 클래스 (forms클래스 안에 Meta클래스)
    class Meta:
        model = User
        fields = ('username', 'password1', 'password2', 'first_name', 'last_name', 'email')
