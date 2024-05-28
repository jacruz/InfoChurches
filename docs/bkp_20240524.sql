--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-05-24 17:10:20

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
-- TOC entry 216 (class 1259 OID 16399)
-- Name: CHURCHES; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CHURCHES" (
    "ID_CHURCH" integer NOT NULL,
    "NAME" text NOT NULL,
    "PRIEST_NAME" text,
    "DIRECTION" text NOT NULL,
    "ID_LOCATION" integer NOT NULL,
    "LATITUDE" numeric(11,8) NOT NULL,
    "LONGITUDE" numeric(11,8) NOT NULL,
    "MOBILE" text,
    "LANDLINE" text,
    "CREATED_AT" date NOT NULL,
    "ID_USER_CREATED" integer NOT NULL,
    "UPDATED_AT" date NOT NULL,
    "ID_USER_LAST_UPDATED" integer NOT NULL
);


ALTER TABLE public."CHURCHES" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16398)
-- Name: CHURCHES_ID_CHURCH_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CHURCHES_ID_CHURCH_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CHURCHES_ID_CHURCH_seq" OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 215
-- Name: CHURCHES_ID_CHURCH_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CHURCHES_ID_CHURCH_seq" OWNED BY public."CHURCHES"."ID_CHURCH";


--
-- TOC entry 219 (class 1259 OID 16411)
-- Name: DOMAINS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DOMAINS" (
    "ID_DOMAIN" integer NOT NULL,
    "NAME" text NOT NULL,
    "DESCRIPTION" text NOT NULL
);


ALTER TABLE public."DOMAINS" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16410)
-- Name: DOMAINS_ID_DOMAIN_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DOMAINS_ID_DOMAIN_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."DOMAINS_ID_DOMAIN_seq" OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 218
-- Name: DOMAINS_ID_DOMAIN_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DOMAINS_ID_DOMAIN_seq" OWNED BY public."DOMAINS"."ID_DOMAIN";


--
-- TOC entry 217 (class 1259 OID 16405)
-- Name: DOMAIN_VALUES; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DOMAIN_VALUES" (
    "ID_DOMAIN_VALUE" integer NOT NULL,
    "ID_DOMAIN" integer NOT NULL,
    "NAME" text NOT NULL,
    "DESCRIPTION" text NOT NULL
);


ALTER TABLE public."DOMAIN_VALUES" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16509)
-- Name: DOMAIN_VALUES_ID_DOMAIN_VALUE_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DOMAIN_VALUES_ID_DOMAIN_VALUE_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE public."DOMAIN_VALUES_ID_DOMAIN_VALUE_seq" OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 227
-- Name: DOMAIN_VALUES_ID_DOMAIN_VALUE_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DOMAIN_VALUES_ID_DOMAIN_VALUE_seq" OWNED BY public."DOMAIN_VALUES"."ID_DOMAIN_VALUE";


--
-- TOC entry 221 (class 1259 OID 16418)
-- Name: LINKS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LINKS" (
    "ID_LINK" integer NOT NULL,
    "ID_CHURCH" integer NOT NULL,
    "ID_DOM_LINK" integer NOT NULL,
    "VALUE" text NOT NULL
);


ALTER TABLE public."LINKS" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16417)
-- Name: LINKS_ID_LINK_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."LINKS_ID_LINK_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."LINKS_ID_LINK_seq" OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 220
-- Name: LINKS_ID_LINK_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LINKS_ID_LINK_seq" OWNED BY public."LINKS"."ID_LINK";


--
-- TOC entry 223 (class 1259 OID 16425)
-- Name: LOCATIONS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LOCATIONS" (
    "ID_LOCATION" integer NOT NULL,
    "ID_DOM_LOCATION" integer NOT NULL,
    "ID_LOCATION_PARENT" integer,
    "NAME" text NOT NULL
);


