
from django.contrib import admin
from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('brands_filter/<slug:brand_name>/', views.home, name='brands_filter'),
    path('author/', include('author.urls')),
    path('brands/', include('brands.urls')),
    path('cars/', include('cars.urls')),
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
