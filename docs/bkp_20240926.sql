--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-09-26 23:22:02

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
    "UPDATED_AT" date NOT NULL,
    "ID_USER_UPDATED" integer NOT NULL,
    "ID_USER_CREATED" integer NOT NULL,
    "CREATED_AT" date NOT NULL,
    "IMG" text
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

INSERT INTO public."CHURCHES" VALUES (3, 'Parroquia de San Alfonso María de Ligorio - Iglesia del Señor de Los Milagros', 'Jimmy Orlando Mantilla Pabón', 'Avenida Carrera 28 # 39 - 27', 4, 4.62810400, -74.07785500, '3217601987', '2445908', '2024-05-19', 1, 1, '2024-05-19', 'https://www.milagrosodebuga.com/wp-content/uploads/elementor/thumbs/parroquia_ligorio-ql79pnckwx2zvtfps1gptivctbgbp0cdffj4s49cwu.jpg');
INSERT INTO public."CHURCHES" VALUES (4, 'Parroquia Betania', 'Jairo Alberto Aguilar González', 'Calle 51 B sur No. 86 A – 22', 6, 4.62528870, -74.17847250, '3212562435', '6965453', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (5, 'Parroquia Santo Domingo Savio', 'Harold Camilo Guarnizo Camargo', 'Carrera 72 K No. 38 d – 03 Sur', 2, 4.61116400, -74.14602570, '3043962983', '6017919749', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (6, 'Parroquia Santísimo Sacramento', 'Norberto Palomino Anturi.', 'Calle 40 C SUR # 79 – 46', 2, 4.62258350, -74.15870340, NULL, '6016946092', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (7, 'Parroquia El Santo Cristo', 'Andrés Giovanny Macana Daza', 'Carrera 109 No. 23 B – 05', 2, 4.68542500, -74.14393670, '3163418156', '5490587', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (8, 'Parroquia Jesucristo Señor de la Paz', 'Wilson Arbey Sanabria Santos', 'Carrera 136 B No. 17 D – 72', 2, 4.69731260, -74.16735460, '3163396176', '4672686', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (9, 'Parroquia Jesús Amor Misericordioso', 'Jesús Hernán Orjuela Pardo', 'Carrera 78 No. 7 F – 20', 2, 4.63775630, -74.14164200, '3103340919', '6012920708', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (10, 'Parroquia Jesús Eucaristía', 'Yoel Gómez Ramírez', 'Diagonal 16 No. 104 – 51 Local 117', 2, 4.67078320, -74.15386050, '3227447219', NULL, '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (11, 'Parroquia La Ascensión del Señor', 'Andrzej Kazimierz Zielinski', 'Cl. 39 Sur #68h22', 2, 4.60481120, -74.13960330, NULL, '6014969113', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (12, 'Parroquia Los Discípulos de Emaús', 'Monseñor Milton Hernández Tavera', 'Carrera 82 No. 22 b -25', 7, 4.66528280, -74.12725380, '3002086272', '2884018', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (13, 'Parroquia Los Santos Apóstoles Pedro y Pablo', 'Pablo Cesar Gil Cuervo', 'Carrera 79 C No. 57D -01 SUR Casa de la cultura', 8, 4.61117420, -74.17607840, NULL, '6016293558', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (14, 'Parroquia Los Santos Cirilo y Metodio', 'Carlos Humberto García Buitrago', 'Transversal 72 F No. 40 – 37 sur', 2, 4.60430310, -74.14462630, '3134767175', '5246281', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (15, 'Parroquia Madre de la Divina Providencia', 'José Pompilio Moreno Ramírez', 'Calle 9 A # 68 F – 05 Sur', 2, 4.61734280, -74.12891210, '3228543607', '7532388', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (2, 'Parroquia Santa Bernardita', 'John Jader Vanegas Gómez', 'Calle 5B No. 87 A – 70 sur', 5, 4.64233900, -74.15864200, '3053828720', NULL, '2024-05-19', 1, 1, '2024-05-19', 'https://scontent.feoh3-1.fna.fbcdn.net/v/t39.30808-6/306741617_465006162337061_6464294687194178316_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeG62Q2hH4APtyO-TW84ACATGvyTe9TcN9Aa_JN71Nw30KJ-EIb5EohKwRWOI-jo37krMQII0rmNY8VdMIDGqb9A&_nc_ohc=X-rrOJaQonEQ7kNvgEcIsjB&_nc_ht=scontent.feoh3-1.fna&oh=00_AYDfaMsCuh-g3MzSAd01a3hfwulSLyMQzjH4PPQVKOzhvg&oe=66FB9BA9');
INSERT INTO public."CHURCHES" VALUES (16, 'Parroquia Madre de las Misiones', 'Jairo Calderón', 'Carrera 81 No. 24B – 55', 2, 4.66872430, -74.12042620, '3057659831', NULL, '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (17, 'Parroquia Madre y Reina del Carmelo', 'José Daniel Rocha Pedreros', 'Carrera 68F No. 3 A – 62', 2, 4.62584030, -74.12791860, '3508439682', '4190376', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (18, 'Parroquia María Reina de la Paz', 'Alexander Orozco Rodríguez', 'Carrera 82 C No. 5 A – 28 sur', 2, 4.63675050, -74.15811200, '3124199319', '6014004580', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (19, 'Parroquia María Madre de la Iglesia', 'Abderrahim Flórez Ortega', 'Carrera 73 B Bis No. 26 – 40 sur', 2, 4.62237120, -74.14453000, '3222208799', NULL, '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (20, 'Parroquia María Madre del Redentor', 'José Carlos Manzano Ascanio', 'Calle 47 B sur No. 79 C – 27', 2, 4.61742200, -74.16825870, NULL, '8051143', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (21, 'Parroquia Nazaret', 'Jhon Orlando Castellanos Ávila', 'Calle 14 B # 119 A – 71 Praderas II', 2, 4.68076140, -74.16669630, NULL, '4756677', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (22, 'Parroquia Nuestra Señora de Belén de Fontibón', 'Lorenzo Alzate Arboleda', 'Calle 18 # 110 – 58', 2, 4.68080980, -74.14985070, '3142165630', '8051373', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (23, 'Parroquia Nuestra Señora de Loreto', 'Nicolás Pérez Ávila', 'Carrera 81g Bis No. 42 A – 12 sur', 2, 4.62637400, -74.16686680, '3058715942', '6005696', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (24, 'Parroquia Nuestra Señora de Schoenstatt', 'Edgar Javier Bautista Pinillos', 'Carrera 80 A No. 35 A – 50 sur', 2, 4.61616730, -74.17410550, '3007231707', '6014516930', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (25, 'Parroquia Nuestra Señora del Perpetuo Socorro', 'Adam Pawel Gasior', 'Calle 34 Bis A sur No. 89C – 17', 2, 4.64217140, -74.16590250, NULL, '9054702', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (26, 'Parroquia Nuestra Señora de la Caridad', 'Jesús Antonio Obando Tejada', 'Calle 49 sur No. 78 – 12', 2, 4.61093160, -74.16605490, NULL, '6967584', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (27, 'Parroquia Nuestra Señora de la Laguna', 'José Jairo Galíndez Inchima', 'Carrera 102 No. 16 D – 01', 2, 4.67098610, -74.14967040, NULL, '6017179856', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (28, 'Parroquia San Efrén', 'Pedro José Rodríguez Baldión', 'Calle 6 BIS A No. 91 – 47', 2, 4.64877750, -74.16253510, NULL, '6017409009', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (29, 'Parroquia Nuestra Señora de la Medalla Milagrosa', 'Wilson Alfonso Mejía Naranjo', 'Carrera 68 B No. 24 – 30', 2, 4.65226220, -74.10916480, '3145737002', '6017451844', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (30, 'Parroquia Nuestra Señora de la Purísima Concepción', 'Héctor Eduardo Mejía Arciniegas', 'Carrera 123C No. 22G – 14 (Detrás del templo parroquial)', 2, 4.69353640, -74.15303750, NULL, '3034946', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (31, 'Parroquia Nuestra Señora de la Salud', 'Omar Javier Ojeda Teuta', 'Carrera 72 i No. 49B – 51 sur', 2, 4.60164880, -74.15166220, '3134053716', '6012009150', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (32, 'Parroquia Nuestra Señora del Amparo', 'Johan Sebastián Diaz Fernández', 'Carrera 73 A No. 11 A – 36', 2, 4.67378880, -74.10840490, NULL, '4243486', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (33, 'Parroquia Nuestra Señora del Tránsito', 'Luis Fernando León Robayo', 'Calle 22C Bis No. 89 – 81', 2, 4.67013700, -74.13150540, NULL, '9305674', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (34, 'Parroquia San Agustín de Fontibón', 'Fray Juan de Dios Tibocha Restrepo OAR (Orden Agustinos Recoletos)', 'Carrera 88 # 11 A – 22', 2, 4.65379280, -74.14650478, '3102626431', NULL, '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (35, 'Parroquia San Andrés', 'Luis Eduardo Páez Páez', 'Transversal 68G No. 44 A – 05 sur', 2, 4.59760680, -74.14459140, NULL, '7023659', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (36, 'Parroquia San Cayetano', 'Jorge Ricardo Céspedes Olarte', 'Av. Boyacá No. 37 – 80 sur', 2, 4.61286060, -74.14031480, '3144907742', '6017544053', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (37, 'Parroquia Nuestra Señora de la Macarena', 'Humberto Toro Burgos', 'Calle 38 Sur No. 78 – 19', 2, 4.62077540, -74.15091510, '3005313866', '4556476', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (38, 'Parroquia San Eugenio', 'Daniel Londoño Reina', 'Carrera 79 No. 6 – 71', 2, 4.63383220, -74.14956630, NULL, '7037654', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (39, 'Parroquia San Felipe de Jesús', 'José Javier Robayo Barbosa', 'Diagonal 7B No. 73B – 09', 2, 6.54449780, -73.13474550, '3124177711', '4129457', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (40, 'Parroquia San Ignacio de Antioquia', 'Luis Aladino Carrascal Gerardino', 'Transversal 68C No. 32 – 36 sur', 2, 4.60825030, -74.13304440, '7105994', '7505052', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (41, 'Parroquia San Ignacio de Loyola', 'Edison Hernán López López', 'Carrera 92 # 17 B – 40', 2, 4.66582620, -74.13716150, '3213851677', '8053489', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (42, 'Parroquia San José de Fontibón', 'Ricardo Acero Marín', 'Carrera 100 No. 24 – 60', 2, 4.68173500, -74.13345830, '3016772005', '4134968', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (43, 'Parroquia San Juan de la Cruz', 'Humberto Fuentes Rubio', 'Carrera 79B No. 42C – 26 sur', 2, 4.61943380, -74.16311950, '3213787885', '6013874854', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (44, 'Parroquia San Juan Macías', 'José Isaac Ahumada Valbuena', 'Carrera 79 c # 13 A – 30', 2, 4.65048600, -74.13555510, '2926613', '4112488', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (45, 'Parroquia San Juan Pablo II', 'Nelson David Gómez Berruecos', 'Calle 12 C N° 71 B-60', 2, 4.64522170, -74.12966400, '3507851998', NULL, '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (46, 'Parroquia San Justino Mártir', 'Carlos Humberto Bernal Moreno', 'Carrera 81C No. 47 A – 30 sur', 2, 4.62207520, -74.17099400, '3024059500', '6017852584', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (47, 'Parroquia San Leonardo Murialdo', 'Gabriele Giovanni Prandi', 'Diagonal 40 sur No. 72M – 90', 9, 4.61087790, -74.14971610, '3144725245', '6012647407', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (48, 'Parroquia San Luis, Rey de Francia', 'Omar Landa Aparicio', 'Carrera 91 No. 49D– 27 sur', 2, 4.63528510, -74.18222920, '3016329712', '4971688', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (49, 'Parroquia San Pablo Miki', 'Eivar Gerardo Ordoñez Muñoz', 'Carrera 123 No. 17F – 07', 2, 4.68885100, -74.15762040, NULL, '4186189', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (50, 'Parroquia San Patricio', 'Ernesto Arenas Granados', 'Calle 38 C sur No. 73 A – 24', 10, 4.61643340, -74.14899600, '3223346321', '6019372021', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (51, 'Parroquia San Pedro Claver de Fontibón', 'Jackson Arsenio Parada Agelviz', 'Carrera 93 D No. 0 – 90', 2, 4.64864480, -74.16682910, '3227584737', NULL, '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (52, 'Parroquia San Pío X Frailes Carmelitas Descalzos.', 'Gustavo de Jesús Escobar', 'Calle 3 No. 72-35', 2, 4.62527800, -74.13884020, '3209504204', '2738949', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (53, 'Parroquia San Roberto Belarmino', 'Javier Munar Peña', 'Carrera 78K No. 35 A – 40 sur', 2, 4.62547950, -74.15163410, NULL, '9419186', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (56, 'Parroquia Santa Catalina de Alejandría', 'Juan David Camargo Perez', 'Carrera 77 H No. 54 – 30 sur', 2, 4.60463140, -74.16906740, '3245838109', '3865224', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (57, 'Parroquia Santa Engracia', 'Pedro Vicente Chitiva Ángel', 'Carrera 68 C Bis # 37 A – 33 sur', 2, 4.60390980, -74.13546480, '3058715942', '6017651779', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (54, 'Parroquia San Roque González', 'Dalmiro Segundo Pimienta Martínez', 'Carrera 86D No. 42F – 50 sur', 2, 4.63069010, -74.17081830, NULL, '6965909', '2024-06-08', 1, 1, '2024-06-08', 'https://horariomisa.co/wp-content/uploads/2023/12/AdSWT_parroquia-san-roque-gonzalez-bogota-bogota-1024x576.jpg');
INSERT INTO public."CHURCHES" VALUES (58, 'Parroquia Santa Juana de Arco', 'Luis Alejandro Alméciga Tovar', 'Carrera 69F No. 7 A – 13', 2, 4.63244690, -74.13039430, '3214799853', '4203239', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (59, 'Parroquia Santa Laura Montoya', 'Arnoby Alvarez Charry', 'Cl 19A #72-57, Centro Comercial Multiplaza, Sótano 1 detrás de la oficina de la Administración.', 11, 4.65230210, -74.12708090, '3164212620', NULL, '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (60, 'Parroquia Santa Luisa de Marillac', 'Tulio Mario Montoya Aguirre', 'Calle 38 A Sur No. 86F – 17', 2, 4.63567430, -74.16437440, '3227974098', NULL, '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (61, 'Parroquia Santa Margarita María de Alacoque', 'Hugo León Londoño', 'Transv. 78K No. 41B – 70 sur', 2, 4.61878860, -74.15825230, '3153470055', '6014546961', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (63, 'Parroquia Santa María del Pilar', 'Iván Manuel Garizado Canchilla', 'Carrera 78B No. 57A – 41 sur', 2, 4.60746850, -74.17249920, NULL, '6018050938', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (64, 'Parroquia Santiago Apóstol-La Catedral', 'Javier Baquero Morales', 'Carrera 99 No. 17A – 62', 2, 4.67305850, -74.14402110, NULL, '4151342', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (65, 'Parroquia Santo Tomás Moro', 'Hernando Javier Moreno Carreño', 'Carrera 74 N° 41B – 79 sur', 2, 4.61227170, -74.15610380, NULL, '4510061', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (66, 'Parroquia San Mauricio', 'John Jairo Rodríguez Sánchez', 'Carrera 81 N° 8D – 44 B. ', 12, 4.64554150, -74.14493260, NULL, '6017557434', '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (1, 'Parroquia Santa María de Guadalupe', 'Manuel Eduardo Acevedo Ospina', 'Carrera 90 No. 42 A 37 Sur', 3, 4.63862200, -74.17308100, '3213408321', '4819395', '2024-05-19', 1, 1, '2024-05-19', 'https://lh5.googleusercontent.com/p/AF1QipMsJ7CyLAWDv8D2shV_UlH-FDiG_KLpd_m5wDgx=w600-h321-p-k-no');
INSERT INTO public."CHURCHES" VALUES (67, 'Parroquia Santa María Bernarda Butler', 'Andres Felipe Garcia Cardenas', 'Carrera 82 N° 22B – 25', 2, 4.66542260, -74.12748491, '3208168128', NULL, '2024-06-08', 1, 1, '2024-06-08', NULL);
INSERT INTO public."CHURCHES" VALUES (68, 'Parroquia Santa María de la Rivera', 'Pedro Manuel Barón Ochoa', 'Carrera 97 D No. 42 A – 26 sur', 2, 4.64574690, -74.17685050, '3203420137', '4809689', '2024-06-08', 1, 1, '2024-06-08', 'https://direccion.com.co/wp-content/uploads/2017/08/PARROQUIA%20SANTA%20MARIA%20DE%20LA%20RIVERA.jpg.webp');
INSERT INTO public."CHURCHES" VALUES (62, 'Parroquia Santa María del Paraíso', 'Jorge Armando Colmenares Sandoval', 'Calle 40 sur No. 89C – 22', 2, 4.64031970, -74.16909230, NULL, '6019372721', '2024-06-08', 1, 1, '2024-06-08', NULL);


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
INSERT INTO public."DOMAIN_VALUES" VALUES (32, 1, 'mon-tue-thu-fri', 'monday to friday, except wednesday');
INSERT INTO public."DOMAIN_VALUES" VALUES (33, 1, 'mon-tue-thu-fri-sat', 'monday to saturday, except wednesday');
INSERT INTO public."DOMAIN_VALUES" VALUES (34, 1, 'First-sat', 'First saturday of month');
INSERT INTO public."DOMAIN_VALUES" VALUES (35, 1, 'First-fri', 'First friday of month');


--
-- TOC entry 4904 (class 0 OID 16418)
-- Dependencies: 221
-- Data for Name: LINKS; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."LINKS" VALUES (85, 4, 14, 'parroquiabetania@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (2, 2, 15, '3138281654');
INSERT INTO public."LINKS" VALUES (86, 5, 14, 'santodomingosavio@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (4, 1, 15, '3213408321');
INSERT INTO public."LINKS" VALUES (1, 2, 16, 'https://www.facebook.com/psantabernardita1991');
INSERT INTO public."LINKS" VALUES (3, 1, 16, 'https://www.facebook.com/parroquia.guadalupedindalito/');
INSERT INTO public."LINKS" VALUES (87, 6, 14, 'parroquiasantisimosacramento@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (6, 3, 14, 'psanalfonsobogota@gmail.com');
INSERT INTO public."LINKS" VALUES (7, 3, 13, 'https://parroquiasanalfonso.com/');
INSERT INTO public."LINKS" VALUES (8, 3, 15, 'https://walink.co/26d871');
INSERT INTO public."LINKS" VALUES (9, 3, 16, 'https://www.facebook.com/milagrosobogota/');
INSERT INTO public."LINKS" VALUES (10, 3, 17, 'https://www.instagram.com/milagrosobogota/');
INSERT INTO public."LINKS" VALUES (11, 3, 29, 'https://www.youtube.com/@parroquiasanalfonso-senord4471');
INSERT INTO public."LINKS" VALUES (88, 7, 14, 'parroquiasantocristo@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (89, 8, 14, 'parroquiajesucristosenordelapaz@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (90, 9, 14, 'santuariodelamisericordia@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (91, 10, 14, 'parroquiajesuseucaristia@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (16, 20, 15, '3170737284');
INSERT INTO public."LINKS" VALUES (17, 32, 15, '3194248762');
INSERT INTO public."LINKS" VALUES (18, 61, 15, '3058096190');
INSERT INTO public."LINKS" VALUES (19, 66, 15, '3123825127');
INSERT INTO public."LINKS" VALUES (20, 4, 14, 'parroquiabetania@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (92, 11, 14, 'parroquiaascensiondelsenor@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (93, 12, 14, 'parroquiadiscipulosemaus@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (94, 13, 14, 'parroquiasantospedroypablo@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (95, 14, 14, 'parroquiasantosciriloymetodio@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (96, 15, 14, 'parroquialadivinaprovidencia@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (97, 16, 14, 'parroquiamadredelasmisiones@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (98, 17, 14, 'parroquiamadreyreinadelcarmelo@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (99, 18, 14, 'parroquiamariareinadelapaz@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (100, 19, 14, 'parroquiamariamadredelaiglesia@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (101, 20, 14, 'parroquiamadredelredentor@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (102, 21, 14, 'parroquianazaret@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (103, 22, 14, 'parroquianuestrasenora@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (104, 23, 14, 'parroquiadeloreto@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (105, 24, 14, 'parroquiadeschoenstatt@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (106, 25, 14, '. parroquiadelperpetuosocorro@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (107, 26, 14, 'parroquiadelacaridad@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (109, 28, 14, 'parroquiasanefren@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (111, 30, 14, 'parroquiapurisimaconcepcion@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (112, 31, 14, 'parroquiadelasalud@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (113, 32, 14, 'parroquiadelamparo@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (114, 33, 14, 'parroquiadeltransito@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (115, 34, 14, 'parroquiasanagustin@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (116, 35, 14, 'parroquiasanandres@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (117, 36, 14, 'parroquiasancayetano@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (119, 38, 14, 'parroquiasaneugenio@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (120, 39, 14, 'parroquiasanfelipedejesus@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (121, 40, 14, 'parroquiasanignaciodeantioquia@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (122, 41, 14, 'parroquiasanignaciodeloyola@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (123, 42, 14, 'parroquiasanjose@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (124, 43, 14, 'parroquiasanjuandelacruz@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (125, 44, 14, 'parroquiasanjuanmacias@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (126, 45, 14, 'parroquiasanjuanpablo2@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (127, 46, 14, 'parroquiasanjustinomartir@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (128, 47, 14, 'parroquiasanleonardomurialdo@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (129, 48, 14, 'parroquiasanluis@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (130, 49, 14, 'parroquiasanpablomiki@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (132, 51, 14, 'parroquiasanpedroclaver@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (133, 52, 14, 'parroquiasanpiox@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (134, 53, 14, 'parroquiasanrobertobelarmino@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (135, 54, 14, 'parroquiasanroquegonzalez@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (136, 56, 14, 'parroquiasantacatalina@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (137, 57, 14, 'parroquiasantaengracia@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (138, 58, 14, 'parroquiasantajuanadearco@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (139, 59, 14, 'parroquiasantalauramontoya@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (140, 60, 14, 'parroquiasantaluisademarillac@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (141, 61, 14, 'parroquiasantamargaritadealacoque@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (142, 62, 14, 'parroquiasantamariadelparaiso@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (143, 63, 14, 'parroquiasantamariadelpilar@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (144, 64, 14, 'catedralsantiagoapostol@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (145, 65, 14, 'parroquiasantotomasmoro@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (146, 66, 14, 'parroquiasanmauricio@diocesisdefontibon.comFacebook:Parroquia San Mauricio');
INSERT INTO public."LINKS" VALUES (147, 67, 14, 'santamariabernarda@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (149, 1, 14, 'parroquiadeguadalupe@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (150, 2, 14, 'parroquiasantabernardita@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (108, 27, 14, 'parroquiadelalaguna@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (110, 29, 14, 'parroquiamedallamilagrosa@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (118, 37, 14, 'parroquiadelamacarena@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (131, 50, 14, 'parroquiasanpatricio@diocesisdefontibon.com');
INSERT INTO public."LINKS" VALUES (148, 68, 14, 'parroquiasantamariadelarivera@diocesisdefontibon.com');


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
INSERT INTO public."LOCATIONS" VALUES (6, 22, 2, 'Bosa');
INSERT INTO public."LOCATIONS" VALUES (7, 22, 2, 'Nueva Modelia');
INSERT INTO public."LOCATIONS" VALUES (8, 22, 2, 'Roma');
INSERT INTO public."LOCATIONS" VALUES (9, 22, 2, 'Timiza');
INSERT INTO public."LOCATIONS" VALUES (10, 22, 2, 'Camilo Torres');
INSERT INTO public."LOCATIONS" VALUES (11, 22, 2, 'Fontibón');
INSERT INTO public."LOCATIONS" VALUES (12, 22, 2, 'Valladolid');


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
INSERT INTO public."SCHEDULES" VALUES (56, 4, 8, 25, '13:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (57, 4, 8, 31, '8:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (58, 4, 8, 7, '8:00', '13:30', '');
INSERT INTO public."SCHEDULES" VALUES (59, 5, 8, 27, '14:30', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (60, 5, 8, 6, '9:30', '12:30', '');
INSERT INTO public."SCHEDULES" VALUES (61, 6, 8, 25, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (62, 6, 8, 25, '14:00', '18:30', '');
INSERT INTO public."SCHEDULES" VALUES (63, 6, 8, 6, '9:30', '12:30', '');
INSERT INTO public."SCHEDULES" VALUES (64, 7, 8, 1, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (65, 7, 8, 27, '9:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (66, 7, 8, 27, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (67, 7, 8, 6, '8:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (68, 8, 8, 26, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (69, 9, 8, 25, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (70, 9, 8, 25, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (71, 9, 8, 6, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (72, 9, 8, 6, '14:00', '16:00', '');
INSERT INTO public."SCHEDULES" VALUES (73, 10, 8, 25, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (74, 10, 8, 25, '15:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (75, 10, 8, 6, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (76, 10, 8, 6, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (77, 11, 8, 27, '13:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (78, 11, 8, 6, '8:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (79, 12, 8, 27, '13:30', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (80, 12, 8, 6, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (81, 13, 8, 1, '9:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (82, 13, 8, 27, '9:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (83, 14, 8, 27, '13:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (84, 14, 8, 6, '8:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (85, 15, 8, 26, '14:00', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (86, 15, 8, 2, '9:30', '12:30', '');
INSERT INTO public."SCHEDULES" VALUES (87, 15, 8, 3, '9:30', '12:30', '');
INSERT INTO public."SCHEDULES" VALUES (88, 15, 8, 5, '9:30', '12:30', '');
INSERT INTO public."SCHEDULES" VALUES (89, 16, 8, 27, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (90, 16, 8, 27, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (91, 16, 8, 6, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (92, 17, 8, 25, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (93, 17, 8, 6, '8:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (94, 18, 8, 25, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (95, 18, 8, 25, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (96, 18, 8, 6, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (97, 19, 8, 1, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (98, 19, 8, 3, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (99, 19, 8, 5, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (100, 19, 8, 2, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (101, 19, 8, 4, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (102, 20, 8, 25, '13:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (103, 20, 8, 6, '8:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (104, 21, 8, 27, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (105, 21, 8, 6, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (106, 22, 8, 25, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (107, 22, 8, 25, '15:00', '19:00', '');
INSERT INTO public."SCHEDULES" VALUES (108, 22, 8, 6, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (109, 22, 8, 6, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (110, 23, 8, 26, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (111, 23, 8, 2, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (112, 23, 8, 4, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (113, 23, 8, 5, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (114, 23, 8, 6, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (115, 24, 8, 25, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (116, 24, 8, 6, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (117, 25, 8, 28, '15:00', '19:00', '');
INSERT INTO public."SCHEDULES" VALUES (118, 26, 8, 27, '9:30', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (119, 26, 8, 27, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (120, 27, 8, 25, '8:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (121, 27, 8, 25, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (122, 27, 8, 6, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (123, 28, 8, 25, '2:00', '19:00', '');
INSERT INTO public."SCHEDULES" VALUES (124, 28, 8, 6, '10:00', '15:00', '');
INSERT INTO public."SCHEDULES" VALUES (125, 29, 8, 25, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (126, 29, 8, 25, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (127, 29, 8, 6, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (128, 30, 8, 27, '14:00', '16:30', '');
INSERT INTO public."SCHEDULES" VALUES (129, 30, 8, 6, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (130, 31, 8, 1, '13:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (131, 31, 8, 2, '13:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (132, 31, 8, 4, '13:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (133, 31, 8, 5, '13:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (134, 31, 8, 6, '13:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (135, 32, 8, 27, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (136, 32, 8, 27, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (137, 32, 8, 6, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (138, 33, 8, 28, '15:30', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (139, 34, 8, 25, '9:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (140, 34, 8, 25, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (141, 34, 8, 6, '9:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (142, 34, 8, 6, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (143, 36, 8, 27, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (144, 37, 8, 26, '10:00', '12:30', '');
INSERT INTO public."SCHEDULES" VALUES (145, 37, 8, 26, '13:30', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (146, 38, 8, 27, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (147, 38, 8, 27, '14:00', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (148, 38, 8, 6, '8:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (149, 38, 8, 7, '8:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (150, 40, 8, 25, '9:00', '12:30', '');
INSERT INTO public."SCHEDULES" VALUES (151, 40, 8, 25, '13:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (152, 41, 8, 4, '16:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (153, 41, 8, 5, '16:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (154, 42, 8, 27, '9:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (155, 42, 8, 27, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (156, 44, 8, 27, '12:00', '16:30', '');
INSERT INTO public."SCHEDULES" VALUES (157, 45, 8, 25, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (158, 46, 8, 27, '9:00', '12:30', '');
INSERT INTO public."SCHEDULES" VALUES (159, 46, 8, 27, '14:00', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (160, 46, 8, 6, '9:00', '12:30', '');
INSERT INTO public."SCHEDULES" VALUES (161, 47, 8, 28, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (162, 47, 8, 28, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (163, 48, 8, 25, '15:30', '19:00', '');
INSERT INTO public."SCHEDULES" VALUES (164, 48, 8, 6, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (165, 49, 8, 27, '13:30', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (166, 49, 8, 6, '8:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (167, 50, 8, 26, '9:30', '14:30', '');
INSERT INTO public."SCHEDULES" VALUES (168, 51, 8, 28, '8:30', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (169, 51, 8, 28, '14:30', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (170, 51, 8, 7, '6:30', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (171, 51, 8, 7, '17:00', '19:00', '');
INSERT INTO public."SCHEDULES" VALUES (172, 52, 8, 25, '9:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (173, 52, 8, 25, '14:00', '16:00', '');
INSERT INTO public."SCHEDULES" VALUES (174, 52, 8, 6, '8:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (175, 53, 8, 28, '14:00', '19:00', '');
INSERT INTO public."SCHEDULES" VALUES (176, 54, 8, 27, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (177, 54, 8, 27, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (178, 54, 8, 6, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (179, 56, 8, 27, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (180, 56, 8, 6, '8:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (181, 57, 8, 27, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (182, 57, 8, 26, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (183, 58, 8, 28, '14:00', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (184, 59, 8, 1, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (185, 59, 8, 27, '10:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (186, 59, 8, 27, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (187, 60, 8, 25, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (188, 60, 8, 25, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (189, 60, 8, 6, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (190, 61, 8, 26, '8:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (191, 61, 8, 1, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (192, 61, 8, 2, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (193, 61, 8, 4, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (194, 61, 8, 5, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (195, 62, 8, 25, '13:00', '16:00', '');
INSERT INTO public."SCHEDULES" VALUES (196, 62, 8, 6, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (197, 63, 8, 26, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (198, 64, 8, 25, '14:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (199, 64, 8, 2, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (200, 64, 8, 3, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (201, 64, 8, 4, '10:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (202, 65, 8, 27, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (203, 65, 8, 27, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (204, 66, 8, 25, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (205, 66, 8, 6, '9:00', '13:00', '');
INSERT INTO public."SCHEDULES" VALUES (206, 67, 8, 2, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (207, 67, 8, 3, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (208, 67, 8, 4, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (209, 68, 8, 28, '9:00', '12:00', '');
INSERT INTO public."SCHEDULES" VALUES (210, 68, 8, 28, '14:00', '18:00', '');
INSERT INTO public."SCHEDULES" VALUES (211, 4, 9, 1, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (212, 4, 9, 2, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (213, 4, 9, 2, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (214, 4, 9, 3, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (215, 4, 9, 4, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (216, 4, 9, 5, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (217, 4, 9, 6, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (218, 4, 9, 6, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (219, 4, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (220, 4, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (221, 4, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (222, 4, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (223, 4, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (224, 5, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (225, 5, 9, 7, '7:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (226, 5, 9, 7, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (227, 5, 9, 7, '12:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (228, 5, 9, 7, '17:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (229, 5, 9, 31, '5:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (230, 5, 9, 31, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (231, 5, 9, 31, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (232, 5, 9, 34, '6:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (233, 5, 9, 34, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (234, 6, 9, 28, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (235, 6, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (236, 6, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (237, 6, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (238, 6, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (239, 6, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (240, 6, 9, 31, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (241, 7, 9, 26, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (242, 7, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (243, 7, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (244, 7, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (245, 7, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (246, 7, 9, 31, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (247, 7, 9, 31, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (248, 8, 9, 26, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (249, 8, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (250, 8, 9, 7, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (251, 8, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (252, 8, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (253, 9, 9, 27, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (254, 9, 9, 7, '7:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (255, 9, 9, 7, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (256, 9, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (257, 9, 9, 31, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (258, 9, 9, 31, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (259, 10, 9, 1, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (260, 10, 9, 2, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (261, 10, 9, 2, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (262, 10, 9, 3, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (263, 10, 9, 4, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (264, 10, 9, 5, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (265, 10, 9, 6, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (266, 10, 9, 6, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (267, 10, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (268, 10, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (269, 10, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (270, 10, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (271, 10, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (272, 11, 9, 2, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (273, 11, 9, 3, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (274, 11, 9, 4, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (275, 11, 9, 5, '15:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (276, 11, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (277, 11, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (278, 11, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (279, 11, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (280, 11, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (281, 11, 9, 31, '18:00', '', 'Excepto si es lunes');
INSERT INTO public."SCHEDULES" VALUES (282, 12, 9, 28, '6:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (283, 12, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (284, 12, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (285, 12, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (286, 12, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (287, 12, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (288, 13, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (289, 13, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (290, 13, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (291, 13, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (292, 13, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (293, 13, 9, 34, '6:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (294, 13, 9, 31, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (295, 13, 9, 31, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (296, 14, 9, 27, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (297, 14, 9, 27, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (298, 14, 9, 6, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (299, 14, 9, 6, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (300, 14, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (301, 14, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (302, 14, 9, 7, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (303, 14, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (304, 14, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (305, 15, 9, 1, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (306, 15, 9, 28, '6:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (307, 15, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (308, 15, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (309, 15, 9, 7, '8:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (310, 15, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (311, 15, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (312, 15, 9, 7, '17:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (313, 15, 9, 7, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (314, 16, 9, 25, '7:00', '', 'Transmisiones virtuales por Facebook Live');
INSERT INTO public."SCHEDULES" VALUES (315, 16, 9, 25, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (316, 16, 9, 1, '11:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (317, 16, 9, 4, '11:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (318, 16, 9, 6, '7:00', '', 'Transmisiones virtuales por Facebook Live');
INSERT INTO public."SCHEDULES" VALUES (319, 16, 9, 6, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (320, 16, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (321, 16, 9, 7, '8:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (322, 16, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (323, 16, 9, 7, '11:30', '', 'Transmisiones virtuales por Facebook Live');
INSERT INTO public."SCHEDULES" VALUES (324, 16, 9, 7, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (325, 16, 9, 7, '17:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (326, 16, 9, 7, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (327, 17, 9, 2, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (328, 17, 9, 2, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (329, 17, 9, 6, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (330, 17, 9, 6, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (331, 17, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (332, 17, 9, 7, '8:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (333, 17, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (334, 17, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (335, 17, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (336, 18, 9, 25, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (337, 18, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (338, 18, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (339, 18, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (340, 18, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (341, 18, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (342, 19, 9, 25, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (343, 19, 9, 6, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (344, 19, 9, 7, '8:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (345, 19, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (346, 19, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (347, 20, 9, 1, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (348, 20, 9, 2, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (349, 20, 9, 4, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (350, 20, 9, 5, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (351, 20, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (352, 20, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (353, 20, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (354, 20, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (355, 20, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (356, 20, 9, 31, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (357, 20, 9, 31, '15:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (358, 20, 9, 31, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (359, 21, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (360, 21, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (361, 21, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (362, 21, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (363, 21, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (364, 22, 9, 26, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (365, 22, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (366, 22, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (367, 22, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (368, 22, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (369, 22, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (370, 23, 9, 26, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (371, 23, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (372, 23, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (373, 23, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (374, 23, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (375, 24, 9, 26, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (376, 24, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (377, 24, 9, 7, '11:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (378, 24, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (379, 24, 9, 7, '8:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (380, 24, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (381, 24, 9, 34, '6:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (382, 24, 9, 31, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (383, 24, 9, 31, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (384, 25, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (385, 25, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (386, 25, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (387, 25, 9, 7, '11:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (388, 25, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (389, 25, 9, 7, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (390, 26, 9, 2, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (391, 26, 9, 3, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (392, 26, 9, 3, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (393, 26, 9, 4, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (394, 26, 9, 4, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (395, 26, 9, 5, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (396, 26, 9, 5, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (397, 26, 9, 6, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (398, 26, 9, 6, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (399, 26, 9, 7, '7:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (400, 26, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (401, 26, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (402, 26, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (403, 26, 9, 7, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (404, 27, 9, 28, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (405, 27, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (406, 27, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (407, 27, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (408, 27, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (409, 27, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (410, 28, 9, 1, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (411, 28, 9, 1, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (412, 28, 9, 27, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (413, 28, 9, 6, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (414, 28, 9, 6, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (415, 28, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (416, 28, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (417, 28, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (418, 28, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (419, 28, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (420, 28, 9, 7, '10:00', '', 'Centro Comercial Tintal Plaza');
INSERT INTO public."SCHEDULES" VALUES (421, 29, 9, 26, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (422, 29, 9, 26, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (423, 29, 9, 27, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (424, 29, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (425, 29, 9, 7, '9:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (426, 29, 9, 7, '11:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (427, 29, 9, 7, '12:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (428, 29, 9, 7, '16:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (429, 29, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (430, 29, 9, 7, '8:00', '', 'Sector Carlos Lleras');
INSERT INTO public."SCHEDULES" VALUES (431, 29, 9, 7, '9:30', '', 'Sector Reservas');
INSERT INTO public."SCHEDULES" VALUES (432, 29, 9, 7, '11:00', '', 'Centro Comercial Salitre Plaza');
INSERT INTO public."SCHEDULES" VALUES (433, 29, 9, 7, '12:00', '', 'Sector Alameiras');
INSERT INTO public."SCHEDULES" VALUES (434, 30, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (435, 30, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (436, 30, 9, 7, '11:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (437, 30, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (438, 31, 9, 33, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (439, 31, 9, 33, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (440, 31, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (441, 31, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (442, 31, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (443, 31, 9, 7, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (444, 32, 9, 27, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (445, 32, 9, 27, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (446, 32, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (447, 32, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (448, 32, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (449, 32, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (450, 32, 9, 7, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (451, 32, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (452, 32, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (453, 32, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (454, 33, 9, 28, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (455, 33, 9, 28, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (456, 33, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (457, 33, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (458, 33, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (459, 33, 9, 7, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (460, 34, 9, 26, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (461, 34, 9, 4, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (462, 34, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (463, 34, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (464, 34, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (465, 34, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (466, 35, 9, 32, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (467, 35, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (468, 35, 9, 2, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (469, 35, 9, 31, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (470, 35, 9, 31, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (471, 35, 9, 35, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (472, 35, 9, 34, '6:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (473, 35, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (474, 35, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (475, 35, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (476, 35, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (477, 36, 9, 26, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (478, 36, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (479, 36, 9, 7, '11:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (480, 36, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (481, 37, 9, 1, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (482, 37, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (483, 37, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (484, 37, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (485, 37, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (486, 37, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (487, 37, 9, 35, '15:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (488, 37, 9, 34, '6:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (489, 37, 9, 31, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (490, 37, 9, 31, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (491, 38, 9, 27, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (492, 38, 9, 27, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (493, 38, 9, 6, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (494, 38, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (495, 38, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (496, 38, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (497, 38, 9, 7, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (498, 38, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (499, 38, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (500, 39, 9, 1, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (501, 39, 9, 27, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (502, 39, 9, 27, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (503, 39, 9, 6, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (504, 39, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (505, 39, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (506, 39, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (507, 39, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (508, 39, 9, 7, '17:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (509, 40, 9, 1, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (510, 40, 9, 28, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (511, 40, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (512, 40, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (513, 40, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (514, 40, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (515, 41, 9, 1, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (516, 41, 9, 2, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (517, 41, 9, 4, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (518, 41, 9, 5, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (519, 41, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (520, 41, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (521, 41, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (522, 41, 9, 7, '11:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (523, 41, 9, 7, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (524, 41, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (525, 42, 9, 26, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (526, 42, 9, 7, '7:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (527, 42, 9, 7, '9:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (528, 42, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (529, 42, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (530, 43, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (531, 43, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (532, 43, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (533, 43, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (534, 43, 9, 7, '17:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (535, 43, 9, 7, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (536, 44, 9, 26, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (537, 44, 9, 7, '6:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (538, 44, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (539, 44, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (540, 44, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (541, 44, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (542, 44, 9, 7, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (543, 45, 9, 31, '11:00', '', 'Centro Comercial El Eden piso 3 Local 3092');
INSERT INTO public."SCHEDULES" VALUES (544, 45, 9, 31, '18:00', '', 'Centro Comercial Bazzar Local 201');
INSERT INTO public."SCHEDULES" VALUES (545, 45, 9, 25, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (546, 45, 9, 7, '9:30', '', 'Centro Comercial El Eden piso 3 Local 3092');
INSERT INTO public."SCHEDULES" VALUES (547, 45, 9, 7, '11:00', '', 'Centro Comercial El Eden piso 3 Local 3092');
INSERT INTO public."SCHEDULES" VALUES (548, 45, 9, 7, '18:00', '', 'Centro Comercial El Eden piso 3 Local 3092');
INSERT INTO public."SCHEDULES" VALUES (549, 45, 9, 7, '12:00', '', 'Centro comercial Bazaar');
INSERT INTO public."SCHEDULES" VALUES (550, 46, 9, 1, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (551, 46, 9, 28, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (552, 46, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (553, 46, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (554, 46, 9, 7, '8:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (555, 46, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (556, 46, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (557, 46, 9, 7, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (558, 46, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (559, 46, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (560, 47, 9, 25, '7:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (561, 47, 9, 25, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (562, 47, 9, 6, '7:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (563, 47, 9, 6, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (564, 47, 9, 6, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (565, 47, 9, 7, '8:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (566, 47, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (567, 47, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (568, 47, 9, 7, '17:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (569, 47, 9, 7, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (570, 48, 9, 26, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (571, 48, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (572, 48, 9, 7, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (573, 48, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (574, 48, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (575, 48, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (576, 48, 9, 7, '9:30', '', 'Parque Girasoles porvenir');
INSERT INTO public."SCHEDULES" VALUES (577, 48, 9, 7, '11:00', '', 'Centro Comercial Trebolis el Porvenir');
INSERT INTO public."SCHEDULES" VALUES (578, 49, 9, 25, '13:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (579, 49, 9, 25, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (580, 49, 9, 6, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (581, 49, 9, 6, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (582, 49, 9, 31, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (583, 49, 9, 31, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (584, 49, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (585, 49, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (586, 49, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (587, 49, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (588, 50, 9, 33, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (589, 50, 9, 33, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (590, 50, 9, 3, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (591, 50, 9, 26, '7:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (592, 50, 9, 31, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (593, 50, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (594, 50, 9, 7, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (595, 50, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (596, 50, 9, 7, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (597, 50, 9, 7, '17:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (598, 51, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (599, 51, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (600, 51, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (601, 51, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (602, 51, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (603, 52, 9, 26, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (604, 52, 9, 26, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (605, 52, 9, 7, '7:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (606, 52, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (607, 52, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (608, 52, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (609, 52, 9, 7, '19:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (610, 53, 9, 27, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (611, 53, 9, 27, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (612, 53, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (613, 53, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (614, 53, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (615, 53, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (616, 53, 9, 7, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (617, 54, 9, 26, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (618, 54, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (619, 54, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (620, 54, 9, 7, '10:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (621, 54, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (622, 54, 9, 7, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (623, 54, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (624, 56, 9, 28, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (625, 56, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (626, 56, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (627, 56, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (628, 56, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (629, 57, 9, 26, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (630, 57, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (631, 57, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (632, 57, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (633, 57, 9, 7, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (634, 58, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (635, 58, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (636, 58, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (637, 58, 9, 7, '11:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (638, 58, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (639, 59, 9, 25, '18:00', '', 'Capilla Santa Laura Montoya Sótano 1 C.c. Multiplaza. Viernes virtual canal youtube Arnoby Alvarez ');
INSERT INTO public."SCHEDULES" VALUES (640, 59, 9, 6, '18:00', '', 'Capilla Santa Laura Montoya Sótano 1 C.c. Multiplaza ');
INSERT INTO public."SCHEDULES" VALUES (641, 59, 9, 7, '7:00', '', 'Capilla La inmaculada concepción Centro Comercial Meridiano 13 ');
INSERT INTO public."SCHEDULES" VALUES (642, 59, 9, 7, '9:00', '', 'Conjuntos del Sector de los Tres Elefantes ');
INSERT INTO public."SCHEDULES" VALUES (643, 59, 9, 7, '10:30', '', 'Centro Comercial Meridiano 13 del Este');
INSERT INTO public."SCHEDULES" VALUES (644, 59, 9, 7, '11:30', '', 'Centro Comercial Multiplaza frente a Falabella');
INSERT INTO public."SCHEDULES" VALUES (645, 59, 9, 7, '17:00', '', 'Capilla La inmaculada concepción Centro Comercial Meridiano 13 ');
INSERT INTO public."SCHEDULES" VALUES (646, 60, 9, 33, '18:00', '', 'Festivos no hay eucaristía');
INSERT INTO public."SCHEDULES" VALUES (647, 60, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (648, 60, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (649, 60, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (650, 60, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (651, 61, 9, 32, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (652, 61, 9, 32, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (653, 61, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (654, 61, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (655, 61, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (656, 61, 9, 7, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (657, 61, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (658, 62, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (659, 62, 9, 7, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (660, 62, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (661, 62, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (662, 62, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (663, 63, 9, 26, '18:00', '', 'Lunes festivos no hay eucaristía');
INSERT INTO public."SCHEDULES" VALUES (664, 63, 9, 31, '15:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (665, 63, 9, 31, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (666, 63, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (667, 63, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (668, 63, 9, 7, '11:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (669, 63, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (670, 64, 9, 1, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (671, 64, 9, 1, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (672, 64, 9, 28, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (673, 64, 9, 28, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (674, 64, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (675, 64, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (676, 64, 9, 7, '9:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (677, 64, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (678, 64, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (679, 65, 9, 1, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (680, 65, 9, 28, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (681, 65, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (682, 65, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (683, 65, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (684, 65, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (685, 65, 9, 7, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (686, 65, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (687, 65, 9, 31, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (688, 65, 9, 31, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (689, 65, 9, 31, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (690, 65, 9, 35, '17:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (691, 66, 9, 27, '18:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (692, 66, 9, 6, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (693, 66, 9, 34, '8:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (694, 66, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (695, 66, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (696, 66, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (697, 66, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (698, 68, 9, 28, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (699, 68, 9, 7, '7:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (700, 68, 9, 7, '10:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (701, 68, 9, 7, '12:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (702, 68, 9, 7, '16:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (703, 68, 9, 7, '18:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (704, 4, 10, 25, '17:00', '', 'Tambien puede solicitar cita con sacerdote');
INSERT INTO public."SCHEDULES" VALUES (705, 5, 10, 4, '15:00', '', '');
INSERT INTO public."SCHEDULES" VALUES (706, 13, 10, 28, '17:00', '18:00', 'Antes de misa de 6pm');
INSERT INTO public."SCHEDULES" VALUES (707, 23, 10, 27, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (708, 28, 10, 27, '15:00', '17:00', '');
INSERT INTO public."SCHEDULES" VALUES (709, 34, 10, 26, '18:00', '', 'Durante las eucaristías');
INSERT INTO public."SCHEDULES" VALUES (710, 34, 10, 4, '17:00', '', 'Durante las eucaristías');
INSERT INTO public."SCHEDULES" VALUES (711, 34, 10, 7, '8:00', '', 'Durante las eucaristías');
INSERT INTO public."SCHEDULES" VALUES (712, 34, 10, 7, '10:00', '', 'Durante las eucaristías');
INSERT INTO public."SCHEDULES" VALUES (713, 34, 10, 7, '12:00', '', 'Durante las eucaristías');
INSERT INTO public."SCHEDULES" VALUES (714, 34, 10, 7, '17:00', '', 'Durante las eucaristías');
INSERT INTO public."SCHEDULES" VALUES (715, 51, 10, 4, '15:30', '', '');
INSERT INTO public."SCHEDULES" VALUES (716, 54, 10, 27, '18:00', '18:30', '');
INSERT INTO public."SCHEDULES" VALUES (717, 66, 10, 2, '15:00', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (718, 66, 10, 3, '15:00', '17:30', '');
INSERT INTO public."SCHEDULES" VALUES (719, 66, 10, 4, '15:00', '17:30', '');


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

SELECT pg_catalog.setval('public."DOMAIN_VALUES_ID_DOMAIN_VALUE_seq"', 35, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 220
-- Name: LINKS_ID_LINK_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LINKS_ID_LINK_seq"', 150, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 222
-- Name: LOCATIONS_ID_LOCATION_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LOCATIONS_ID_LOCATION_seq"', 12, true);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 224
-- Name: SCHEDULES_ID_SCHEDULE_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SCHEDULES_ID_SCHEDULE_seq"', 719, true);


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


-- Completed on 2024-09-26 23:22:03

--
-- PostgreSQL database dump complete
--

