from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from .models import*
from django.conf import settings
from django.conf.urls.static import static
import datetime
from datetime import date


# Create your views here.


def index(request):
    return render(request, "index.html")


def about(request):
    return render(request, "about.html")


def contact(request):
    return render(request, "contact.html")


def register(request):
    if request.method == "POST":
        name = request.POST['name']
        email = request.POST['email']
        pswd = request.POST['pswd']
        phone = request.POST['phone']
        address = request.POST['address']
        tb_register(name=name, email=email, pswd=pswd,
                    phone=phone, address=address, utype='user', status='pending').save()
        return render(request, "index.html")
    else:
        return render(request, "index.html")


def shop_register(request):
    if request.method == "POST":
        name = request.POST['name']
        email = request.POST['email']
        pswd = request.POST['pswd']
        phone = request.POST['phone']
        address = request.POST['address']
        img = request.FILES['img']
        licence_no = request.POST['licence_no']
        licenceid_img = request.FILES['licenceid_img']
        tb_shop(name=name, email=email, pswd=pswd,
                phone=phone, address=address, img=img, licence_no=licence_no, licenceid_img=licenceid_img, status='pending').save()
        return render(request, "shop_register.html")
    else:
        return render(request, "shop_register.html")


def login(request):
    if request.method == "POST":
        passswd = request.POST['pswd']
        email = request.POST['email']
        print("object=",passswd.lstrip())
        var = tb_register.objects.all().filter(email=email)
        print('var...',tb_register.objects.all())
        var2 = tb_register.objects.all().filter(pswd=passswd, email=email, utype='user')
        print('var2...',var2)
        var3 = tb_shop.objects.all().filter(pswd=passswd, email=email, status='approved')
        if email=='admin@gmail.com' and passswd=='admin':
            for x in var:
                request.session['id'] = x.id
            return render(request, 'Admin/admin_home.html')
        elif var2:
            for x in var2:
                request.session['id'] = x.id
            return render(request, 'User/user_home.html')
        elif var3:
            for x in var3:
                request.session['id'] = x.id    
            return render(request, 'Shop/shop_home.html')

        else:
            txt = "<script>alert('Invalid user Credentials....');window.location='/';</script>"
            return HttpResponse(txt)
    else:
        return render(request, "index.html")


from django.shortcuts import redirect
from django.contrib.auth import logout as auth_logout  # ✅ use alias

def logout_view(request):  # ✅ renamed to avoid conflict
    if request.session.has_key('id'):
        del request.session['id']
    auth_logout(request)  # ✅ call Django's logout
    return redirect('/login/')





# ____________________________Admin_______________________

def admin_home(request):
    return render(request, "Admin/admin_home.html")



def admin_view_shop(request):
    var = tb_shop.objects.filter(status='pending')
    return render(
        request,
        "Admin/admin_view_shop.html",
        {'var': var}
    )


def admin_approve_shop(request):
    ii = request.GET.get('id')

    if ii:
        tb_shop.objects.filter(id=ii).update(status='approved')

    return HttpResponseRedirect('/admin_view_shop/')


def admin_reject_shop(request):
    ii = request.GET.get('id')

    if ii:
        tb_shop.objects.filter(id=ii).update(status='reject')

    return HttpResponseRedirect('/admin_view_shop/')




def admin_view_approved_shop(request):
    var = tb_shop.objects.all().filter(status='approved')
    return render(request, "Admin/admin_view_approved_shop.html", {'var': var})


def admin_view_rejected_shop(request):
    var = tb_shop.objects.all().filter(status='reject')
    return render(request, "Admin/admin_view_rejected_shop.html", {'var': var})


def admin_view_customer(request):
    var = tb_register.objects.all().filter(utype='user')
    return render(request, "Admin/admin_view_customer.html", {'var': var})


def admin_view_product(request):
    var = tb_shop.objects.all()
    return render(request, "Admin/admin_view_product.html", {'var': var})


def admin_feedback(request):
    var = tb_feedback.objects.all()
    return render(request, "Admin/admin_feedback.html", {'var': var})


def admin_view_shop_product(request):
    ii = request.GET['id']
    var = tb_product.objects.all().filter(shop_id=ii)
    return render(request, 'Admin/admin_view_shop_product.html', {'var': var})


