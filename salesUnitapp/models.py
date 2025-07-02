from django.db import models

# Create your models here.


class tb_admin(models.Model):
    email = models.CharField(max_length=100, default='')
    pswd = models.CharField(max_length=100, default='')



class tb_register(models.Model):
    name = models.CharField(max_length=100, default='')
    email = models.CharField(max_length=100, default='')
    pswd = models.CharField(max_length=100, default='')
    phone = models.CharField(max_length=100, default='')
    address = models.CharField(max_length=500, default='')
    utype = models.CharField(max_length=100, default='user')
    status = models.CharField(max_length=100, default='')


class tb_shop(models.Model):
    name = models.CharField(max_length=100, default='')
    email = models.CharField(max_length=100, default='')
    pswd = models.CharField(max_length=100, default='')
    phone = models.CharField(max_length=100, default='')
    address = models.CharField(max_length=500, default='')
    img = models.ImageField(upload_to='shops/', default='')
    licence_no = models.CharField(max_length=100, default='')
    licenceid_img = models.ImageField(upload_to='licence/', default='')
    status = models.CharField(max_length=100, default='')


class tb_product(models.Model):
    name = models.CharField(max_length=100, default='')
    img = models.ImageField(upload_to='product/', default='')
    qty = models.CharField(max_length=100, default='')
    mesure = models.CharField(max_length=100, default='')
    price = models.CharField(max_length=100, default='')
    discription = models.CharField(max_length=500, default='')
    status = models.CharField(max_length=100, default='')
    shop_id = models.ForeignKey(tb_shop, on_delete=models.CASCADE, blank=True, null=True)


class tb_feedback(models.Model):
    feedback = models.CharField(max_length=100, default='')
    date = models.CharField(max_length=100, default='')
    status = models.CharField(max_length=100, default='')
    user_id = models.ForeignKey(tb_register, on_delete=models.CASCADE, blank=True, null=True)


class tb_cart(models.Model):
    qty = models.CharField(max_length=100, default='')
    date = models.CharField(max_length=100, default='')
    total_price = models.CharField(max_length=100, default='')
    status = models.CharField(max_length=100, default='')
    product_id = models.ForeignKey( tb_product, on_delete=models.CASCADE, blank=True, null=True)
    user_id = models.ForeignKey(tb_register, on_delete=models.CASCADE, blank=True, null=True)


class order_item_tb(models.Model):
    user_id = models.ForeignKey(tb_register, on_delete=models.CASCADE)
    product_id = models.ForeignKey(tb_product, on_delete=models.CASCADE)
    cart_id = models.ForeignKey(tb_cart, on_delete=models.CASCADE)
    total = models.CharField(max_length=30, default='')
    date = models.CharField(max_length=100, default='')
    time = models.CharField(max_length=100, default='')
    payment_status = models.CharField(max_length=30, default='')
    packing_status = models.CharField(max_length=30, default='')


class tb_payment(models.Model):
    order_id = models.ForeignKey(order_item_tb, on_delete=models.CASCADE)
    user_id = models.ForeignKey(tb_register, on_delete=models.CASCADE)
    product_id = models.ForeignKey(tb_product, on_delete=models.CASCADE)
    date = models.CharField(max_length=100, default='')
    total_amt = models.CharField(max_length=100, default='')
    card_name = models.CharField(max_length=100, default='')
    card_number = models.CharField(max_length=100, default='')
    card_cvv = models.CharField(max_length=100, default='')
    card_expdate = models.CharField(max_length=100, default='')
    pay_status = models.CharField(max_length=100, default='')


class tb_reviews(models.Model):
    review = models.CharField(max_length=100, default='')
    date = models.CharField(max_length=100, default='')
    product_id = models.ForeignKey(tb_product, on_delete=models.CASCADE)
    user_id = models.ForeignKey(tb_register, on_delete=models.CASCADE)
