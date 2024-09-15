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
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer,
    volume integer,
    age numeric,
    material text,
    alive boolean,
    h2o boolean
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
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer,
    volume integer,
    age numeric,
    material text,
    alive boolean,
    h2o boolean
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer,
    volume integer,
    age numeric,
    material text,
    alive boolean,
    h2o boolean
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
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer,
    volume integer,
    age numeric,
    material text,
    alive boolean,
    h2o boolean
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 1, 'andromeda', 423, 815, 1456.32, 'human', false, true);
INSERT INTO public.galaxy VALUES (2, 2, 'milky_way', 582, 792, 1542.61, 'cyborg', true, false);
INSERT INTO public.galaxy VALUES (3, 3, 'triangulum', 365, 670, 1398.27, 'artificial_intelligence', false, true);
INSERT INTO public.galaxy VALUES (4, 4, 'sombrero', 477, 838, 1473.54, 'reptilian', true, true);
INSERT INTO public.galaxy VALUES (5, 5, 'whirlpool', 518, 695, 1518.41, 'avian', true, false);
INSERT INTO public.galaxy VALUES (6, 6, 'black_eye', 602, 754, 1441.83, 'insectoid', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'europa', 404, 784, 1491.38, 'human', true, false);
INSERT INTO public.moon VALUES (2, 2, 'titan', 478, 727, 1475.26, 'cyborg', false, true);
INSERT INTO public.moon VALUES (3, 3, 'ganymede', 506, 764, 1517.84, 'reptilian', true, false);
INSERT INTO public.moon VALUES (4, 4, 'callisto', 395, 841, 1488.12, 'robotic', false, true);
INSERT INTO public.moon VALUES (5, 5, 'io', 517, 753, 1452.91, 'insectoid', true, true);
INSERT INTO public.moon VALUES (6, 6, 'phobos', 421, 805, 1531.62, 'avian', false, false);
INSERT INTO public.moon VALUES (7, 7, 'deimos', 487, 739, 1447.59, 'aquatic', true, false);
INSERT INTO public.moon VALUES (8, 8, 'triton', 512, 778, 1503.36, 'human', false, true);
INSERT INTO public.moon VALUES (9, 9, 'charon', 529, 765, 1416.87, 'cyborg', true, false);
INSERT INTO public.moon VALUES (10, 10, 'enceladus', 463, 743, 1476.93, 'reptilian', true, true);
INSERT INTO public.moon VALUES (11, 11, 'mimas', 412, 831, 1549.34, 'robotic', false, false);
INSERT INTO public.moon VALUES (12, 11, 'dione', 492, 751, 1428.69, 'avian', true, true);
INSERT INTO public.moon VALUES (13, 11, 'rhea', 469, 773, 1487.56, 'insectoid', false, true);
INSERT INTO public.moon VALUES (14, 11, 'iapetus', 529, 736, 1514.82, 'human', true, false);
INSERT INTO public.moon VALUES (15, 11, 'hyperion', 439, 809, 1456.43, 'aquatic', false, false);
INSERT INTO public.moon VALUES (16, 11, 'tethys', 475, 748, 1508.27, 'cyborg', true, true);
INSERT INTO public.moon VALUES (17, 11, 'pan', 483, 794, 1443.18, 'robotic', false, true);
INSERT INTO public.moon VALUES (18, 11, 'atlas', 505, 765, 1479.42, 'avian', true, true);
INSERT INTO public.moon VALUES (19, 11, 'prometheus', 471, 782, 1536.57, 'human', false, false);
INSERT INTO public.moon VALUES (20, 11, 'janus', 460, 742, 1423.83, 'reptilian', true, true);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'exoplanet_info', 'human civilization expanding');
INSERT INTO public.more_info VALUES (2, 2, 'moon_details', 'cyborgs colonizing moons');
INSERT INTO public.more_info VALUES (3, 3, 'galaxy_formation', 'AI managing galactic infrastructure');
INSERT INTO public.more_info VALUES (4, 4, 'stellar_nursery', 'avian species thriving in star systems');
INSERT INTO public.more_info VALUES (5, 5, 'black_hole_data', 'reptilian scientists exploring black holes');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 1, 'kepler-22b', 389, 762, 1513.45, 'avian', true, false);
INSERT INTO public.planet VALUES (2, 2, 2, 'proxima_b', 473, 824, 1438.92, 'artificial_intelligence', false, true);
INSERT INTO public.planet VALUES (3, 3, 3, 'trappist-1d', 522, 752, 1501.38, 'human', true, true);
INSERT INTO public.planet VALUES (4, 4, 4, 'hd_189733_b', 436, 695, 1485.64, 'cyborg', false, true);
INSERT INTO public.planet VALUES (5, 5, 5, 'gliese_581g', 499, 731, 1468.49, 'aquatic', true, false);
INSERT INTO public.planet VALUES (6, 6, 6, 'ross_128b', 414, 817, 1529.34, 'robotic', true, true);
INSERT INTO public.planet VALUES (7, 6, 7, 'k2-18b', 395, 744, 1405.77, 'reptilian', false, false);
INSERT INTO public.planet VALUES (8, 6, 8, 'hd_209458_b', 527, 780, 1498.56, 'avian', true, false);
INSERT INTO public.planet VALUES (9, 6, 9, 'gj_1214_b', 512, 711, 1464.82, 'human', true, true);
INSERT INTO public.planet VALUES (10, 6, 10, 'wasp-12b', 478, 733, 1541.64, 'cyborg', false, true);
INSERT INTO public.planet VALUES (11, 6, 11, 'co_ro-7b', 462, 808, 1427.21, 'insectoid', true, false);
INSERT INTO public.planet VALUES (12, 6, 12, 'hd_106906_b', 485, 753, 1506.98, 'robotic', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 1, 'sirius', 389, 812, 1465.95, 'human', true, false);
INSERT INTO public.star VALUES (2, 2, 2, 'canopus', 456, 742, 1527.23, 'cyborg', false, true);
INSERT INTO public.star VALUES (3, 3, 3, 'rigel', 498, 768, 1499.45, 'robotic', true, false);
INSERT INTO public.star VALUES (4, 4, 4, 'vega', 522, 781, 1420.67, 'aquatic', false, true);
INSERT INTO public.star VALUES (5, 5, 5, 'aldebaran', 407, 719, 1507.84, 'insectoid', true, true);
INSERT INTO public.star VALUES (6, 6, 6, 'betelgeuse', 435, 830, 1538.26, 'reptilian', false, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