ALTER TABLE public."LOCATIONS" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16424)
-- Name: LOCATIONS_ID_LOCATION_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."LOCATIONS_ID_LOCATION_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."LOCATIONS_ID_LOCATION_seq" OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 222
-- Name: LOCATIONS_ID_LOCATION_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LOCATIONS_ID_LOCATION_seq" OWNED BY public."LOCATIONS"."ID_LOCATION";


--
-- TOC entry 225 (class 1259 OID 16430)
-- Name: SCHEDULES; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SCHEDULES" (
    "ID_SCHEDULE" integer NOT NULL,
    "ID_CHURCH" integer NOT NULL,
    "ID_DOM_SCHEDULE" integer NOT NULL,
    "ID_DOM_DAY_OF_WEEK" integer NOT NULL,
    "START_TIME" character varying(5) NOT NULL,
    "END_TIME" character varying(5),
    "COMMENTS" text
);


ALTER TABLE public."SCHEDULES" OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "SCHEDULES"."START_TIME"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."SCHEDULES"."START_TIME" IS 'HH24:MM';


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "SCHEDULES"."END_TIME"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."SCHEDULES"."END_TIME" IS 'HH24:MM';


--
-- TOC entry 224 (class 1259 OID 16429)
-- Name: SCHEDULES_ID_SCHEDULE_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SCHEDULES_ID_SCHEDULE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."SCHEDULES_ID_SCHEDULE_seq" OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 224
-- Name: SCHEDULES_ID_SCHEDULE_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SCHEDULES_ID_SCHEDULE_seq" OWNED BY public."SCHEDULES"."ID_SCHEDULE";


--
-- TOC entry 226 (class 1259 OID 16436)
-- Name: USERS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."USERS" (
    "ID_USER" integer NOT NULL,
    "FIRST_NAME" text NOT NULL,
    "LAST_NAME" text NOT NULL
);


ALTER TABLE public."USERS" OWNER TO postgres;

--
-- TOC entry 4717 (class 2604 OID 16402)
-- Name: CHURCHES ID_CHURCH; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CHURCHES" ALTER COLUMN "ID_CHURCH" SET DEFAULT nextval('public."CHURCHES_ID_CHURCH_seq"'::regclass);


--
-- TOC entry 4719 (class 2604 OID 16414)
-- Name: DOMAINS ID_DOMAIN; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOMAINS" ALTER COLUMN "ID_DOMAIN" SET DEFAULT nextval('public."DOMAINS_ID_DOMAIN_seq"'::regclass);


--
-- TOC entry 4718 (class 2604 OID 16510)
-- Name: DOMAIN_VALUES ID_DOMAIN_VALUE; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOMAIN_VALUES" ALTER COLUMN "ID_DOMAIN_VALUE" SET DEFAULT nextval('public."DOMAIN_VALUES_ID_DOMAIN_VALUE_seq"'::regclass);


--
-- TOC entry 4720 (class 2604 OID 16421)
-- Name: LINKS ID_LINK; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LINKS" ALTER COLUMN "ID_LINK" SET DEFAULT nextval('public."LINKS_ID_LINK_seq"'::regclass);


--
-- TOC entry 4721 (class 2604 OID 16428)
-- Name: LOCATIONS ID_LOCATION; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOCATIONS" ALTER COLUMN "ID_LOCATION" SET DEFAULT nextval('public."LOCATIONS_ID_LOCATION_seq"'::regclass);


--
-- TOC entry 4722 (class 2604 OID 16433)
-- Name: SCHEDULES ID_SCHEDULE; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SCHEDULES" ALTER COLUMN "ID_SCHEDULE" SET DEFAULT nextval('public."SCHEDULES_ID_SCHEDULE_seq"'::regclass);


