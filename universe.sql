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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    speed_km_per_s numeric(6,2) NOT NULL,
    has_tail boolean DEFAULT true NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    age_in_million_of_years numeric(8,2),
    galaxy_types character varying(40)
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
    description text,
    is_spherical boolean,
    planet_id integer NOT NULL,
    radius_in_km numeric(7,2),
    has_atmosphere boolean
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
    description text,
    is_spherical boolean,
    planet_types character varying(40),
    star_id integer NOT NULL,
    number_of_moons integer
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    age_in_million_of_years numeric(6,2),
    galaxy_id integer NOT NULL,
    number_of_planets integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Periodic comet visible from Earth every 75-76 years', 70.56, true);
INSERT INTO public.comet VALUES (2, 'Encke', 'Short-period comet with a 3.3-year orbit', 69.50, true);
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 'One of the brightest comets seen in 1997', 44.00, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 13600.00, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy', false, 10000.50, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', false, 12000.25, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical galaxy with black hole', false, 13000.00, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Grand-design spiral galaxy', false, 11000.75, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Bright nucleus elliptical galaxy', false, 12000.00, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite', true, 1, 1737.40, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger moon of Mars', true, 2, 11.10, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars', true, 2, 6.20, false);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter', true, 3, 1821.60, false);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon of Jupiter with possible ocean', true, 3, 1560.80, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system, orbiting Jupiter', true, 3, 2634.10, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Outer large moon of Jupiter', true, 3, 2410.30, false);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn with thick atmosphere', true, 4, 2575.50, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy moon of Saturn with geysers', true, 4, 252.10, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Small moon of Saturn with large crater', true, 4, 198.20, false);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Mid-sized icy moon of Saturn', true, 4, 531.10, false);
INSERT INTO public.moon VALUES (12, 'Dione', 'Icy moon of Saturn with bright terrain', true, 4, 561.40, false);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Second largest moon of Saturn', true, 4, 763.80, false);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Moon of Saturn with unique coloration', true, 4, 734.50, false);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Small moon of Uranus with varied terrain', true, 5, 235.80, false);
INSERT INTO public.moon VALUES (16, 'Ariel', 'One of Uranus'' larger moons', true, 5, 578.90, false);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Dark moon of Uranus', true, 5, 584.70, false);
INSERT INTO public.moon VALUES (18, 'Titania', 'Largest moon of Uranus', true, 5, 788.90, false);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Second largest moon of Uranus', true, 5, 761.40, false);
INSERT INTO public.moon VALUES (20, 'Triton', 'Largest moon of Neptune with thin atmosphere', true, 6, 1353.40, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet', true, 'Terrestrial', 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet', true, 'Terrestrial', 1, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas giant', true, 'Gas Giant', 1, 79);
INSERT INTO public.planet VALUES (4, 'Proxima b', 'Exoplanet orbiting Proxima Centauri', true, 'Terrestrial', 2, 0);
INSERT INTO public.planet VALUES (5, 'Betelgeuse b', 'Hypothetical planet', true, 'Gas Giant', 3, 3);
INSERT INTO public.planet VALUES (6, 'Rigel I', 'Hypothetical planet', true, 'Gas Giant', 4, 2);
INSERT INTO public.planet VALUES (7, 'Vega b', 'Exoplanet around Vega', true, 'Terrestrial', 5, 1);
INSERT INTO public.planet VALUES (8, 'Sirius B', 'White dwarf companion', true, 'Dwarf', 6, 0);
INSERT INTO public.planet VALUES (9, 'Planet X', 'Distant hypothetical planet', false, 'Unknown', 1, 0);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 'Potentially habitable exoplanet', true, 'Terrestrial', 2, 0);
INSERT INTO public.planet VALUES (11, 'Tau Ceti e', 'Exoplanet around Tau Ceti', true, 'Terrestrial', 3, 1);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 'Exoplanet in habitable zone', true, 'Super Earth', 4, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Star at center of Solar System', true, 4600.00, 1, 8);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'Closest star system to Sun', false, 6000.00, 1, 3);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant star', false, 8000.00, 2, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue supergiant star', false, 7000.00, 2, 4);
INSERT INTO public.star VALUES (5, 'Vega', 'Bright star in Lyra', false, 5000.00, 3, 2);
INSERT INTO public.star VALUES (6, 'Sirius', 'Brightest star in night sky', false, 3000.00, 3, 5);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

