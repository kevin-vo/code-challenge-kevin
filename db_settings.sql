PGDMP     6    3                w           kevindb    11.5    11.5     C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            F           1262    16393    kevindb    DATABASE     e   CREATE DATABASE kevindb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE kevindb;
             postgres    false            G           0    0    DATABASE kevindb    COMMENT     '   COMMENT ON DATABASE kevindb IS 'test';
                  postgres    false    3142            H           0    0    DATABASE kevindb    ACL     ,   GRANT ALL ON DATABASE kevindb TO test_user;
                  postgres    false    3142            �            1259    16412    brands    TABLE     G   CREATE TABLE public.brands (
    id integer NOT NULL,
    name text
);
    DROP TABLE public.brands;
       public         postgres    false            I           0    0    TABLE brands    ACL     /   GRANT ALL ON TABLE public.brands TO test_user;
            public       postgres    false    199            �            1259    16410    brands_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.brands_id_seq;
       public       postgres    false    199            J           0    0    brands_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;
            public       postgres    false    198            K           0    0    SEQUENCE brands_id_seq    ACL     9   GRANT ALL ON SEQUENCE public.brands_id_seq TO test_user;
            public       postgres    false    198            �            1259    16394    products    TABLE     �   CREATE TABLE public.products (
    name text,
    brand_id text,
    perish_date date,
    quantity integer,
    id integer NOT NULL
);
    DROP TABLE public.products;
       public         postgres    false            L           0    0    TABLE products    ACL     1   GRANT ALL ON TABLE public.products TO test_user;
            public       postgres    false    196            �            1259    16401    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public       postgres    false    196            M           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
            public       postgres    false    197            N           0    0    SEQUENCE products_id_seq    ACL     ;   GRANT ALL ON SEQUENCE public.products_id_seq TO test_user;
            public       postgres    false    197            �           2604    16415 	   brands id    DEFAULT     f   ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);
 8   ALTER TABLE public.brands ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            �           2604    16403    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            @          0    16412    brands 
   TABLE DATA               *   COPY public.brands (id, name) FROM stdin;
    public       postgres    false    199   �       =          0    16394    products 
   TABLE DATA               M   COPY public.products (name, brand_id, perish_date, quantity, id) FROM stdin;
    public       postgres    false    196   <       O           0    0    brands_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.brands_id_seq', 49, true);
            public       postgres    false    198            P           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 35, true);
            public       postgres    false    197            @   I   x�5̱@@@����:P��K�z��M4�OW�y��G-b)J 6фs9�3�8�3�8�3�8�sD| 9�      =   o   x�u�;�@Ѹ�.F�=�%8��D��K|��D�u��q�e�O�\�8���~+5��M��,�<�FYQn(��A��b\\\�+
6666hl�ؠ�Ac�^k�T�Z�w0     