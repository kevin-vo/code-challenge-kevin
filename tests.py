import os
import tempfile

import pytest
from flask import json, jsonify

from app import app


@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_insert(client):
    #add new entry, see if json length increments by 1
    rv = client.get("/index")
    json_data = json.loads(rv.data)
    old_db_length = len(json_data)

    client.post("/product?name=beans&brand=Heinz&perish_date=12/21/2021&quantity=10")
    rv = client.get("/index")
    json_data = json.loads(rv.data)
    new_db_length = len(json_data)

    assert new_db_length == old_db_length + 1


def test_delete(client):
    #add new entry, then delete it and then detect change in json output
    client.post("/product?name=beans&brand=Heinz&perish_date=12/21/2021&quantity=10")

    rv = client.get("/index")
    json_data = json.loads(rv.data)
    old_db_length = len(json_data)

    delete_me_id = json_data[len(json_data) - 1]['id']
    request = "product/" + str(delete_me_id)
    client.delete(request)

    rv = client.get("/index")
    json_data = json.loads(rv.data)
    new_db_length = len(json_data)

    assert new_db_length == old_db_length - 1


