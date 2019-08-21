# Documentation
## Install Python Dependencies
Libraries used:


- Psycopg2, a PostgreSQL database adapter for python

      pip install psycopg2

	"You can also obtain a stand-alone package, not requiring a compiler or external libraries," according to package website. Use this instead of above if above doesn't work. This one worked for me.
    
      pip install psycopg2-binary

- Flask, flask-restful, lightweight web frameworks for python

      pip install flask flask-jsonpify flask-restful

- Pytest, a framework for writing tests
      
      pip install pytest
- Lastly, project was done with Python version 3.6.1 but the psycopg2-binary should work on 2.8.3 or above.

## Database Setup

Project requires a Postgres database on localhost. Project files contains the sql settings. Restore db with pgAdmin or use pg_dump.
![enter image description here](https://i.imgur.com/Hw4MRKf.png)


Below are the manual settings just in case above doesn't work.

- DB name: kevindb

It needs the following user settings with elevated privileges:

- username: test_user
- password: test

sql code:

    -- Database: kevindb
    
    -- DROP DATABASE kevindb;
    
    CREATE DATABASE kevindb
        WITH 
        OWNER = postgres
        ENCODING = 'UTF8'
        LC_COLLATE = 'C'
        LC_CTYPE = 'C'
        TABLESPACE = pg_default
        CONNECTION LIMIT = -1;
    
    COMMENT ON DATABASE kevindb
        IS 'test';
    
    GRANT ALL ON DATABASE kevindb TO postgres;
    
    GRANT TEMPORARY, CONNECT ON DATABASE kevindb TO PUBLIC;
    
    GRANT ALL ON DATABASE kevindb TO test_user;

There are two tables, 'products' and 'brands'.
sql for brands:

    -- Table: public.brands
    
    -- DROP TABLE public.brands;
    
    CREATE TABLE public.brands
    (
        id integer NOT NULL DEFAULT nextval('brands_id_seq'::regclass),
        name text COLLATE pg_catalog."default"
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;
    
    ALTER TABLE public.brands
        OWNER to postgres;
    
    GRANT ALL ON TABLE public.brands TO postgres;
    
    GRANT ALL ON TABLE public.brands TO test_user;

sql for products:

    -- Table: public.products
    
    -- DROP TABLE public.products;
    
    CREATE TABLE public.products
    (
        name text COLLATE pg_catalog."default",
        brand_id text COLLATE pg_catalog."default",
        perish_date date,
        quantity integer,
        id integer NOT NULL DEFAULT nextval('products_id_seq'::regclass)
    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;
    
    ALTER TABLE public.products
        OWNER to postgres;
    
    GRANT ALL ON TABLE public.products TO postgres;
    
    GRANT ALL ON TABLE public.products TO test_user;


## Running the app

Running the following starts the app on localhost port 5001:

    python app.py

Running the following executes a couple tests:

    pytest tests.py


View all items in pantry at 

    http://127.0.0.1:5001/index

View or delete one item at 

    http://127.0.0.1:5001/product/<id>

Add item with arguments name, brand, perish_date, and quantity at

    http://127.0.0.1:5001/product?name=...