def admin_view_transactions(request):
    var = order_item_tb.objects.all()
    return render(request, 'Admin/admin_view_transactions.html', {'var': var})


# def admin_analysis(request):
#     # myid = request.session['id']
#     var = tb_product.objects.all()
#     for x in var:
#         prid = x.id
#     count = order_item_tb.objects.all().filter(product_id=prid).count()
#     # abc = order_item_tb.objects.all().filter(product_id=prid)
#     return render(request, 'Admin/admin_analysis.html', {'count': count, 'var': var})
def admin_analysis(request):
    try:
        products = tb_product.objects.select_related('shop_id').all()

        if not products:
            return render(request, 'Admin/admin_analysis.html', {'txt': "No Products Found", 'var': []})

        # Build a list with count
        data = []
        for product in products:
            count = order_item_tb.objects.filter(product_id=product).count()
            data.append({'product': product, 'count': count})

        return render(request, 'Admin/admin_analysis.html', {'var': data})

    except Exception as e:
        return HttpResponse(f"Error: {str(e)}")

# _______________________Shops_________________________________


def shop_home(request):
    return render(request, "Shop/shop_home.html")


def shop_profile(request):
    myid = request.session['id']
    var = tb_shop.objects.all().filter(id=myid)
    return render(request, "Shop/shop_profile.html", {'var': var})

from PIL import Image
from .ai_search import get_image_embedding

def shop_add_product(request):
    myid = request.session['id']

    if request.method == "POST":
        name = request.POST['name']
        img = request.FILES['img']
        qty = request.POST['qty']
        price = request.POST['price']
        mesure = request.POST['mesure']
        discription = request.POST['discription']

        sh_id = tb_shop.objects.get(id=myid)

        # Generate CLIP embedding from uploaded image
        image = Image.open(img).convert("RGB")
        embedding = get_image_embedding(image)

        # Save product and embedding
        tb_product.objects.create(
            name=name,
            img=img,
            qty=qty,
            price=price,
            mesure=mesure,
            discription=discription,
            status='pending',
            shop_id=sh_id,
            image_embedding=embedding
        )

        return HttpResponseRedirect('/shop_view_product/')

    return render(request, 'Shop/shop_add_product.html')

def shop_view_product(request):
    myid = request.session['id']
    var = tb_product.objects.all().filter(shop_id=myid)
    return render(request, 'Shop/shop_view_product.html', {'var': var})


def shop_delete_product(request):
    ii = request.GET['id']
    var = tb_product.objects.all().filter(id=ii).delete()
    return HttpResponseRedirect('/shop_view_product/')


def shop_edit_product(request):
    if request.method == "POST":
        name = request.POST['name']
        qty = request.POST['qty']
        price = request.POST['price']
        mesure = request.POST['mesure']
        discription = request.POST['discription']
        idd = request.POST['ii']
        # sh_id = tb_shop.objects.get(id=myid)
        tb_product.objects.all().filter(id=idd).update(name=name, qty=qty, price=price,
                                                       mesure=mesure, discription=discription)
        return HttpResponseRedirect('/shop_view_product/')
    else:
        ii = request.GET['id']
        var = tb_product.objects.all().filter(id=ii)
        return render(request, 'Shop/shop_edit_product.html', {'var': var, 'ii': ii})


def shop_edit_profile(request):
    myid = request.session['id']
    if request.method == "POST":
        name = request.POST['name']
        phone = request.POST['phone']
        email = request.POST['email']
        licence_no = request.POST['licence_no']
        address = request.POST['address']
        # sh_id = tb_shop.objects.get(id=myid)
        tb_shop.objects.all().filter(id=myid).update(name=name, phone=phone, email=email,
                                                     licence_no=licence_no, address=address)
        return HttpResponseRedirect('/shop_profile/')
    else:
        var = tb_shop.objects.all().filter(id=myid)
        return render(request, 'Shop/shop_edit_profile.html', {'var': var})


# def shop_view_payment(request):
#     myid = request.session['id']
#     shop = tb_product.objects.all().filter(shop_id=myid)
#     for x in shop:
#         pid = x.id
#     var = order_item_tb.objects.all().filter(product_id=pid)
#     return render(request, 'Shop/shop_view_payment.html', {'var': var})