--
-- TOC entry 4899 (class 0 OID 16399)
-- Dependencies: 216
-- Data for Name: CHURCHES; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CHURCHES" VALUES (1, 'Parroquia Santa María de Guadalupe', 'Manuel Eduardo Acevedo Ospina', 'Carrera 90 No. 42 A 37 Sur', 3, 4.63862200, -74.17308100, '3213408321', '4819395', '2024-05-19', 1, 1, '2024-05-19');
INSERT INTO public."CHURCHES" VALUES (2, 'Parroquia Santa Bernardita', 'John Jader Vanegas Gómez', 'Calle 5B No. 87 A – 70 sur', 5, 4.64233900, -74.15864200, '3053828720', NULL, '2024-05-19', 1, 1, '2024-05-19');
INSERT INTO public."CHURCHES" VALUES (3, 'Parroquia de San Alfonso María de Ligorio - Iglesia del Señor de Los Milagros', 'Jimmy Orlando Mantilla Pabón', 'Avenida Carrera 28 # 39 - 27', 4, 4.62810400, -74.07785500, '3217601987', '2445908', '2024-05-19', 1, 1, '2024-05-19');


--
-- TOC entry 4902 (class 0 OID 16411)
-- Dependencies: 219
-- Data for Name: DOMAINS; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DOMAINS" VALUES (1, 'Days of the week', 'mon, tue, ...');
INSERT INTO public."DOMAINS" VALUES (2, 'Kinds of location', 'country, city, sector');
INSERT INTO public."DOMAINS" VALUES (3, 'Kinds of schedule', 'parish_office, mass, confessions, adoration, rosary, other devotions...');
INSERT INTO public."DOMAINS" VALUES (4, 'Kinds of links', 'web, email, whataspp, facebook, instagram, x, tik tok, other links and social');


--
-- TOC entry 4900 (class 0 OID 16405)
-- Dependencies: 217
-- Data for Name: DOMAIN_VALUES; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DOMAIN_VALUES" VALUES (1, 1, 'monday', 'monday');
INSERT INTO public."DOMAIN_VALUES" VALUES (2, 1, 'tuesday', 'tuesday');
INSERT INTO public."DOMAIN_VALUES" VALUES (3, 1, 'wednesday', 'wednesday');
INSERT INTO public."DOMAIN_VALUES" VALUES (4, 1, 'thursday', 'thursday');
INSERT INTO public."DOMAIN_VALUES" VALUES (5, 1, 'friday', 'friday');
INSERT INTO public."DOMAIN_VALUES" VALUES (6, 1, 'saturday', 'saturday');
INSERT INTO public."DOMAIN_VALUES" VALUES (7, 1, 'sunday', 'sunday');
INSERT INTO public."DOMAIN_VALUES" VALUES (8, 3, 'parish office', 'parish office');
INSERT INTO public."DOMAIN_VALUES" VALUES (9, 3, 'mass', 'mass');
INSERT INTO public."DOMAIN_VALUES" VALUES (10, 3, 'confessions', 'confessions');
INSERT INTO public."DOMAIN_VALUES" VALUES (11, 3, 'adoration', 'adoration');
INSERT INTO public."DOMAIN_VALUES" VALUES (12, 3, 'rosary', 'rosary');
INSERT INTO public."DOMAIN_VALUES" VALUES (13, 4, 'web', 'web');
INSERT INTO public."DOMAIN_VALUES" VALUES (14, 4, 'email', 'email');
INSERT INTO public."DOMAIN_VALUES" VALUES (15, 4, 'whatsapp', 'whatsapp');
INSERT INTO public."DOMAIN_VALUES" VALUES (16, 4, 'facebook', 'facebook');
INSERT INTO public."DOMAIN_VALUES" VALUES (17, 4, 'instagram', 'instagram');
INSERT INTO public."DOMAIN_VALUES" VALUES (18, 4, 'x', 'x');
INSERT INTO public."DOMAIN_VALUES" VALUES (19, 4, 'tik tok', 'tik tok');
INSERT INTO public."DOMAIN_VALUES" VALUES (20, 2, 'country', 'country');
INSERT INTO public."DOMAIN_VALUES" VALUES (21, 2, 'city', 'city');
INSERT INTO public."DOMAIN_VALUES" VALUES (22, 2, 'sector', 'town, sector, specific place');
INSERT INTO public."DOMAIN_VALUES" VALUES (25, 1, 'mon-fri', 'monday to friday');
INSERT INTO public."DOMAIN_VALUES" VALUES (26, 1, 'mon-sat', 'monday to saturday');
INSERT INTO public."DOMAIN_VALUES" VALUES (27, 1, 'tue-fri', 'tuesday to friday');
INSERT INTO public."DOMAIN_VALUES" VALUES (28, 1, 'tue-sat', 'tuesday to saturday');
INSERT INTO public."DOMAIN_VALUES" VALUES (29, 4, 'youtube', 'youtube');
INSERT INTO public."DOMAIN_VALUES" VALUES (30, 3, 'holy hour', 'The holy hour');
INSERT INTO public."DOMAIN_VALUES" VALUES (31, 1, '14th', 'The Lord of Miracles. On the 14th of each month');


