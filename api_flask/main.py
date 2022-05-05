from apiflask import APIFlask, Schema, abort, pagination_builder
from apiflask.validators import Length, OneOf
from apiflask import Schema, PaginationSchema
from apiflask.fields import Integer, String, List, Nested
from apiflask.validators import Range



app = APIFlask(__name__)

products = [
    {'id': 0, 'name': 'Corde de securité', 'price': '20.99',
     'desc': 'Une corde qui vous maintient en vie',
     'img': 'https://images-na.ssl-images-amazon.com/images/G/08/apparel/rcxgs/tile._CB483369919_.gif'},
]

class ProductInSchema(Schema):
    name = String(required=True, validate=Length(0, 100))
    price = String(required=True, validate=Length(0, 10))
    desc = String(required=True, validate=Length(0, 1000))
    img = String(required=True, validate=Length(0, 250))

class ProductOutSchema(Schema):
    id = Integer()
    name = String()
    price = String()
    desc = String()
    img = String()

class ProductsOutSchema(Schema):
    products = List(Nested(ProductOutSchema))

@app.get('/')
def get_products():
    return {
        'products': products,
    }

@app.get('/products/<int:product_id>')
@app.output(ProductOutSchema)
def get_product(product_id):
    if product_id > len(products) - 1:
        abort(404)
    # you can also return an ORM/ODM model class instance directly
    # APIFlask will serialize the object into JSON format
    return products[product_id]

@app.patch('/products/<int:product_id>')
@app.input(ProductInSchema(partial=True))
@app.output(ProductOutSchema)
def update_product(product_id, data):
    # the validated and parsed input data will
    # be injected into the view function as a dict
    if product_id > len(products) - 1:
        abort(404)
    for attr, value in data.items():
        products[product_id][attr] = value
    return products[product_id]

