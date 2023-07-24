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

INSERT INTO public.stats VALUES (269, 488, 106);
INSERT INTO public.stats VALUES (270, 428, 107);
INSERT INTO public.stats VALUES (271, 389, 107);
INSERT INTO public.stats VALUES (272, 755, 106);
INSERT INTO public.stats VALUES (273, 337, 106);
INSERT INTO public.stats VALUES (274, 546, 106);
INSERT INTO public.stats VALUES (275, 292, 108);
INSERT INTO public.stats VALUES (276, 978, 108);
INSERT INTO public.stats VALUES (277, 709, 109);
INSERT INTO public.stats VALUES (278, 242, 109);
INSERT INTO public.stats VALUES (279, 466, 108);
INSERT INTO public.stats VALUES (280, 479, 108);
INSERT INTO public.stats VALUES (281, 550, 108);
INSERT INTO public.stats VALUES (282, 61, 110);
INSERT INTO public.stats VALUES (283, 548, 110);
INSERT INTO public.stats VALUES (284, 397, 111);
INSERT INTO public.stats VALUES (285, 808, 111);
INSERT INTO public.stats VALUES (286, 131, 110);
INSERT INTO public.stats VALUES (287, 338, 110);
INSERT INTO public.stats VALUES (288, 910, 110);
INSERT INTO public.stats VALUES (289, 487, 112);
INSERT INTO public.stats VALUES (290, 433, 112);
INSERT INTO public.stats VALUES (291, 233, 113);
INSERT INTO public.stats VALUES (292, 219, 113);
INSERT INTO public.stats VALUES (293, 447, 112);
INSERT INTO public.stats VALUES (294, 136, 112);
INSERT INTO public.stats VALUES (295, 192, 112);
INSERT INTO public.stats VALUES (296, 3, 114);
INSERT INTO public.stats VALUES (297, 2, 114);
INSERT INTO public.stats VALUES (298, 4, 114);
INSERT INTO public.stats VALUES (299, 4, 114);
INSERT INTO public.stats VALUES (300, 554, 115);
INSERT INTO public.stats VALUES (301, 977, 115);
INSERT INTO public.stats VALUES (302, 947, 116);
INSERT INTO public.stats VALUES (303, 523, 116);
INSERT INTO public.stats VALUES (304, 350, 115);
INSERT INTO public.stats VALUES (305, 41, 115);
INSERT INTO public.stats VALUES (306, 377, 115);
INSERT INTO public.stats VALUES (307, 950, 117);
INSERT INTO public.stats VALUES (308, 798, 117);
INSERT INTO public.stats VALUES (309, 729, 118);
INSERT INTO public.stats VALUES (310, 995, 118);
INSERT INTO public.stats VALUES (311, 999, 117);
INSERT INTO public.stats VALUES (312, 886, 117);
INSERT INTO public.stats VALUES (313, 699, 117);
INSERT INTO public.stats VALUES (314, 720, 119);
INSERT INTO public.stats VALUES (315, 814, 119);
INSERT INTO public.stats VALUES (316, 105, 120);
INSERT INTO public.stats VALUES (317, 40, 120);
INSERT INTO public.stats VALUES (318, 840, 119);
INSERT INTO public.stats VALUES (319, 213, 119);
INSERT INTO public.stats VALUES (320, 194, 119);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (106, 'user_1690238932839');
INSERT INTO public.users VALUES (107, 'user_1690238932838');
INSERT INTO public.users VALUES (108, 'user_1690239134796');
INSERT INTO public.users VALUES (109, 'user_1690239134795');
INSERT INTO public.users VALUES (110, 'user_1690239142011');
INSERT INTO public.users VALUES (111, 'user_1690239142010');
INSERT INTO public.users VALUES (112, 'user_1690239148887');
INSERT INTO public.users VALUES (113, 'user_1690239148886');
INSERT INTO public.users VALUES (114, 'test-user');
INSERT INTO public.users VALUES (115, 'user_1690239567280');
INSERT INTO public.users VALUES (116, 'user_1690239567279');
INSERT INTO public.users VALUES (117, 'user_1690239633028');
INSERT INTO public.users VALUES (118, 'user_1690239633027');
INSERT INTO public.users VALUES (119, 'user_1690239644007');
INSERT INTO public.users VALUES (120, 'user_1690239644006');


--
-- Name: stats_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stats_game_id_seq', 320, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 120, true);


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