--
-- TOC entry 4904 (class 0 OID 16418)
-- Dependencies: 221
-- Data for Name: LINKS; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."LINKS" VALUES (2, 2, 15, '3138281654');
INSERT INTO public."LINKS" VALUES (4, 1, 15, '3213408321');
INSERT INTO public."LINKS" VALUES (1, 2, 16, 'https://www.facebook.com/psantabernardita1991');
INSERT INTO public."LINKS" VALUES (3, 1, 16, 'https://www.facebook.com/parroquia.guadalupedindalito/');
INSERT INTO public."LINKS" VALUES (5, 3, 13, 'https://parroquiasanalfonso.com/');
INSERT INTO public."LINKS" VALUES (6, 3, 14, 'psanalfonsobogota@gmail.com');
INSERT INTO public."LINKS" VALUES (7, 3, 13, 'https://parroquiasanalfonso.com/');
INSERT INTO public."LINKS" VALUES (8, 3, 15, 'https://walink.co/26d871');
INSERT INTO public."LINKS" VALUES (9, 3, 16, 'https://www.facebook.com/milagrosobogota/');
INSERT INTO public."LINKS" VALUES (10, 3, 17, 'https://www.instagram.com/milagrosobogota/');
INSERT INTO public."LINKS" VALUES (11, 3, 29, 'https://www.youtube.com/@parroquiasanalfonso-senord4471');


--
-- TOC entry 4906 (class 0 OID 16425)
-- Dependencies: 223
-- Data for Name: LOCATIONS; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."LOCATIONS" VALUES (1, 20, NULL, 'Colombia');
INSERT INTO public."LOCATIONS" VALUES (2, 21, 1, 'Bogotá');
INSERT INTO public."LOCATIONS" VALUES (3, 22, 2, 'Dindalito');
INSERT INTO public."LOCATIONS" VALUES (4, 22, 2, 'Teusaquillo');
INSERT INTO public."LOCATIONS" VALUES (5, 22, 2, 'Patio Bonito');


