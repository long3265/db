--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-06-23 23:10:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16397)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(25)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 200
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 203 (class 1259 OID 16407)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    email character varying(25),
    name character varying(25),
    password text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16405)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 204 (class 1259 OID 16416)
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_id bigint,
    role_id bigint,
    id bigint NOT NULL
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- TOC entry 2861 (class 2604 OID 24637)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 2862 (class 2604 OID 24576)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3002 (class 0 OID 16397)
-- Dependencies: 201
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 16407)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, updated_at, email, name, password) FROM stdin;
1	2021-06-23 00:00:00	2021-06-24 00:00:00	admin@gmail.com	Admin	12345
\.


--
-- TOC entry 3005 (class 0 OID 16416)
-- Dependencies: 204
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_roles (user_id, role_id, id) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 200
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 2864 (class 2606 OID 24639)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 24578)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 24636)
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 24640)
-- Name: users_roles users_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 2869 (class 2606 OID 24627)
-- Name: users_roles users_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);

INSERT INTO public.users VALUES (1, '2021-06-23 00:00:00', '2021-06-24 00:00:00', 'admin@gmail.com', 'Admin', '12345');


-- Completed on 2021-06-23 23:10:50

--
-- PostgreSQL database dump complete
--

