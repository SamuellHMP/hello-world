--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    approximate_size_km bigint NOT NULL
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_billions_of_years numeric,
    number_of_stars bigint
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    orbital_period_days numeric,
    distance_from_planet_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type text NOT NULL,
    has_life boolean NOT NULL,
    orbital_period_days numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation text,
    temperature_kelvin integer,
    mass_solar_masses numeric NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 'Cinturão de Asteroides Principal', 1, 'Localizado entre as órbitas de Marte e Júpiter.', 930000);
INSERT INTO public.asteroid_belt VALUES (2, 'Cinturão de Kuiper', 1, 'Região além da órbita de Netuno, contendo muitos corpos gelados.', 5500000000);
INSERT INTO public.asteroid_belt VALUES (3, 'Disco de Scattered', 1, 'Região distante e dispersa além do Cinturão de Kuiper.', 10000000000);
INSERT INTO public.asteroid_belt VALUES (4, 'Anel de Poeira da Galáxia de Andrômeda', 2, 'Anel de poeira e gás molecular na Galáxia de Andrômeda.', 200000);
INSERT INTO public.asteroid_belt VALUES (5, 'Região de formação estelar NGC 604', 3, 'Grande região de formação estelar na Galáxia do Triângulo, rica em asteroides e poeira.', 50000);
INSERT INTO public.asteroid_belt VALUES (6, 'Cinturão de Poeira da Galáxia Olho Negro', 4, 'Anel de poeira escura que obscurece o centro da Galáxia Olho Negro.', 30000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Láctea', 'Espiral Barrada', 13.6, 200000000000);
INSERT INTO public.galaxy VALUES (2, 'Andrômeda', 'Espiral', 10.0, 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'Triângulo', 'Espiral', NULL, 40000000000);
INSERT INTO public.galaxy VALUES (4, 'Olho Negro', 'Elíptica', 13.2, 100000000000);
INSERT INTO public.galaxy VALUES (5, 'Redemoinho', 'Espiral', 0.4, 100000000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Lenticular', 9.0, 800000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (22, 'Lua', 23, true, 27.3, 384400);
INSERT INTO public.moon VALUES (23, 'Fobos', 24, false, 0.3, 9377);
INSERT INTO public.moon VALUES (24, 'Deimos', 24, false, 1.3, 23460);
INSERT INTO public.moon VALUES (25, 'Io', 25, true, 1.8, 421700);
INSERT INTO public.moon VALUES (26, 'Europa', 25, true, 3.5, 671034);
INSERT INTO public.moon VALUES (27, 'Ganimedes', 25, true, 7.2, 1070400);
INSERT INTO public.moon VALUES (28, 'Calisto', 25, true, 16.7, 1882700);
INSERT INTO public.moon VALUES (29, 'Titã', 26, true, 15.9, 1221870);
INSERT INTO public.moon VALUES (30, 'Encélado', 26, true, 1.4, 238020);
INSERT INTO public.moon VALUES (31, 'Mimas', 26, true, 0.9, 185539);
INSERT INTO public.moon VALUES (32, 'Tétis', 26, true, 1.9, 294619);
INSERT INTO public.moon VALUES (33, 'Dione', 26, true, 2.7, 377396);
INSERT INTO public.moon VALUES (34, 'Reia', 26, true, 4.5, 527108);
INSERT INTO public.moon VALUES (35, 'Hipérion', 26, false, 21.3, 1464100);
INSERT INTO public.moon VALUES (36, 'Jápeto', 26, true, 79.3, 3560820);
INSERT INTO public.moon VALUES (37, 'Miranda', 27, true, 1.4, 129390);
INSERT INTO public.moon VALUES (38, 'Ariel', 27, true, 2.5, 190990);
INSERT INTO public.moon VALUES (39, 'Umbriel', 27, true, 4.1, 266000);
INSERT INTO public.moon VALUES (40, 'Titânia', 27, true, 8.7, 435910);
INSERT INTO public.moon VALUES (41, 'Oberon', 27, true, 13.5, 583520);
INSERT INTO public.moon VALUES (42, 'Tritão', 28, true, -5.9, 354759);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (21, 'Mercúrio', 1, 'Rochoso', false, 88.0);
INSERT INTO public.planet VALUES (22, 'Vênus', 1, 'Rochoso', false, 225.0);
INSERT INTO public.planet VALUES (23, 'Terra', 1, 'Rochoso', true, 365.25);
INSERT INTO public.planet VALUES (24, 'Marte', 1, 'Rochoso', false, 687.0);
INSERT INTO public.planet VALUES (25, 'Júpiter', 1, 'Gasoso', false, 4331.0);
INSERT INTO public.planet VALUES (26, 'Saturno', 1, 'Gasoso', false, 10747.0);
INSERT INTO public.planet VALUES (27, 'Urano', 1, 'Gelado', false, 30589.0);
INSERT INTO public.planet VALUES (28, 'Netuno', 1, 'Gelado', false, 59800.0);
INSERT INTO public.planet VALUES (29, 'Kepler-186f', 2, 'Rochoso', false, 130.0);
INSERT INTO public.planet VALUES (30, 'Próxima Centauri b', 3, 'Rochoso', false, 11.2);
INSERT INTO public.planet VALUES (31, 'TRAPPIST-1e', 4, 'Rochoso', false, 6.1);
INSERT INTO public.planet VALUES (32, 'GJ 1214 b', 5, 'Gasoso', false, 1.6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'Nenhuma', 5800, 1.0);
INSERT INTO public.star VALUES (2, 'Sirius A', 1, 'Cão Maior', 9940, 2.063);
INSERT INTO public.star VALUES (3, 'Alfa Centauri A', 1, 'Centauro', 5790, 1.1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Órion', 3500, 15.0);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'Lira', 9600, 2.1);
INSERT INTO public.star VALUES (6, 'Altair', 1, 'Águia', 7550, 1.79);
INSERT INTO public.star VALUES (7, 'Pollux', 1, 'Gêmeos', 4865, 1.98);
INSERT INTO public.star VALUES (8, 'Arcturus', 1, 'Boieiro', 4290, 1.1);
INSERT INTO public.star VALUES (9, 'Antares', 1, 'Escorpião', 3597, 12.4);
INSERT INTO public.star VALUES (10, 'Deneb', 1, 'Cisne', 8525, 19.0);
INSERT INTO public.star VALUES (11, 'Proxima Centauri', 1, 'Centauro', 3050, 0.12);
INSERT INTO public.star VALUES (12, 'Barnards Star', 1, 'Ofiúco', 3132, 0.14);


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 32, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid_belt asteroid_belt_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