--
-- TOC entry 4908 (class 0 OID 16430)
-- Dependencies: 225
-- Data for Name: SCHEDULES; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SCHEDULES" VALUES (4, 2, 9, 1, '17:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (5, 2, 9, 28, '7:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (6, 2, 9, 28, '17:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (7, 2, 9, 7, '7:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (8, 2, 9, 7, '9:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (9, 2, 9, 7, '11:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (10, 2, 9, 7, '17:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (12, 1, 9, 1, '18:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (13, 1, 9, 28, '7:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (14, 1, 9, 28, '18:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (15, 1, 9, 7, '7:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (16, 1, 9, 7, '9:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (17, 1, 9, 7, '11:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (18, 1, 9, 7, '17:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (19, 1, 9, 7, '19:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (1, 2, 8, 1, '14:00', '16:00', NULL);
INSERT INTO public."SCHEDULES" VALUES (2, 2, 8, 28, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (3, 2, 8, 28, '14:00', '16:00', '');
INSERT INTO public."SCHEDULES" VALUES (11, 1, 8, 26, '14:00', '17:00', NULL);
INSERT INTO public."SCHEDULES" VALUES (20, 3, 8, 26, '8:00', '16:50', NULL);
INSERT INTO public."SCHEDULES" VALUES (21, 3, 8, 7, '8:00', '15:50', NULL);
INSERT INTO public."SCHEDULES" VALUES (24, 3, 9, 25, '8:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (26, 3, 9, 25, '16:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (27, 3, 9, 25, '16:45', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (28, 3, 9, 25, '17:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (29, 3, 9, 25, '18:15', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (32, 3, 9, 7, '8:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (33, 3, 9, 7, '10:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (35, 3, 9, 7, '13:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (36, 3, 9, 7, '14:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (37, 3, 9, 7, '16:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (38, 3, 9, 7, '17:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (40, 3, 9, 31, '4:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (41, 3, 9, 31, '5:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (42, 3, 9, 31, '7:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (43, 3, 9, 31, '8:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (44, 3, 9, 31, '10:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (45, 3, 9, 31, '11:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (46, 3, 9, 31, '13:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (47, 3, 9, 31, '14:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (48, 3, 9, 31, '16:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (49, 3, 9, 31, '17:30', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (50, 3, 9, 31, '19:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (51, 3, 9, 31, '20:15', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (53, 3, 9, 6, '8:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (55, 3, 9, 6, '17:00', NULL, NULL);
INSERT INTO public."SCHEDULES" VALUES (23, 3, 9, 25, '7:00', NULL, 'Eucaristía trasmitida virtualmente');
INSERT INTO public."SCHEDULES" VALUES (25, 3, 9, 25, '12:00', NULL, 'Eucaristía trasmitida virtualmente');
INSERT INTO public."SCHEDULES" VALUES (30, 3, 9, 25, '19:00', NULL, 'Eucaristía trasmitida virtualmente');
INSERT INTO public."SCHEDULES" VALUES (54, 3, 9, 6, '12:00', NULL, 'Eucaristía trasmitida virtualmente');
INSERT INTO public."SCHEDULES" VALUES (52, 3, 9, 6, '7:00', NULL, 'Eucaristía trasmitida virtualmente');
INSERT INTO public."SCHEDULES" VALUES (31, 3, 9, 7, '7:00', NULL, 'Eucaristía trasmitida virtualmente');
INSERT INTO public."SCHEDULES" VALUES (34, 3, 9, 7, '11:30', NULL, 'Eucaristía trasmitida virtualmente');
INSERT INTO public."SCHEDULES" VALUES (39, 3, 9, 7, '19:00', NULL, 'Eucaristía trasmitida virtualmente');


--
-- TOC entry 4909 (class 0 OID 16436)
-- Dependencies: 226
-- Data for Name: USERS; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."USERS" VALUES (1, 'Jonnathan', 'Cruz');


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 215
-- Name: CHURCHES_ID_CHURCH_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CHURCHES_ID_CHURCH_seq"', 3, true);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 218
-- Name: DOMAINS_ID_DOMAIN_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DOMAINS_ID_DOMAIN_seq"', 9, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 227
-- Name: DOMAIN_VALUES_ID_DOMAIN_VALUE_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DOMAIN_VALUES_ID_DOMAIN_VALUE_seq"', 31, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 220
-- Name: LINKS_ID_LINK_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LINKS_ID_LINK_seq"', 11, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 222
-- Name: LOCATIONS_ID_LOCATION_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LOCATIONS_ID_LOCATION_seq"', 5, true);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 224
-- Name: SCHEDULES_ID_SCHEDULE_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SCHEDULES_ID_SCHEDULE_seq"', 55, true);


--
-- TOC entry 4726 (class 2606 OID 16442)
-- Name: CHURCHES PK_CHURCHES; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CHURCHES"
    ADD CONSTRAINT "PK_CHURCHES" PRIMARY KEY ("ID_CHURCH");


--
-- TOC entry 4731 (class 2606 OID 16449)
-- Name: DOMAINS PK_DOMAINS; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOMAINS"
    ADD CONSTRAINT "PK_DOMAINS" PRIMARY KEY ("ID_DOMAIN");


--
-- TOC entry 4729 (class 2606 OID 16446)
-- Name: DOMAIN_VALUES PK_DOMAIN_VALUES; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOMAIN_VALUES"
    ADD CONSTRAINT "PK_DOMAIN_VALUES" PRIMARY KEY ("ID_DOMAIN_VALUE");


--
-- TOC entry 4735 (class 2606 OID 16451)
-- Name: LINKS PK_LINKS; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LINKS"
    ADD CONSTRAINT "PK_LINKS" PRIMARY KEY ("ID_LINK");


--
-- TOC entry 4738 (class 2606 OID 16455)
-- Name: LOCATIONS PK_LOCATIONS; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOCATIONS"
    ADD CONSTRAINT "PK_LOCATIONS" PRIMARY KEY ("ID_LOCATION");


--
-- TOC entry 4743 (class 2606 OID 16458)
-- Name: SCHEDULES PK_SCHEDULES; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SCHEDULES"
    ADD CONSTRAINT "PK_SCHEDULES" PRIMARY KEY ("ID_SCHEDULE");


--
-- TOC entry 4745 (class 2606 OID 16463)
-- Name: USERS PK_USERS; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."USERS"
    ADD CONSTRAINT "PK_USERS" PRIMARY KEY ("ID_USER");


--
-- TOC entry 4723 (class 1259 OID 16443)
-- Name: IXFK_CHURCHES_LOCATIONS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IXFK_CHURCHES_LOCATIONS" ON public."CHURCHES" USING btree ("ID_LOCATION");


--
-- TOC entry 4724 (class 1259 OID 16444)
-- Name: IXFK_CHURCHES_USERS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IXFK_CHURCHES_USERS" ON public."CHURCHES" USING btree ("ID_USER_CREATED");


--
-- TOC entry 4727 (class 1259 OID 16447)
-- Name: IXFK_DOMAIN_VALUES_DOMAINS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IXFK_DOMAIN_VALUES_DOMAINS" ON public."DOMAIN_VALUES" USING btree ("ID_DOMAIN");


--
-- TOC entry 4732 (class 1259 OID 16452)
-- Name: IXFK_LINKS_CHURCHES; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IXFK_LINKS_CHURCHES" ON public."LINKS" USING btree ("ID_CHURCH");


--
-- TOC entry 4733 (class 1259 OID 16453)
-- Name: IXFK_LINKS_DOMAIN_VALUES; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IXFK_LINKS_DOMAIN_VALUES" ON public."LINKS" USING btree ("ID_DOM_LINK");


--
-- TOC entry 4736 (class 1259 OID 16456)
-- Name: IXFK_LOCATIONS_DOMAIN_VALUES; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IXFK_LOCATIONS_DOMAIN_VALUES" ON public."LOCATIONS" USING btree ("ID_DOM_LOCATION");


--
-- TOC entry 4739 (class 1259 OID 16459)
-- Name: IXFK_SCHEDULES_CHURCHES; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IXFK_SCHEDULES_CHURCHES" ON public."SCHEDULES" USING btree ("ID_CHURCH");


--
-- TOC entry 4740 (class 1259 OID 16460)
-- Name: IXFK_SCHEDULES_DOMAIN_VALUES; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IXFK_SCHEDULES_DOMAIN_VALUES" ON public."SCHEDULES" USING btree ("ID_DOM_SCHEDULE");


--
-- TOC entry 4741 (class 1259 OID 16461)
-- Name: IXFK_SCHEDULES_DOMAIN_VALUES_02; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IXFK_SCHEDULES_DOMAIN_VALUES_02" ON public."SCHEDULES" USING btree ("ID_DOM_DAY_OF_WEEK");


--
-- TOC entry 4746 (class 2606 OID 16464)
-- Name: CHURCHES FK_CHURCHES_LOCATIONS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CHURCHES"
    ADD CONSTRAINT "FK_CHURCHES_LOCATIONS" FOREIGN KEY ("ID_LOCATION") REFERENCES public."LOCATIONS"("ID_LOCATION");


--
-- TOC entry 4747 (class 2606 OID 16469)
-- Name: CHURCHES FK_CHURCHES_USERS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CHURCHES"
    ADD CONSTRAINT "FK_CHURCHES_USERS" FOREIGN KEY ("ID_USER_CREATED") REFERENCES public."USERS"("ID_USER");


--
-- TOC entry 4748 (class 2606 OID 16474)
-- Name: DOMAIN_VALUES FK_DOMAIN_VALUES_DOMAINS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOMAIN_VALUES"
    ADD CONSTRAINT "FK_DOMAIN_VALUES_DOMAINS" FOREIGN KEY ("ID_DOMAIN") REFERENCES public."DOMAINS"("ID_DOMAIN");


--
-- TOC entry 4749 (class 2606 OID 16479)
-- Name: LINKS FK_LINKS_CHURCHES; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LINKS"
    ADD CONSTRAINT "FK_LINKS_CHURCHES" FOREIGN KEY ("ID_CHURCH") REFERENCES public."CHURCHES"("ID_CHURCH");


--
-- TOC entry 4750 (class 2606 OID 16484)
-- Name: LINKS FK_LINKS_DOMAIN_VALUES; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LINKS"
    ADD CONSTRAINT "FK_LINKS_DOMAIN_VALUES" FOREIGN KEY ("ID_DOM_LINK") REFERENCES public."DOMAIN_VALUES"("ID_DOMAIN_VALUE");


--
-- TOC entry 4751 (class 2606 OID 16489)
-- Name: LOCATIONS FK_LOCATIONS_DOMAIN_VALUES; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LOCATIONS"
    ADD CONSTRAINT "FK_LOCATIONS_DOMAIN_VALUES" FOREIGN KEY ("ID_DOM_LOCATION") REFERENCES public."DOMAIN_VALUES"("ID_DOMAIN_VALUE");


--
-- TOC entry 4752 (class 2606 OID 16494)
-- Name: SCHEDULES FK_SCHEDULES_CHURCHES; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SCHEDULES"
    ADD CONSTRAINT "FK_SCHEDULES_CHURCHES" FOREIGN KEY ("ID_CHURCH") REFERENCES public."CHURCHES"("ID_CHURCH");


--
-- TOC entry 4753 (class 2606 OID 16499)
-- Name: SCHEDULES FK_SCHEDULES_DOMAIN_VALUES; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SCHEDULES"
    ADD CONSTRAINT "FK_SCHEDULES_DOMAIN_VALUES" FOREIGN KEY ("ID_DOM_SCHEDULE") REFERENCES public."DOMAIN_VALUES"("ID_DOMAIN_VALUE");


--
-- TOC entry 4754 (class 2606 OID 16504)
-- Name: SCHEDULES FK_SCHEDULES_DOMAIN_VALUES_02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SCHEDULES"
    ADD CONSTRAINT "FK_SCHEDULES_DOMAIN_VALUES_02" FOREIGN KEY ("ID_DOM_DAY_OF_WEEK") REFERENCES public."DOMAIN_VALUES"("ID_DOMAIN_VALUE");


-- Completed on 2024-05-24 17:10:20

--
-- PostgreSQL database dump complete
--

