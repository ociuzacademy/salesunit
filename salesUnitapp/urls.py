from django.contrib import admin
from django.urls import path
from .import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index),
    path('about/', views.about),
    path('contact/', views.contact),
    path('register/', views.register),
    path('shop_register/', views.shop_register),
    path('login/', views.login),
    # path('admin_login/', views.admin_login),
    path('logout/', views.logout_view),

    path('admin_home/', views.admin_home),
    path('admin_view_shop/', views.admin_view_shop),
    path('admin_approve_shop/', views.admin_approve_shop),
    path('admin_reject_shop/', views.admin_reject_shop),
    path('admin_view_approved_shop/', views.admin_view_approved_shop),
    path('admin_view_rejected_shop/', views.admin_view_rejected_shop),
    path('admin_view_customer/', views.admin_view_customer),
    path('admin_view_product/', views.admin_view_product),
    path('admin_feedback/', views.admin_feedback),
    path('admin_view_shop_product/', views.admin_view_shop_product),
    path('admin_view_transactions/', views.admin_view_transactions),
    path('admin_analysis/', views.admin_analysis),


    path('shop_home/', views.shop_home),
    path('shop_profile/', views.shop_profile),
    path('shop_add_product/', views.shop_add_product),
    path('shop_view_product/', views.shop_view_product),
    path('shop_delete_product/', views.shop_delete_product),
    path('shop_edit_product/', views.shop_edit_product),
    path('shop_edit_profile/', views.shop_edit_profile),
    path('shop_view_payment/', views.shop_view_payment),
    path('shop_customer_request/', views.shop_customer_request),
    path('shop_processing_request/', views.shop_processing_request),
    path('shop_delivered_request/', views.shop_delivered_request),
    path('shop_view_review/', views.shop_view_review),
    path('shop_analysis/', views.shop_analysis),


    path('user_home/', views.user_home),
    path('user_profile/', views.user_profile),
    path('user_edit_profile/', views.user_edit_profile),
    path('user_feedback/', views.user_feedback),
    path('user_buy/', views.user_buy),
    path('user_products/', views.user_products),
    path('user_view_productdetail/', views.user_view_productdetail),
    path('add_to_cart/', views.add_to_cart),
    path('user_cartpage/', views.user_cartpage),
    path('delete_cart/', views.delete_cart),
    path('payment/', views.payment),
    path('user_order_status/', views.user_order_status),
    path('cart_product_payment/', views.cart_product_payment),
    path('user_view_review/', views.user_view_review),



]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)
