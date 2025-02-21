# Criação de funções no painel admin

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Usuario, Festa, Genero, Cidade

# Cria classe de user admin
class UsuarioAdmin(UserAdmin):
    model = Usuario
    list_display = ('username', 'email', 'is_staff', 'is_active', 'date_joined')
    list_filter = ('is_staff', 'is_active', 'date_joined')

    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        ('Informações Pessoais', {'fields': ('first_name', 'last_name', 'email', 'apelido', 'generos_favoritos', 'cidades')}),
        ('Permissões', {'fields': ('is_staff', 'is_active', 'groups', 'user_permissions')}),  # Mantendo grupos e permissões
        ('Datas Importantes', {'fields': ('last_login', 'date_joined')}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2', 'email', 'is_staff', 'is_active')}
        ),
    )

    search_fields = ('username', 'email')
    ordering = ('username',)

    filter_horizontal = ('generos_favoritos', 'cidades', 'groups', 'user_permissions')  # 🔹 Mantendo a interface correta dos grupos

# Cria classe de festas
class FestaAdmin(admin.ModelAdmin):
    list_display = ('nome', 'data', 'get_cidades')
    list_filter = ('generos', 'cidades')
    filter_horizontal = ('generos', 'cidades')

    def get_cidades(self, obj):
        return ", ".join([cidade.nome for cidade in obj.cidades.all()])
    get_cidades.short_description = 'Cidades'

# Registro no admin
admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(Festa, FestaAdmin)
admin.site.register(Genero)
admin.site.register(Cidade)
