--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.2)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.2)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_mly numeric,
    star_count_billions integer,
    diameter_kly integer,
    galaxy_type text,
    has_supermassive_bh boolean
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period_days numeric,
    diameter_km integer,
    is_geologically_active boolean
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(120) NOT NULL,
    type text NOT NULL,
    diameter_ly integer,
    is_star_forming boolean
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    radius_km integer,
    surface_type text,
    moon_count integer,
    orbital_period_days integer,
    atmospheric_composition text
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_solar numeric,
    spectral_type text,
    constellation text,
    is_brightness_varies boolean
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 0.0, 200, 100, 'spiral', true);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 2.5, 300, 220, 'spiral', true);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 3.0, 40, 60, 'spiral', false);
INSERT INTO public.galaxy VALUES ('Sombrero', 4, 29.3, 100, 50, 'elliptical', true);
INSERT INTO public.galaxy VALUES ('Large Magellan', 5, 0.16, 30, 14, 'irregular', false);
INSERT INTO public.galaxy VALUES ('Centaurus A', 6, 13.7, 150, 200, 'elliptical', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27.32, 3474, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.32, 22, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1.26, 12, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.77, 3643, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.55, 3122, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.15, 5268, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 16.69, 4821, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 15.95, 5150, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1.37, 504, true);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 4.52, 1527, false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 2.74, 1123, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 1.89, 1062, false);
INSERT INTO public.moon VALUES (13, 'Sirius B1-M1', 7, 5.0, 800, false);
INSERT INTO public.moon VALUES (14, 'Cen A1-M1', 8, 2.1, 600, false);
INSERT INTO public.moon VALUES (15, 'Cen A1-M2', 8, 3.8, 450, false);
INSERT INTO public.moon VALUES (16, 'Cen A2-M1', 9, 1.5, 300, false);
INSERT INTO public.moon VALUES (17, 'M31-P1-M1', 10, 10.0, 1200, true);
INSERT INTO public.moon VALUES (18, 'M31-P1-M2', 10, 12.5, 900, false);
INSERT INTO public.moon VALUES (19, 'Tri-P1-M1', 11, 4.0, 700, false);
INSERT INTO public.moon VALUES (20, 'Tri-P2-M1', 12, 6.0, 1000, true);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 'Emission', 24, true);
INSERT INTO public.nebula VALUES (2, 'Crab Nebula', 'Supernova', 11, false);
INSERT INTO public.nebula VALUES (3, 'Eagle Nebula', 'Emission', 70, true);
INSERT INTO public.nebula VALUES (4, 'Andromeda Veil', 'Reflection', 50, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 'Rocky', 1, 365, 'N2, O2');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3390, 'Rocky', 2, 687, 'CO2');
INSERT INTO public.planet VALUES (3, 'Venus', 1, 6052, 'Rocky', 0, 225, 'CO2, N2');
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 2439, 'Rocky', 0, 88, 'None');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, 'Gaseous', 79, 4333, 'H2, He');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, 'Gaseous', 83, 10759, 'H2, He');
INSERT INTO public.planet VALUES (7, 'Sirius B1', 3, 12000, 'Rocky', 1, 150, 'None');
INSERT INTO public.planet VALUES (8, 'Cen A-1', 4, 4500, 'Rocky', 2, 300, 'CO2');
INSERT INTO public.planet VALUES (9, 'Cen A-2', 4, 3000, 'Rocky', 1, 120, 'None');
INSERT INTO public.planet VALUES (10, 'M31-P1', 5, 8000, 'Gaseous', 2, 500, 'H2, CH4');
INSERT INTO public.planet VALUES (11, 'Tri-P1', 6, 5000, 'Rocky', 1, 200, 'None');
INSERT INTO public.planet VALUES (12, 'Tri-P2', 6, 6000, 'Gaseous', 1, 250, 'CH4');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 'G2V', NULL, false);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 20.0, 'M1Ia', 'Orion', true);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 2.1, 'A1V', 'Canis Major', false);
INSERT INTO public.star VALUES (4, 'Alpha Cen A', 1, 1.1, 'G2V', 'Centaurus', false);
INSERT INTO public.star VALUES (6, 'Tri-Star', 3, 0.8, 'K3V', NULL, false);
INSERT INTO public.star VALUES (5, 'M31-X1', 2, 15.0, 'O5III', NULL, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