def shop_view_payment(request):
    try:
        myid = request.session['id']
        shop = tb_product.objects.filter(shop_id=myid)
        if not shop:
            txt = "Not Found Anything"
            return render(request, 'Shop/shop_view_payment.html', {'txt': txt})
        var = []
        for product in shop:
            pid = product.id
            if not pid:
                raise ValueError(f"No product ID found for the product {product}")
            var += order_item_tb.objects.filter(product_id=pid)

        return render(request, 'Shop/shop_view_payment.html', {'var': var})
    except ValueError as e:
        return HttpResponse(f"Error: {e}")


# def shop_customer_request(request):
#     myid = request.session['id']
#     shop = tb_product.objects.all().filter(shop_id=myid)
#     for x in shop:
#         pid = x.id
#     var = order_item_tb.objects.all().filter(
#         product_id=pid, packing_status='pending')
#     var2 = order_item_tb.objects.all().filter(
#         product_id=pid, packing_status='processing')
#     var3 = order_item_tb.objects.all().filter(
#         product_id=pid, packing_status='delivered')
#     return render(request, 'Shop/shop_customer_request.html', {'var': var, 'var2': var2, 'var3': var3})




# def shop_customer_request(request):
#     try:
#         myid = request.session['id']
#         shop = tb_product.objects.filter(shop_id=myid)
        
#         if not shop:
#             txt="Not Found Anything"
#             return render(request, 'Shop/shop_customer_request.html', {'txt': txt})
#         pid = shop.last().id

#         if not pid:
#             raise ValueError("No product ID found for the given shop")

#         var = order_item_tb.objects.filter(product_id=pid, packing_status='pending')
#         var2 = order_item_tb.objects.filter(product_id=pid, packing_status='processing')
#         var3 = order_item_tb.objects.filter(product_id=pid, packing_status='delivered')

#         return render(request, 'Shop/shop_customer_request.html', {'var': var, 'var2': var2, 'var3': var3})

#     except ValueError as e:
#         return HttpResponse(f"Error: {e}")


def shop_customer_request(request):
    try:
        myid = request.session['id']
        shop = tb_product.objects.filter(shop_id=myid)
        
        if not shop:
            txt = "Not Found Anything"
            return render(request, 'Shop/shop_customer_request.html', {'txt': txt})
        var = []
        var2 = []
        var3 = []

        for product in shop:
            pid = product.id

            if not pid:
                raise ValueError(f"No product ID found for the product {product}")
            var += order_item_tb.objects.filter(product_id=pid, packing_status='pending')
            var2 += order_item_tb.objects.filter(product_id=pid, packing_status='processing')
            var3 += order_item_tb.objects.filter(product_id=pid, packing_status='delivered')

        return render(request, 'Shop/shop_customer_request.html', {'var': var,'var2':var2,'var3':var3})

    except ValueError as e:
        return HttpResponse(f"Error: {e}")







