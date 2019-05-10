from django.urls import path
from . import views



urlpatterns=[
    path('',views.homepage,name='homepage'),
    path('login/',views.login,name='login'),
    path('logout/',views.logout,name='logout'),
    path('register/',views.register,name='register'),
    path('user_center_info/',views.user_center_info,name='user_center_info'),
    path('cart/',views.cart,name='cart'),
    path('user_center_order/',views.user_center_order,name='user_center_order'),
    path('detail/<int:a>/',views.detail,name='detail'),
    path('list/<int:a>',views.list,name='list'),
    path('list/<int:a>?<int:b>/',views.list,name='list'),
    path('user_center_site/',views.user_center_site,name='user_center_site'),
    path('place_order/',views.place_order,name='place_order'),
    path('shop/',views.shop,name='shop'),
    path('dell/<int:q>/',views.dell,name='dell'),
    path('add/',views.add,name='add'),
    path('add1/',views.add1,name='add1'),
    path('gai/',views.gai,name='gai'),
    path('goumai/',views.goumai,name='goumai'),
    path('create_index/',views.create_index,name='create_index'),
    path('search/',views.search,name='search'),
    path('qfk/',views.qfk,name='qfk')
]