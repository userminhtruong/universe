-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth numeric(5,3),
    has_life boolean DEFAULT false,
    description text,
    is_spherical boolean DEFAULT false,
    age_in_millions_of_years integer,
    planet_type character varying(40),
    galaxy_type character varying(40),
    number_of_robotic_researching integer
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
    name character varying(40) NOT NULL,
    distance_from_earth numeric(5,3),
    has_life boolean DEFAULT false,
    description text,
    is_spherical boolean DEFAULT false,
    age_in_millions_of_years integer,
    planet_type character varying(40),
    galaxy_type character varying(40),
    planet_id bigint NOT NULL,
    number_of_robotic_researching integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_galaxy_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth numeric(5,3),
    has_life boolean DEFAULT false,
    description text,
    is_spherical boolean DEFAULT false,
    age_in_millions_of_years integer,
    planet_type character varying(40),
    galaxy_type character varying(40),
    star_id bigint NOT NULL,
    number_of_robotic_researching integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_moon_id integer NOT NULL,
    planet_id bigint NOT NULL,
    star_id bigint NOT NULL,
    name character varying(40)
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth numeric(5,3),
    has_life boolean DEFAULT false,
    description text,
    is_spherical boolean DEFAULT false,
    age_in_millions_of_years integer,
    planet_type character varying(40),
    galaxy_type character varying(40),
    galaxy_id bigint NOT NULL,
    number_of_robotic_researching integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_galaxy_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_galaxy_id_seq'::regclass);


--
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'A1', 10.000, true, 'Source of all lifes in the universe', true, 180, 'terrestrial planet', 'normal', NULL);
INSERT INTO public.galaxy VALUES (2, 'A2', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', NULL);
INSERT INTO public.galaxy VALUES (3, 'A3', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', NULL);
INSERT INTO public.galaxy VALUES (4, 'A4', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', NULL);
INSERT INTO public.galaxy VALUES (5, 'A5', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', NULL);
INSERT INTO public.galaxy VALUES (6, 'A6', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'B1', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 1, NULL);
INSERT INTO public.moon VALUES (2, 'B2', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 2, NULL);
INSERT INTO public.moon VALUES (3, 'B3', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 3, NULL);
INSERT INTO public.moon VALUES (4, 'B4', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 4, NULL);
INSERT INTO public.moon VALUES (5, 'B5', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 5, NULL);
INSERT INTO public.moon VALUES (6, 'B6', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.moon VALUES (7, 'B7', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 7, NULL);
INSERT INTO public.moon VALUES (8, 'B8', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 8, NULL);
INSERT INTO public.moon VALUES (9, 'B9', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 9, NULL);
INSERT INTO public.moon VALUES (10, 'B10', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 10, NULL);
INSERT INTO public.moon VALUES (11, 'B11', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 11, NULL);
INSERT INTO public.moon VALUES (12, 'B12', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 12, NULL);
INSERT INTO public.moon VALUES (13, 'B13', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 1, NULL);
INSERT INTO public.moon VALUES (14, 'B14', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 2, NULL);
INSERT INTO public.moon VALUES (15, 'B15', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 3, NULL);
INSERT INTO public.moon VALUES (16, 'B16', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 4, NULL);
INSERT INTO public.moon VALUES (17, 'B17', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 5, NULL);
INSERT INTO public.moon VALUES (18, 'B18', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.moon VALUES (19, 'B19', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 7, NULL);
INSERT INTO public.moon VALUES (20, 'B20', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'A4', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (2, 'A2', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (3, '32', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (4, '40', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (5, '50', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (6, '60', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (7, '70', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (8, '80', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (9, '90', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (10, '110', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (11, '111', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);
INSERT INTO public.planet VALUES (12, '112', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 6, NULL);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (1, 1, 1, 'AA');
INSERT INTO public.planet_moon VALUES (2, 2, 2, 'BB');
INSERT INTO public.planet_moon VALUES (3, 3, 3, 'CC');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'A6', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 1, NULL);
INSERT INTO public.star VALUES (3, 'A3', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 2, NULL);
INSERT INTO public.star VALUES (5, 'A5', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 2, NULL);
INSERT INTO public.star VALUES (1, 'A1', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 2, NULL);
INSERT INTO public.star VALUES (2, 'A2', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 2, NULL);
INSERT INTO public.star VALUES (4, 'A4', 10.000, false, 'Source of energy in the universe', false, 180, 'terrestrial planet', 'normal', 2, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_galaxy_id_seq', 1, false);


--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_id_seq', 1, false);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


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
-- Name: planet_moon planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_name_key UNIQUE (name);


--
-- Name: planet_moon planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_pkey PRIMARY KEY (planet_moon_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_moon planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_moon planet_moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
