PGDMP      6                }            task    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16387    task    DATABASE     j   CREATE DATABASE task WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-GB';
    DROP DATABASE task;
                     postgres    false            �            1259    16413    marks    TABLE     '  CREATE TABLE public.marks (
    id integer NOT NULL,
    student_id integer NOT NULL,
    subject character varying(100) NOT NULL,
    marks integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT marks_marks_check CHECK (((marks >= 0) AND (marks <= 100)))
);
    DROP TABLE public.marks;
       public         heap r       postgres    false            �            1259    16412    marks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.marks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.marks_id_seq;
       public               postgres    false    220            �           0    0    marks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.marks_id_seq OWNED BY public.marks.id;
          public               postgres    false    219            �            1259    16392    studentinfo    TABLE       CREATE TABLE public.studentinfo (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    mobile character varying(15) NOT NULL,
    age integer,
    CONSTRAINT studentinfo_age_check CHECK ((age >= 0))
);
    DROP TABLE public.studentinfo;
       public         heap r       postgres    false            �            1259    16391    studentinfo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.studentinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.studentinfo_id_seq;
       public               postgres    false    218            �           0    0    studentinfo_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.studentinfo_id_seq OWNED BY public.studentinfo.id;
          public               postgres    false    217            '           2604    16416    marks id    DEFAULT     d   ALTER TABLE ONLY public.marks ALTER COLUMN id SET DEFAULT nextval('public.marks_id_seq'::regclass);
 7   ALTER TABLE public.marks ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            &           2604    16395    studentinfo id    DEFAULT     p   ALTER TABLE ONLY public.studentinfo ALTER COLUMN id SET DEFAULT nextval('public.studentinfo_id_seq'::regclass);
 =   ALTER TABLE public.studentinfo ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    16413    marks 
   TABLE DATA           K   COPY public.marks (id, student_id, subject, marks, created_at) FROM stdin;
    public               postgres    false    220   �       �          0    16392    studentinfo 
   TABLE DATA           C   COPY public.studentinfo (id, name, email, mobile, age) FROM stdin;
    public               postgres    false    218          �           0    0    marks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.marks_id_seq', 12, true);
          public               postgres    false    219            �           0    0    studentinfo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.studentinfo_id_seq', 21, true);
          public               postgres    false    217            2           2606    16420    marks marks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.marks DROP CONSTRAINT marks_pkey;
       public                 postgres    false    220            ,           2606    16400 !   studentinfo studentinfo_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.studentinfo
    ADD CONSTRAINT studentinfo_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.studentinfo DROP CONSTRAINT studentinfo_email_key;
       public                 postgres    false    218            .           2606    16402 "   studentinfo studentinfo_mobile_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.studentinfo
    ADD CONSTRAINT studentinfo_mobile_key UNIQUE (mobile);
 L   ALTER TABLE ONLY public.studentinfo DROP CONSTRAINT studentinfo_mobile_key;
       public                 postgres    false    218            0           2606    16398    studentinfo studentinfo_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.studentinfo
    ADD CONSTRAINT studentinfo_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.studentinfo DROP CONSTRAINT studentinfo_pkey;
       public                 postgres    false    218            3           2606    16421    marks marks_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.studentinfo(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.marks DROP CONSTRAINT marks_student_id_fkey;
       public               postgres    false    218    220    4656            �   z   x�e�;�0 ��>E/�ȿ4nV�+KTU��B�?�����pn��o�+���đt�80eI�5����@˶����w-�d� �z���������s4�̚���V�ۧ_9�h!�k���+�$�      �   u   x�M�1�0���>'�;��n�:�X4��RI���o�����>�^_�J��k�,.�����ۻt��#���ZόF��AH�<̶��r�^*l�'�J�rv����`,s     