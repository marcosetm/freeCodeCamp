--
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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stats (
    game_id integer NOT NULL,
    total_guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.stats OWNER TO freecodecamp;

--
-- Name: stats_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stats_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_game_id_seq OWNER TO freecodecamp;

--
-- Name: stats_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stats_game_id_seq OWNED BY public.stats.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: stats game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats ALTER COLUMN game_id SET DEFAULT nextval('public.stats_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stats VALUES (1, 5, 1);
INSERT INTO public.stats VALUES (2, 4, 1);
INSERT INTO public.stats VALUES (3, 1, 1);
INSERT INTO public.stats VALUES (4, 2, 1);
INSERT INTO public.stats VALUES (5, 3, 4);
INSERT INTO public.stats VALUES (6, 6, 5);
INSERT INTO public.stats VALUES (7, 4, 4);
INSERT INTO public.stats VALUES (8, 6, 6);
INSERT INTO public.stats VALUES (9, 3, 7);
INSERT INTO public.stats VALUES (10, 2, 7);
INSERT INTO public.stats VALUES (11, 13, 6);
INSERT INTO public.stats VALUES (12, 6, 6);
INSERT INTO public.stats VALUES (13, 10, 6);
INSERT INTO public.stats VALUES (14, 5, 1);
INSERT INTO public.stats VALUES (15, 2, 8);
INSERT INTO public.stats VALUES (16, 2, 9);
INSERT INTO public.stats VALUES (17, 6, 9);
INSERT INTO public.stats VALUES (18, 12, 8);
INSERT INTO public.stats VALUES (19, 2, 8);
INSERT INTO public.stats VALUES (20, 8, 8);
INSERT INTO public.stats VALUES (21, 10, 10);
INSERT INTO public.stats VALUES (22, 9, 10);
INSERT INTO public.stats VALUES (23, 10, 11);
INSERT INTO public.stats VALUES (24, 7, 11);
INSERT INTO public.stats VALUES (25, 6, 10);
INSERT INTO public.stats VALUES (26, 11, 10);
INSERT INTO public.stats VALUES (27, 5, 10);
INSERT INTO public.stats VALUES (28, 3, 12);
INSERT INTO public.stats VALUES (29, 6, 12);
INSERT INTO public.stats VALUES (30, 9, 13);
INSERT INTO public.stats VALUES (31, 2, 13);
INSERT INTO public.stats VALUES (32, 13, 12);
INSERT INTO public.stats VALUES (33, 2, 12);
INSERT INTO public.stats VALUES (34, 10, 12);
INSERT INTO public.stats VALUES (35, 8, 14);
INSERT INTO public.stats VALUES (36, 11, 14);
INSERT INTO public.stats VALUES (37, 3, 15);
INSERT INTO public.stats VALUES (38, 9, 15);
INSERT INTO public.stats VALUES (39, 1, 14);
INSERT INTO public.stats VALUES (40, 2, 14);
INSERT INTO public.stats VALUES (41, 10, 14);
INSERT INTO public.stats VALUES (42, 9, 1);
INSERT INTO public.stats VALUES (43, 131, 16);
INSERT INTO public.stats VALUES (44, 760, 16);
INSERT INTO public.stats VALUES (45, 173, 17);
INSERT INTO public.stats VALUES (46, 496, 17);
INSERT INTO public.stats VALUES (47, 271, 16);
INSERT INTO public.stats VALUES (48, 760, 16);
INSERT INTO public.stats VALUES (49, 766, 16);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'test-user');
INSERT INTO public.users VALUES (2, 'user_1690217131081');
INSERT INTO public.users VALUES (3, 'user_1690217131080');
INSERT INTO public.users VALUES (4, 'newUser');
INSERT INTO public.users VALUES (5, 'newUSer');
INSERT INTO public.users VALUES (6, 'user_1690219321423');
INSERT INTO public.users VALUES (7, 'user_1690219321422');
INSERT INTO public.users VALUES (8, 'user_1690220054894');
INSERT INTO public.users VALUES (9, 'user_1690220054893');
INSERT INTO public.users VALUES (10, 'user_1690220109760');
INSERT INTO public.users VALUES (11, 'user_1690220109759');
INSERT INTO public.users VALUES (12, 'user_1690220146237');
INSERT INTO public.users VALUES (13, 'user_1690220146236');
INSERT INTO public.users VALUES (14, 'user_1690220496196');
INSERT INTO public.users VALUES (15, 'user_1690220496195');
INSERT INTO public.users VALUES (16, 'user_1690220790987');
INSERT INTO public.users VALUES (17, 'user_1690220790986');


--
-- Name: stats_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stats_game_id_seq', 49, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


--
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: stats stats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

