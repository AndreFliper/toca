#Criação de visualização para o front end

from django.shortcuts import render, redirect
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib.auth import update_session_auth_hash
from .forms import UsuarioForm, UsuarioConfigForm
from .models import Festa, Genero, Cidade

def registro(request):
    if request.method == 'POST':
        form = UsuarioForm(request.POST)
        if form.is_valid():
            usuario = form.save(commit=False)  
            usuario.set_password(form.cleaned_data['password1'])  
            usuario.save()  

            # Salva os gêneros e cidades corretamente
            form.save_m2m()

            login(request, usuario)
            return redirect('index')  
    else:
        form = UsuarioForm()
    
    return render(request, 'registro.html', {'form': form})

def index(request):
    cidades = Cidade.objects.all()
    generos = Genero.objects.all()

    cidade_filtro = request.GET.getlist('cidade')  # Captura múltiplas cidades
    genero_filtro = request.GET.getlist('genero')  # Captura múltiplos gêneros

    festas_filtradas = Festa.objects.all()

    if not cidade_filtro and not genero_filtro and request.user.is_authenticated:
        generos_preferidos = request.user.generos_favoritos.all()
        cidades_usuario = request.user.cidades.all()

        if generos_preferidos.exists():
            festas_filtradas = festas_filtradas.filter(generos__in=generos_preferidos)

        if cidades_usuario.exists():
            festas_filtradas = festas_filtradas.filter(cidades__in=cidades_usuario)

    else:
        if cidade_filtro:
            festas_filtradas = festas_filtradas.filter(cidades__id__in=cidade_filtro)

        if genero_filtro:
            festas_filtradas = festas_filtradas.filter(generos__id__in=genero_filtro)

    outras_festas = Festa.objects.exclude(id__in=festas_filtradas).distinct()

    return render(request, 'index.html', {
        'festas_filtradas': festas_filtradas.distinct(),
        'outras_festas': outras_festas,
        'cidades': cidades,
        'generos': generos,
        'cidade_selecionada': cidade_filtro,
        'genero_selecionado': genero_filtro,
    })

def configurar_conta(request):
    if request.method == 'POST':
        form = UsuarioConfigForm(request.POST, instance=request.user)
        if form.is_valid():
            user = form.save()

            # Mantém o usuário autenticado após alterar a senha
            if form.cleaned_data.get('password'):
                update_session_auth_hash(request, user)

            return redirect('index')  
    else:
        form = UsuarioConfigForm(instance=request.user)
    
    return render(request, 'configurar_conta.html', {'form': form})