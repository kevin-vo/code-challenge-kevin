import psycopg2
from flask import Flask, request
from flask_restful import Resource, Api, reqparse
from json import dumps
from flask_jsonpify import jsonify
import datetime

app = Flask(__name__)
api = Api(app)

class Products(Resource):
    def get(self):
        conn = psycopg2.connect(
            host="localhost",
            database="kevindb",
            user="test_user",
            password="test")
        cur = conn.cursor()
        cur.execute("select * from products")
        rows = cur.fetchall()
        column_names = [desc[0] for desc in cur.description]

        result = [dict(zip(column_names, row)) for row in rows]

        cur.close()
        conn.close()

        return(jsonify(result))

class Product(Resource):
    def get(self, product_id):
        conn = psycopg2.connect(
            host="localhost",
            database="kevindb",
            user="test_user",
            password="test")
        cur = conn.cursor()
        cur.execute("select * from products where id = %s", [product_id])
        row = cur.fetchone()
        column_names = [desc[0] for desc in cur.description]

        if row is None:
            return ("No item of that id exists")

        result = dict(zip(column_names, row))

        cur.close()
        conn.close()

        return(jsonify(result))

    def delete(self, product_id):
        conn = psycopg2.connect(
            host="localhost",
            database="kevindb",
            user="test_user",
            password="test")
        cur = conn.cursor()
        cur.execute("delete from products where id = %s", [product_id])

        conn.commit()

        cur.close()
        conn.close()

        return("Item has been deleted.")


class New_Product(Resource):
    def get(self):
        return ("Add new product")

    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument("name")
        parser.add_argument("brand")
        parser.add_argument("perish_date")
        parser.add_argument("quantity", type=int)
        args = parser.parse_args()

        conn = psycopg2.connect(
            host="localhost",
            database="kevindb",
            user="test_user",
            password="test")
        cur = conn.cursor()

        name = args["name"]
        brand = args["brand"]
        perish_date = args["perish_date"]
        quantity = args["quantity"]
        brand_id = None

        if (name is None):
            return ("Please name your item.")

        if (brand is not None):
            cur.execute("insert into brands (name) values (%s)", [brand])
            cur.execute("select id from brands where name = %s", [brand])

            brand_id = cur.fetchone()[0]


        cur.execute('''
            insert into products (name, brand_id, perish_date, quantity) 
            values (%s, %s, TO_DATE(%s, 'MM/DD/YYYY'), %s)''', 
                [name, brand_id, perish_date, quantity])
        cur.execute("select * from products")
        conn.commit()
        rows = cur.fetchall()

        cur.close()
        conn.close()
        return ("item added.")


api.add_resource(Products, "/index")
api.add_resource(New_Product, "/product")
api.add_resource(Product, "/product/<product_id>")

if __name__ == "__main__":
     app.run(port = "5001")

