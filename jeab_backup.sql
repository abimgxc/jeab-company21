--
-- PostgreSQL database dump
--

\restrict P37rDaHG1ioa4L6PBog8Dbkq4AsSCYvcraaNihNAHIe9tInNooOLUr5PiqCalc2

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id bigint NOT NULL,
    tipo_cliente character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    dui character varying(255),
    nit character varying(255),
    giro character varying(255),
    archivo_iva text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT clientes_tipo_cliente_check CHECK (((tipo_cliente)::text = ANY ((ARRAY['particular'::character varying, 'empresa'::character varying])::text[])))
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: indicadors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indicadors (
    id bigint NOT NULL,
    cifra character varying(255) NOT NULL,
    texto character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.indicadors OWNER TO postgres;

--
-- Name: indicadors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.indicadors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.indicadors_id_seq OWNER TO postgres;

--
-- Name: indicadors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.indicadors_id_seq OWNED BY public.indicadors.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: proyecto_imagens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proyecto_imagens (
    id bigint NOT NULL,
    proyecto_id bigint NOT NULL,
    ruta_foto character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.proyecto_imagens OWNER TO postgres;

--
-- Name: proyecto_imagens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proyecto_imagens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proyecto_imagens_id_seq OWNER TO postgres;

--
-- Name: proyecto_imagens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proyecto_imagens_id_seq OWNED BY public.proyecto_imagens.id;


--
-- Name: proyectos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proyectos (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    ubicacion character varying(255) NOT NULL,
    fecha_ejecucion date NOT NULL,
    descripcion text NOT NULL,
    user_id bigint,
    imagen character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.proyectos OWNER TO postgres;

--
-- Name: proyectos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proyectos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proyectos_id_seq OWNER TO postgres;

--
-- Name: proyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proyectos_id_seq OWNED BY public.proyectos.id;


--
-- Name: servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicios (
    id bigint NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    icono character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.servicios OWNER TO postgres;

--
-- Name: servicios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicios_id_seq OWNER TO postgres;

--
-- Name: servicios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicios_id_seq OWNED BY public.servicios.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: testimonios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testimonios (
    id bigint NOT NULL,
    nombre_cliente character varying(255) NOT NULL,
    empresa character varying(255),
    tipo_proyecto character varying(255) NOT NULL,
    comentario text NOT NULL,
    calificacion smallint NOT NULL,
    aprobado boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.testimonios OWNER TO postgres;

--
-- Name: testimonios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.testimonios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.testimonios_id_seq OWNER TO postgres;

--
-- Name: testimonios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.testimonios_id_seq OWNED BY public.testimonios.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'cliente'::character varying NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    rol character varying(255) DEFAULT 'user'::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visitas_tecnicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visitas_tecnicas (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    correo character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    responsable character varying(255) NOT NULL,
    ubicacion text NOT NULL,
    fecha date NOT NULL,
    hora time(0) without time zone NOT NULL,
    tipo_inmueble character varying(255) NOT NULL,
    servicio character varying(255) NOT NULL,
    descripcion text,
    foto character varying(255),
    estado character varying(255) DEFAULT 'Pendiente'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT visitas_tecnicas_estado_check CHECK (((estado)::text = ANY ((ARRAY['Pendiente'::character varying, 'Confirmada'::character varying, 'Realizada'::character varying, 'Cancelada'::character varying])::text[])))
);


ALTER TABLE public.visitas_tecnicas OWNER TO postgres;

--
-- Name: visitas_tecnicas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visitas_tecnicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visitas_tecnicas_id_seq OWNER TO postgres;

--
-- Name: visitas_tecnicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visitas_tecnicas_id_seq OWNED BY public.visitas_tecnicas.id;


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: indicadors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicadors ALTER COLUMN id SET DEFAULT nextval('public.indicadors_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: proyecto_imagens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyecto_imagens ALTER COLUMN id SET DEFAULT nextval('public.proyecto_imagens_id_seq'::regclass);


--
-- Name: proyectos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos ALTER COLUMN id SET DEFAULT nextval('public.proyectos_id_seq'::regclass);


--
-- Name: servicios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios ALTER COLUMN id SET DEFAULT nextval('public.servicios_id_seq'::regclass);


--
-- Name: testimonios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonios ALTER COLUMN id SET DEFAULT nextval('public.testimonios_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visitas_tecnicas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas_tecnicas ALTER COLUMN id SET DEFAULT nextval('public.visitas_tecnicas_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, tipo_cliente, nombre, direccion, telefono, email, dui, nit, giro, archivo_iva, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: indicadors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indicadors (id, cifra, texto, created_at, updated_at) FROM stdin;
1	10+	Años de Trayectoria	2026-07-07 15:31:02	2026-07-07 15:31:02
2	150+	Proyectos Ejecutados	2026-07-07 15:31:02	2026-07-07 15:31:02
3	50+	Clientes Satisfechos	2026-07-07 15:31:02	2026-07-07 15:31:02
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2026_06_22_145447_create_servicios_table	1
5	2026_06_22_145542_create_indicadors_table	1
6	2026_06_24_032804_create_clientes_table	1
7	2026_06_24_203009_add_rol_to_users_table	1
8	2026_06_25_143808_create_proyectos_table	1
9	2026_06_25_160846_create_visita_tecnicas_table	1
10	2026_06_29_210620_create_proyecto_imagens_table	1
11	2026_07_03_030003_create_testimonios_table	1
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: proyecto_imagens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proyecto_imagens (id, proyecto_id, ruta_foto, created_at, updated_at) FROM stdin;
1	1	proyectos/galerias/bYq2lBrv1sTQsZmWSEwjZQZa3Z6uIQydJZVOx3cy.mp4	2026-07-07 16:35:18	2026-07-07 16:35:18
2	1	proyectos/galerias/1zdXEqxGvDb7bucRM5HDneBxruCxwFAhI4weiJFE.jpg	2026-07-07 16:35:18	2026-07-07 16:35:18
3	1	proyectos/galerias/zt1OpxjELJbbYmeHGIZHqogcDUwNxxoUbCH0Pkts.jpg	2026-07-07 16:35:18	2026-07-07 16:35:18
4	1	proyectos/galerias/5pfbSLlhYrtBDaanlfcwg79kqxW8joVUFvYFEwTv.jpg	2026-07-07 16:35:18	2026-07-07 16:35:18
5	2	proyectos/galerias/K4VeLzWANxCpebU5JjdlWo5fIcXZYR9MoDf08PDP.jpg	2026-07-07 16:57:27	2026-07-07 16:57:27
6	2	proyectos/galerias/63pgIM1ANlSfijRukovE66btPuF9jLrke72SX8xW.jpg	2026-07-07 16:57:27	2026-07-07 16:57:27
7	2	proyectos/galerias/rbf373umnzteKJIx2JJZEGypbcUwcv5hNxNxBduV.jpg	2026-07-07 16:57:27	2026-07-07 16:57:27
8	2	proyectos/galerias/JxYhL84P22O11uEAhh7cMJrltyr18h6by8NKjsSv.jpg	2026-07-07 16:57:27	2026-07-07 16:57:27
9	5	proyectos/galerias/mSPYEP06geiaTvnCAeRePwx0nm8QKK6KygHaIliE.jpg	2026-07-07 17:03:07	2026-07-07 17:03:07
10	5	proyectos/galerias/z2ch7jAmMEZBFSVhV4lBSQiREyXKTp1frrnNf8yY.jpg	2026-07-07 17:03:07	2026-07-07 17:03:07
11	5	proyectos/galerias/PGVmWl3vWxLud62BdKLAEJdfd5Q9I0oEpkxpnpI3.jpg	2026-07-07 17:03:07	2026-07-07 17:03:07
12	5	proyectos/galerias/vZHtauH4XpXnamBqJrFi1gTN3w2Xrs2AYnkCuGYf.jpg	2026-07-07 17:03:07	2026-07-07 17:03:07
13	5	proyectos/galerias/0qlqCJAxYyBgfiu3RmZffWwIUWumn1yv8gPhwn9g.jpg	2026-07-07 17:03:07	2026-07-07 17:03:07
14	5	proyectos/galerias/VaK6Sk5kK2rKCYBKb6pIcWCiVQP47jc1jbazmQZP.jpg	2026-07-07 17:04:20	2026-07-07 17:04:20
15	5	proyectos/galerias/uD3GyDSn2fdc5CfTu4cRZMeqx5T1VlWhtA5DhPLb.jpg	2026-07-07 17:04:20	2026-07-07 17:04:20
16	5	proyectos/galerias/0ohdJjhNqCMYuqQLW5BaeOkECZguLG9onrpXmcpm.jpg	2026-07-07 17:04:20	2026-07-07 17:04:20
17	5	proyectos/galerias/2My0mMrz99aj027Nvdhal7Bma18R5ECmOyG6z4Je.mp4	2026-07-07 17:04:20	2026-07-07 17:04:20
\.


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proyectos (id, nombre, ubicacion, fecha_ejecucion, descripcion, user_id, imagen, created_at, updated_at) FROM stdin;
1	Proyecto eléctrico residencial	Lomas de San Pedro, Metapán	2026-04-01	Instalación eléctrica residencial que incluye tablero de distribución de 16 espacios, circuitos de tomacorrientes, conmutación de luminarias e iluminación LED interior y decorativa. El proyecto fue ejecutado bajo criterios de funcionalidad, eficiencia energética, orden técnico y preparación para futuras ampliaciones.	\N	proyectos/gxcvQvtaoWJxunq6tnGiepJy9LnuYt8FsxlZVT5x.jpg	2026-07-07 16:35:18	2026-07-07 16:35:18
2	Extensión de línea de baja tensión e iluminación vial	San Sebastián Salitrillo, Santa Ana Oeste	2024-12-07	Implementación de sistema eléctrico provisional de baja tensión para proyecto de urbanización, incluyendo extensión de red, alimentación de áreas operativas e instalación de luminarias exteriores. La ejecución garantizó suministro temporal, iluminación eficiente y condiciones adecuadas para operaciones logísticas y seguridad del área de trabajo.	\N	proyectos/ngPaNEL1a7BOQCAp1v1zwxjnrFy4ux4ryMV3leqJ.jpg	2026-07-07 16:57:27	2026-07-07 16:57:27
3	Instalación eléctrica de ampliación de vivienda habitacional	Santa Ana Centro	2022-12-07	Remodelación eléctrica integral de vivienda habitacional, incluyendo actualización de tablero eléctrico, instalación de tomacorrientes, circuitos de iluminación decorativa y general, controles de conmutación y puntos dedicados para aire acondicionado. Proyecto ejecutado con enfoque en seguridad, eficiencia energética y optimización funcional de los espacios.	\N	proyectos/oFTevmUt9bY6btlZMINEZ5LMAAAe7j2xO7MbCVjm.mp4	2026-07-07 17:00:03	2026-07-07 17:00:03
5	Instalación eléctrica para bodega y centro de servicios automotrices	Urbanización San Nicolás, El Porvenir, Santa Ana Oeste	2023-02-07	Instalación eléctrica integral para bodega y centro de servicios automotrices, incluyendo iluminación industrial, tomacorrientes de 120V y 240V, punto eléctrico para bomba de cisterna, tablero de distribución de 30 circuitos y canalización mediante tubería EMT. Proyecto desarrollado para garantizar seguridad, eficiencia operativa y correcta distribución de cargas eléctricas.	\N	proyectos/Zbs4MBG4v3pa9j3V1009wmZzcz2YauIGad5R4Rh2.jpg	2026-07-07 17:03:07	2026-07-07 17:03:07
\.


--
-- Data for Name: servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicios (id, titulo, descripcion, icono, created_at, updated_at) FROM stdin;
1	Redes Eléctricas en Baja y Media Tensión	Diseño, tendido y acoplamiento estructural de líneas de distribución aérea y subterránea según normativas de seguridad.	redes-tension.jpeg	2026-07-07 15:31:02	2026-07-07 15:31:02
2	Redes de Polarización	Instalación y medición de sistemas de puesta a tierra. Precio: $75.00.	polarizacion.jpeg	2026-07-07 15:31:02	2026-07-07 15:31:02
3	Trámites con OIA y Distribuidoras	Gestión de carpetas técnicas, planos y documentación para aprobación de proyectos eléctricos.	tramites-oia.jpeg	2026-07-07 15:31:02	2026-07-07 15:31:02
4	Instalaciones Eléctricas	Montaje integral de tableros, acometidas, canalizaciones y cableado estructurado.	instalaciones.jpeg	2026-07-07 15:31:02	2026-07-07 15:31:02
5	Visita Técnica e Inspección	Evaluación técnica especializada en sitio para diagnóstico y recomendaciones.	visita-tecnica.jpeg	2026-07-07 15:31:02	2026-07-07 15:31:02
6	Mantenimientos PROEM	Programa de mantenimiento preventivo y correctivo para instalaciones eléctricas.	proem.jpeg	2026-07-07 15:31:02	2026-07-07 15:31:02
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: testimonios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testimonios (id, nombre_cliente, empresa, tipo_proyecto, comentario, calificacion, aprobado, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, role, remember_token, created_at, updated_at, rol) FROM stdin;
1	Test User	test@example.com	\N	$2y$12$z6FSezEMJXesW8sd8InYnulX38O80ZA7eGUGpKJdnkEi6CkWsA8Um	admin	\N	2026-07-07 15:16:35	2026-07-07 15:16:44	user
\.


--
-- Data for Name: visitas_tecnicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visitas_tecnicas (id, nombre, correo, telefono, responsable, ubicacion, fecha, hora, tipo_inmueble, servicio, descripcion, foto, estado, created_at, updated_at) FROM stdin;
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: indicadors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.indicadors_id_seq', 3, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);


--
-- Name: proyecto_imagens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proyecto_imagens_id_seq', 17, true);


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proyectos_id_seq', 5, true);


--
-- Name: servicios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicios_id_seq', 6, true);


--
-- Name: testimonios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.testimonios_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: visitas_tecnicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visitas_tecnicas_id_seq', 1, false);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: indicadors indicadors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicadors
    ADD CONSTRAINT indicadors_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: proyecto_imagens proyecto_imagens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyecto_imagens
    ADD CONSTRAINT proyecto_imagens_pkey PRIMARY KEY (id);


--
-- Name: proyectos proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id);


--
-- Name: servicios servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: testimonios testimonios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonios
    ADD CONSTRAINT testimonios_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visitas_tecnicas visitas_tecnicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas_tecnicas
    ADD CONSTRAINT visitas_tecnicas_pkey PRIMARY KEY (id);


--
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: proyecto_imagens proyecto_imagens_proyecto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyecto_imagens
    ADD CONSTRAINT proyecto_imagens_proyecto_id_foreign FOREIGN KEY (proyecto_id) REFERENCES public.proyectos(id) ON DELETE CASCADE;


--
-- Name: proyectos proyectos_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict P37rDaHG1ioa4L6PBog8Dbkq4AsSCYvcraaNihNAHIe9tInNooOLUr5PiqCalc2

