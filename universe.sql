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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_lightyears integer NOT NULL,
    age_million_years numeric,
    has_life boolean,
    supermassive_blackhole boolean
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
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter_km numeric NOT NULL,
    age_million_years numeric,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    star_id integer,
    planet_type_id integer,
    diameter_km numeric NOT NULL,
    age_million_years numeric,
    has_atmosphere boolean,
    is_habitable boolean
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    temperature_in_k integer NOT NULL,
    age_million_years numeric,
    distance_from_earth numeric
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 220000, 13000, true, false);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 100000, 13000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 20000, 6000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 60000, 13000, false, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 60000, 13000, false, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 50000, 13000, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 4, 22, 4500, true);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 12, 4500, true);
INSERT INTO public.moon VALUES (3, 'Io', 5, 3643, 4500, true);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 3121, 4500, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 5268, 4500, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 4821, 4500, true);
INSERT INTO public.moon VALUES (7, 'Titan', 6, 5150, 4500, true);
INSERT INTO public.moon VALUES (8, 'Rhea', 6, 1529, 4500, true);
INSERT INTO public.moon VALUES (9, 'Titania', 7, 7881, 4500, true);
INSERT INTO public.moon VALUES (10, 'Triton', 8, 2706, 4500, true);
INSERT INTO public.moon VALUES (11, 'Charon', 9, 1212, 6000, true);
INSERT INTO public.moon VALUES (12, 'Phobetor', 10, 3400, 4000, true);
INSERT INTO public.moon VALUES (13, 'Kaloni', 11, 4000, 8000, true);
INSERT INTO public.moon VALUES (14, 'Novaris', 12, 5000, 8000, true);
INSERT INTO public.moon VALUES (15, 'Ventura', 13, 6000, 8000, true);
INSERT INTO public.moon VALUES (16, 'Calyx', 3, 3000, 4500, true);
INSERT INTO public.moon VALUES (17, 'Aurora', 3, 2800, 4500, true);
INSERT INTO public.moon VALUES (18, 'Cassius', 6, 3600, 4500, true);
INSERT INTO public.moon VALUES (19, 'Avalon', 9, 1500, 6000, true);
INSERT INTO public.moon VALUES (20, 'Erebus', 11, 3800, 8000, true);
INSERT INTO public.moon VALUES (21, 'Hera', 11, 4200, 8000, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, 4879, 4500, true, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, 12104, 4500, true, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 12742, 4500, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, 6779, 4500, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, 139820, 4500, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, 116460, 4500, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, 50724, 4500, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, 49244, 4500, true, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 6, 20120, 6000, true, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 7, 1, 11430, 4000, true, true);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 8, 1, 12192, 8000, true, false);
INSERT INTO public.planet VALUES (12, 'Gliese 581d', 8, 1, 15340, 8000, true, true);
INSERT INTO public.planet VALUES (13, 'Gliese 581g', 8, 6, 20000, 8000, true, true);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial planets', 'Planetas terrestres');
INSERT INTO public.planet_type VALUES (2, 'Gas giants', 'Gigantes gaseosos');
INSERT INTO public.planet_type VALUES (3, 'Ice giants', 'Gigantes de hielo');
INSERT INTO public.planet_type VALUES (4, 'Dwarf planets', 'Planetas enanos');
INSERT INTO public.planet_type VALUES (5, 'Exoplanets', 'Exoplanetas');
INSERT INTO public.planet_type VALUES (6, 'Super-Earths', 'Super-Tierras');
INSERT INTO public.planet_type VALUES (7, 'Hot Jupiters', 'Júpiteres calientes');
INSERT INTO public.planet_type VALUES (8, 'Mini-Neptunes', 'Mini-Neptunos');
INSERT INTO public.planet_type VALUES (9, 'Ocean planets', 'Planetas oceánicos');
INSERT INTO public.planet_type VALUES (10, 'Carbon planets', 'Planetas de carbono');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, 5778, 4500, 0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 3050, 6000, 4.24);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 2, 5790, 6000, 4.37);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 2, 5260, 6000, 4.37);
INSERT INTO public.star VALUES (5, 'Sirius', 2, 9940, 240, 8.6);
INSERT INTO public.star VALUES (6, 'Vega', 2, 9602, 455, 25.04);
INSERT INTO public.star VALUES (7, 'Kepler-186', 2, 3750, 4000, 500);
INSERT INTO public.star VALUES (8, 'Gliese 581', 2, 3480, 8000, 20.3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 45, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_type_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: planet_type unique_planet_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT unique_planet_type UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


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
-- Name: planet planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

