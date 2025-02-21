# Criação de formulários

from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm
from .models import Usuario, Genero, Cidade

# Formulário de registro de user
class UsuarioForm(UserCreationForm):
    cidades = forms.ModelMultipleChoiceField(
        queryset=Cidade.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=True
    )

    # Registro de genero
    generos_favoritos = forms.ModelMultipleChoiceField(
        queryset=Genero.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=False
    )

    # Adicionando a checkbox de consentimento
    consentimento = forms.BooleanField(
        required=True,
        label="Estou ciente e consinto o uso dos meus dados"
    )

    class Meta:
        model = Usuario
        fields = ['username', 'email', 'cidades', 'generos_favoritos', 'password1', 'password2', 'consentimento']

#Formulário de configuração de conta
class UsuarioConfigForm(UserChangeForm):
    cidades = forms.ModelMultipleChoiceField(
        queryset=Cidade.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=True
    )

    generos_favoritos = forms.ModelMultipleChoiceField(
        queryset=Genero.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=False
    )

    class Meta:
        model = Usuario
        fields = ['username', 'email', 'cidades', 'generos_favoritos']

    password = forms.CharField(
        widget=forms.PasswordInput,
        required=False,
        label="Nova Senha (Deixe em branco para não alterar)"
    )

    def save(self, commit=True):
        user = super().save(commit=False)

        # Se a senha foi preenchida, alteramos
        password = self.cleaned_data.get('password')
        if password:
            user.set_password(password)

        if commit:
            user.save()
            self.save_m2m()  # Salva os ManyToMany corretamente

        return user