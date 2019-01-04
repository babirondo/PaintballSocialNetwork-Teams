--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: jogador_times_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jogador_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jogador_times_id_seq OWNER TO postgres;

--
-- Name: times_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.times_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: times; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.times (
    id bigint DEFAULT nextval('public.times_id_seq'::regclass) NOT NULL,
    "time" character varying NOT NULL,
    idowner integer,
    localtreino character varying,
    treino_segunda character varying,
    treino_terca character varying,
    treino_quarta character varying,
    treino_quinta character varying,
    treino_sexta character varying,
    treino_sabado character varying,
    treino_domingo character varying,
    procurando_snake character varying,
    procurando_snakecorner character varying,
    procurando_backcenter character varying,
    procurando_doritoscorner character varying,
    procurando_doritos character varying,
    nivelcompeticao character varying,
    procurando_coach character varying,
    logotime character varying
);


ALTER TABLE public.times OWNER TO postgres;

--
-- Data for Name: times; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.times (id, "time", idowner, localtreino, treino_segunda, treino_terca, treino_quarta, treino_quinta, treino_sexta, treino_sabado, treino_domingo, procurando_snake, procurando_snakecorner, procurando_backcenter, procurando_doritoscorner, procurando_doritos, nivelcompeticao, procurando_coach, logotime) FROM stdin;
1	time no servico certo	10	1	\N	\N	\N	Quinta	\N	\N	\N	\N	\N	BackCenter	\N	\N	1	\N	data:image/jpeg;base64,
2	time no servico certo	10	1	\N	\N	\N	Quinta	\N	\N	\N	\N	\N	BackCenter	\N	\N	1	\N	data:image/jpeg;base64,usar servico de imagens
3	time no servico certo	10	1	\N	\N	\N	Quinta	\N	\N	\N	\N	\N	BackCenter	\N	\N	1	\N	data:image/jpeg;base64,usar servico de imagens
4	time no servico certo	10	1	\N	\N	\N	Quinta	\N	\N	\N	\N	\N	BackCenter	\N	\N	1	\N	data:image/jpeg;base64,usar servico de imagens
5	time do form	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
6	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
7	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
8	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
9	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
10	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
11	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
12	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
13	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
14	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
15	ooooo	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
16	bbbbbbbbbb	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
17	ccccccccccc	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
18	novo time B	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
19	qwe	10	2	Segunda	\N	\N	\N	\N	\N	Domingo	Snake	SnakeCorner	\N	\N	\N	3	\N	data:image/jpeg;base64,usar servico de imagens
20	test Novo Time1755	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
21	test Novo Time1755	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
22	test Time `Regressao de Jogador` 5781	111		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
23	test Time `Regressao de Jogador` 5781	111		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
24	test Time `Criado pelo Owner` 4881	112		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
25	test Time `Criado pelo Owner` 4881	112		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
26	test Novo Time2208	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
27	test Novo Time2208	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
28	test Novo Time1142	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
29	test Novo Time1142	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
30	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
31	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
32	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
33	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
34	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
35	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
36	test Novo Time1864	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
37	test Novo Time1864	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
38	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
39	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
40	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
41	criado pelo unit test	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
42	test Novo Time1403	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
43	test Novo Time1403	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
44	test Novo Time1733	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
45	test Novo Time1733	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
46	test Novo Time1934	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
47	test Novo Time1934	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
48	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
49	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
50	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
51	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
52	test Novo Time2090	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
53	test Novo Time2090	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
54	test Novo Time1444	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
55	test Novo Time1444	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
56	test Novo Time1969	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
57	test Novo Time1969	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
58	test Novo Time2433	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
59	test Novo Time2433	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
60	test Novo Time1524	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
61	test Novo Time1524	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
62	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
63	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
64	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
65	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
66	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
67	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
68	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
69	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
70	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
71	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
72	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
73	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
74	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
75	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
76	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
77	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
78	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
79	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
80	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
81	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
82	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
83	criado pelo unit test 1857	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
84	test Novo Time1423	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
85	test Novo Time1423	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
86	test Novo Time2917	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
87	test Novo Time2917	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
88	test Novo Time1961	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
89	test Novo Time1961	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
90	test Novo Time1378	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
91	test Novo Time1378	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
92	test Novo Time2946	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
93	test Novo Time2946	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
94	test Novo Time2245	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
95	test Novo Time2245	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
96	criado pelo unit test 185722	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
97	criado pelo unit test 185722	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
98	criado pelo unit test 185722	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
99	criado pelo unit test 185722	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
100	criado pelo unit test 185722	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
101	criado pelo unit test 185722	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
102	test Novo Time1937	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
103	test Novo Time1937	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
104	test Novo Time2460	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
105	test Novo Time2460	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
106	test Novo Time2429	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
107	test Novo Time2429	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
108	test Novo Time2244	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
109	test Novo Time2244	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
110	test Novo Time2273	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
111	test Novo Time2273	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
112	test Novo Time2984	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
113	test Novo Time2984	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
114	test Novo Time1991	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
115	test Novo Time1991	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
116	criado pelo unit test 185222	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
117	criado pelo unit test 185222	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
118	criado pelo unit test 185222	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
119	criado pelo unit test 185222	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
120	criado pelo unit test 185222	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
121	criado pelo unit test 185222	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
122	test Novo Time2140	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
123	test Novo Time2140	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
124	test Novo Time1285	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
125	test Novo Time1285	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
126	test Novo Time1250	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
127	test Novo Time1250	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
128	test Novo Time1593	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
129	test Novo Time1593	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
130	dublin house	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
131	dublin house	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
132	test Novo Time1767	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
133	test Novo Time1767	10		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
134	testAAA3377	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
135	testAAA3377	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
136	testAAA3258	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
137	testAAA3258	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
138	testTeamUnit7909	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
139	testTeamUnit7909	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
140	testTeamUnit38242	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
141	testTeamUnit38242	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
142	testTeamUnit26682	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
143	testTeamUnit26682	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
144	testTeamUnit50715	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
145	testTeamUnit50715	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
146	testTeamUnit34804	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
147	testTeamUnit42710	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
148	testTeamUnit75788	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
149	testTeamUnit45216	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
150	testTeamUnit12173	10	dublin	\N	\N	Quarta	\N	\N	\N	\N	\N	\N	BackCenter	\N	\N	D2	\N	\N
151	testAAA meu novo time ;) ALTERADO 7492	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
152	testAAA meu novo time ;) ALTERADO 544	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
153	testAAA meu novo time ;) ALTERADO 2234	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
154	testAAA meu novo time ;) ALTERADO 7856	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
155	testAAA meu novo time ;) ALTERADO 7290	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
156	testAAA meu novo time ;) ALTERADO 4428	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
157	testAAA meu novo time ;) ALTERADO 4387	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
158	testAAA meu novo time ;) ALTERADO 2665	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
159	testAAA meu novo time ;) ALTERADO 4591	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
160	testAAA meu novo time ;) ALTERADO 8384	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
161	testAAA meu novo time ;) ALTERADO 2572	10	Dublin	\N	\N	\N	\N	\N	\N	Domingo	\N	\N	\N	\N	Doritos	D2	\N	\N
\.


--
-- Name: jogador_times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jogador_times_id_seq', 1, false);


--
-- Name: times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.times_id_seq', 161, true);


--
-- Name: times times_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.times
    ADD CONSTRAINT times_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

