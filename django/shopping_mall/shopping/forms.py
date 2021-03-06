from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.core import validators
from .models import User


class RegisterForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = User
        fields = UserCreationForm.Meta.fields

    email = forms.EmailField()
