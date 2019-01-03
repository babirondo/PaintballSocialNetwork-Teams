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
\.


--
-- Name: jogador_times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jogador_times_id_seq', 1, false);


--
-- Name: times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.times_id_seq', 19, true);


--
-- Name: times times_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.times
    ADD CONSTRAINT times_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

