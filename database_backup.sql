--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.cities (
    name character varying,
    city_id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO "Guest";

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_city_id_seq OWNER TO "Guest";

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;


--
-- Name: stops; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.stops (
    city_name character varying,
    train_name character varying,
    "time" character varying,
    stop_id integer NOT NULL
);


ALTER TABLE public.stops OWNER TO "Guest";

--
-- Name: stops_stop_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.stops_stop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stops_stop_id_seq OWNER TO "Guest";

--
-- Name: stops_stop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.stops_stop_id_seq OWNED BY public.stops.stop_id;


--
-- Name: trains; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.trains (
    name character varying,
    train_id integer NOT NULL
);


ALTER TABLE public.trains OWNER TO "Guest";

--
-- Name: trains_train_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.trains_train_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trains_train_id_seq OWNER TO "Guest";

--
-- Name: trains_train_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.trains_train_id_seq OWNED BY public.trains.train_id;


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);


--
-- Name: stops stop_id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.stops ALTER COLUMN stop_id SET DEFAULT nextval('public.stops_stop_id_seq'::regclass);


--
-- Name: trains train_id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.trains ALTER COLUMN train_id SET DEFAULT nextval('public.trains_train_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.cities (name, city_id) FROM stdin;
Portland	9
Chicago	10
Oakland	11
\.


--
-- Data for Name: stops; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.stops (city_name, train_name, "time", stop_id) FROM stdin;
Chicago	Moonbeam	10:58	11
\.


--
-- Data for Name: trains; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.trains (name, train_id) FROM stdin;
	6
Starlight	22
Moonbeam	23
Thunder	24
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 11, true);


--
-- Name: stops_stop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.stops_stop_id_seq', 11, true);


--
-- Name: trains_train_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.trains_train_id_seq', 24, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: stops stops_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.stops
    ADD CONSTRAINT stops_pkey PRIMARY KEY (stop_id);


--
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (train_id);


--
-- PostgreSQL database dump complete
--