def shop_processing_request(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(
        id=ii).update(packing_status='processing')
    return HttpResponseRedirect('/shop_customer_request/')


def shop_delivered_request(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(id=ii, cart_id__status='paid').update(packing_status='delivered')
    return HttpResponseRedirect('/shop_customer_request/')


# def shop_view_review(request):
#     myid = request.session['id']
#     prds = tb_product.objects.all().filter(shop_id=myid)
#     for x in prds:
#         prid = x.id
#     var = tb_reviews.objects.all().filter(product_id=prid)
#     return render(request, 'Shop/shop_view_review.html', {'var': var})


# def shop_view_review(request):
#     try:
#         myid = request.session['id']
#         prds = tb_product.objects.filter(shop_id=myid)
        
#         if not prds:
#             txt="Not Found Anything"
#             return render(request, 'Shop/shop_view_review.html', {'txt': txt})

#         # Assuming you want to work with the last product in the queryset
#         prid = prds.last().id

#         if not prid:
#             raise ValueError("No product ID found for the given shop")

#         var = tb_reviews.objects.filter(product_id=prid)

#         return render(request, 'Shop/shop_view_review.html', {'var': var})

#     except ValueError as e:
#         return HttpResponse(f"Error: {e}")
def shop_view_review(request):
    try:
        myid = request.session['id']
        # Get all products for this shop
        products = tb_product.objects.filter(shop_id=myid)

        if not products.exists():
            return render(request, 'Shop/shop_view_review.html', {'txt': "No Products Found", 'var': []})

        # Get all reviews for these products
        var = tb_reviews.objects.filter(product_id__in=products).select_related('user_id', 'product_id')

        return render(request, 'Shop/shop_view_review.html', {'var': var})

    except Exception as e:
        return HttpResponse(f"Error: {str(e)}")



# def shop_analysis(request):
#     myid = request.session['id']
#     var = tb_product.objects.all().filter(shop_id=myid)
#     for x in var:
#         prid = x.id
#     count = order_item_tb.objects.all().filter(product_id=prid).count()
#     # abc = order_item_tb.objects.all().filter(product_id=prid)
#     return render(request, 'Shop/shop_analysis.html', {'count': count, 'var': var})
def shop_analysis(request):
    try:
        shop_id = request.session['id']
        products = tb_product.objects.filter(shop_id=shop_id)

        if not products:
            return render(request, 'Shop/shop_analysis.html', {'txt': "No Products Found", 'var': []})

        product_data = []

        for product in products:
            sell_count = order_item_tb.objects.filter(product_id=product).count()
            product_data.append({'product': product, 'count': sell_count})

        return render(request, 'Shop/shop_analysis.html', {'var': product_data})

    except Exception as e:
        return HttpResponse(f"Error: {str(e)}")



# _______________________User_________________________________


def user_home(request):
    return render(request, "User/user_home.html")


def user_profile(request):
    myid = request.session['id']
    var = tb_register.objects.all().filter(id=myid)
    return render(request, "User/user_profile.html", {'var': var})


def user_edit_profile(request):
    myid = request.session['id']
    if request.method == "POST":
        name = request.POST['name']
        phone = request.POST['phone']
        email = request.POST['email']
        address = request.POST['address']
        tb_register.objects.all().filter(id=myid).update(
            name=name, phone=phone, email=email, address=address)
        return HttpResponseRedirect('/user_profile/')
    else:
        var = tb_register.objects.all().filter(id=myid)
        return render(request, 'User/user_edit_profile.html', {'var': var})


def user_feedback(request):
    myid = request.session['id']
    if request.method == "POST":
        date = datetime.date.today()
        feedback = request.POST['feedback']
        uid = tb_register.objects.get(id=myid)
        tb_feedback(feedback=feedback, date=date,
                    user_id=uid, status='pending').save()
        return render(request, 'User/user_feedback.html')
    else:
        return render(request, "User/user_feedback.html")


def user_buy(request):
    var = tb_shop.objects.all()
    return render(request, 'User/user_buy.html', {'var': var})


import base64
from io import BytesIO

from django.http import HttpResponse
from django.shortcuts import render
from PIL import Image, UnidentifiedImageError

from .ai_search import get_image_embedding, similarity   # keep in sync with your module name
from .models import tb_product

# --- Tuning knobs (CLIP image-to-image cosine similarity) -------------------
EXACT_THRESHOLD = 0.92    # same product / same photo scores roughly 0.90 - 1.00
RELATED_MIN_SCORE = 0.50  # below this, a product is not considered related
MAX_EXACT = 12
MAX_RELATED = 24
MAX_UPLOAD_BYTES = 5 * 1024 * 1024
# ----------------------------------------------------------------------------


def _preview_data_uri(image):
    """Small base64 thumbnail so the results page can show the searched image."""
    thumb = image.copy()
    thumb.thumbnail((160, 160))
    buffer = BytesIO()
    thumb.save(buffer, format="JPEG", quality=80)
    encoded = base64.b64encode(buffer.getvalue()).decode("ascii")
    return "data:image/jpeg;base64," + encoded


def user_products(request):
    shop_id = request.GET.get('id') or request.POST.get('shop_id')

    if not shop_id:
        return HttpResponse("Shop ID is required.", status=400)

    products = tb_product.objects.filter(shop_id=shop_id, qty__gt=0)

    search_query = ""
    search_performed = False
    search_mode = ""
    search_error = ""
    search_message = ""
    query_image_preview = ""
    sections = []

    if request.method == "POST":
        search_query = request.POST.get('query', '').strip()
        uploaded_image = request.FILES.get('query_image')

        if uploaded_image:
            # ---------------- Image search (priority) ----------------
            search_performed = True
            search_mode = "image"

            try:
                if uploaded_image.size > MAX_UPLOAD_BYTES:
                    raise ValueError("too_large")

                with Image.open(uploaded_image) as image:
                    image = image.convert("RGB")
                    query_embedding = get_image_embedding(image)
                    query_image_preview = _preview_data_uri(image)

                scored = []
                for product in products:
                    if not product.image_embedding:
                        continue
                    product.similarity_score = similarity(
                        query_embedding, product.image_embedding
                    )
                    scored.append(product)

                scored.sort(key=lambda p: p.similarity_score, reverse=True)

                # Exact matches: effectively the same product image
                exact = [p for p in scored if p.similarity_score >= EXACT_THRESHOLD]
                exact = exact[:MAX_EXACT]
                exact_ids = {p.id for p in exact}

                # Related products: nearest neighbours that are not already exact
                related = [
                    p for p in scored
                    if p.id not in exact_ids and p.similarity_score >= RELATED_MIN_SCORE
                ][:MAX_RELATED]

                if exact:
                    count = len(exact)
                    search_message = (
                        f"We found {count} exact match{'es' if count > 1 else ''}."
                    )
                    if related:
                        search_message += " Similar products are shown below."
                elif related:
                    search_message = "No exact match found. Showing related products."
                else:
                    search_message = "No matching or related products found. Try another image."

                if exact:
                    sections.append({
                        'title': 'Exact Matches',
                        'subtitle': 'Products that look the same as your image.',
                        'products': exact,
                        'exact': True,
                    })
                if related:
                    sections.append({
                        'title': 'Similar Products' if exact else 'Related Products',
                        'subtitle': 'Ranked by how closely they resemble your image.',
                        'products': related,
                        'exact': False,
                    })

            except (UnidentifiedImageError, OSError):
                search_error = "Please select a valid image."
                search_message = search_error

            except ValueError:
                search_error = "Image is too large. Please choose one under 5 MB."
                search_message = search_error

            except Exception:
                search_error = "Image search failed. Please try again."
                search_message = search_error

        elif search_query:
            # ---------------- Name search ----------------
            search_performed = True
            search_mode = "name"

            results = list(products.filter(name__icontains=search_query))

            search_message = (
                f'Products matching "{search_query}".' if results
                else f'No products found for "{search_query}".'
            )
            sections.append({
                'title': 'Search Results',
                'subtitle': '',
                'products': results,
                'exact': False,
            })

    # ---------------- Default: all products ----------------
    if not search_performed:
        sections.append({
            'title': 'All Available Products',
            'subtitle': '',
            'products': list(products),
            'exact': False,
        })

    total_results = sum(len(s['products']) for s in sections)

    context = {
        'sections': sections,
        'total_results': total_results,
        'shop_id': shop_id,
        'search_query': search_query,
        'search_performed': search_performed,
        'search_mode': search_mode,
        'search_error': search_error,
        'search_message': search_message,
        'query_image_preview': query_image_preview,
    }

    return render(request, 'User/user_products.html', context)

def user_view_productdetail(request):
    ii = request.GET['id']
    var = tb_product.objects.all().filter(id=ii)
    return render(request, 'User/user_view_productdetail.html', {'var': var, 'ii': ii})


def add_to_cart(request):
    myid = request.session['id']
    ii = request.GET['id']
    pid = tb_product.objects.get(id=ii)
    uid = tb_register.objects.get(id=myid)
    number = request.GET['number']
    date = datetime.date.today()
    aq = int(pid.qty)
    qu = int(number)
    print("************", aq < qu)
    if(aq < qu):
        # txt = """<script>alert('Quantity limit exeed...');windows.location='/user_view_productdetail/';</script>"""
        # return HttpResponse(txt)
        return render(request, 'User/user_view_productdetail.html', {'error': "Requested Quantity is Not Available"})
    else:
        proprice = (pid.price)
        total = int(proprice)*int(number)
        tb_cart(qty=number, user_id=uid, status='pending',date=date, product_id=pid, total_price=total).save()
        new_qty = int(pid.qty)-int(number)
        tb_product.objects.all().filter(id=(pid.id)).update(qty=new_qty)
        shid = (pid.shop_id.id)
        # url = '/user_products/'+"?id="+""+str(shid)+""
        # return HttpResponseRedirect(url)
        return HttpResponseRedirect('/user_cartpage/')


def user_cartpage(request):
    myid = request.session['id']
    var = tb_cart.objects.all().filter(user_id=myid, status='pending')
    sum1 = 0
    for x in var:
        a = x.total_price
        sum1 = sum1+int(a)
        print(sum1)
    return render(request, 'User/user_cartpage.html', {'var': var, 'sum': sum1})


def delete_cart(request):
    ii = request.GET['id']
    tb_cart.objects.all().filter(id=ii).delete()
    return HttpResponseRedirect('/user_cartpage/')


def cart_product_payment(request):
    myid = request.session['id']
    if request.method == "POST":
        # pid = request.POST['ii']

        uid = tb_register.objects.get(id=myid)
        carid = request.POST.getlist('carid')
        if not carid:
            txt="Not Found Anything"
            return render(request,'User/user_cartpage.html',{'txt':txt})
        for i in carid:
            crrid = i
        print("----", carid)
        cart_id = tb_cart.objects.all().filter(id=crrid)
        amount = request.POST["subtotal"]
        current_date = date.today()
        now = datetime.datetime.now()
        current_time = now.strftime("%H:%M:%S")
        for x in cart_id:
            prid = x.product_id.id
            cartid = x.id
            pid = tb_product.objects.get(id=prid)
            cid = tb_cart.objects.get(id=cartid)
            order_item_tb(user_id=uid, product_id=pid,cart_id=cid, total=amount, date=current_date, time=current_time, payment_status='pending', packing_status='pending').save()
            var = order_item_tb.objects.last().id
            oid = order_item_tb.objects.get(id=var)
            tb_payment(user_id=uid, product_id=pid, order_id=oid).save()
        return HttpResponseRedirect('/payment/')
    else:
        # pid = request.GET['id']
        return render(request, 'User/user_payment.html')


def payment(request):
    if request.session.has_key('id'):
        myid = request.session["id"]
        if request.method == "POST":
            cardname = request.POST['cardname']
            cardnumber = request.POST['cardnumber']
            carddate = request.POST['carddate']
            cardcvv = request.POST['cardcvv']
            uid = tb_register.objects.get(id=myid)
            # tb_payment(card_name=cardname, card_number=cardnumber,
            #            card_cvv=cardcvv, card_expdate=carddate, pay_status='paid', user_id=uid).save()
            var = order_item_tb.objects.last().id
            print(var)
            tb_payment.objects.all().filter(order_id=var).update(card_name=cardname, card_number=cardnumber,
                                                                 card_cvv=cardcvv, card_expdate=carddate, pay_status='paid')
            tb_cart.objects.all().filter(user_id=myid).update(status='paid')
            return HttpResponseRedirect('/user_buy/')
            # url = '/user_products/'+"?id="+""+str(shid)+""
            # return HttpResponseRedirect(url)
        else:
            myid = request.session["id"]
            user = tb_register.objects.all().filter(id=myid)
            return render(request, 'User/user_payment.html', {'db': user})
    else:
        return render(request, 'login.html')



def user_order_status(request):
    myid = request.session['id']
    var = order_item_tb.objects.all().filter(user_id=myid)
    return render(request, 'User/user_order_status.html', {'var': var})


def user_view_review(request):
    myid = request.session['id']
    if request.method == "POST":
        review = request.POST['review']
        date = datetime.datetime.now()
        idd = request.POST['ii']
        product = tb_product.objects.all().filter(id=idd)
        for x in product:
            shid = x.shop_id.id
        uid = tb_register.objects.get(id=myid)
        pid = tb_product.objects.get(id=idd)
        tb_reviews(review=review, date=date,
                   product_id=pid, user_id=uid).save()
        # url = '/user_products/'+"?id="+""+str(shid)+""
        # return HttpResponseRedirect(url)
        return HttpResponseRedirect('/user_buy/')
        # return render(request, 'User/user_view_reviews.html')
    else:
        ii = request.GET['id']
        var = tb_product.objects.all().filter(id=ii)
        review = tb_reviews.objects.all().filter(product_id=ii)
        return render(request, 'User/user_view_reviews.html', {'var': var, 'ii': ii, 'review': review})
