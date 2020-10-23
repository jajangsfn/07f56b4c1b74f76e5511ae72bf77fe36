--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Ubuntu 13.0-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.0 (Ubuntu 13.0-1.pgdg20.04+1)

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
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens (
    access_token character varying(40) NOT NULL,
    client_id character varying(80) NOT NULL,
    user_id character varying(80),
    expires timestamp without time zone NOT NULL,
    scope character varying(4000)
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_clients (
    client_id character varying(80) NOT NULL,
    client_secret character varying(80),
    redirect_uri character varying(2000),
    grant_types character varying(80),
    scope character varying(4000),
    user_id character varying(80)
);


ALTER TABLE public.oauth_clients OWNER TO postgres;

--
-- Name: oauth_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_email (
    id integer NOT NULL,
    user_id integer,
    destination character varying(50),
    msg_body text,
    created_date timestamp(0) without time zone,
    updated_date timestamp(0) without time zone
);


ALTER TABLE public.oauth_email OWNER TO postgres;

--
-- Name: oauth_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.oauth_email ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.oauth_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: oauth_scopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_scopes (
    scope character varying(80) NOT NULL,
    is_default boolean
);


ALTER TABLE public.oauth_scopes OWNER TO postgres;

--
-- Name: oauth_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_users (
    username character varying(80) NOT NULL,
    password character varying(80),
    first_name character varying(80),
    last_name character varying(80),
    email character varying(80),
    email_verified boolean,
    scope character varying(4000),
    id integer NOT NULL
);


ALTER TABLE public.oauth_users OWNER TO postgres;

--
-- Name: oauth_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.oauth_users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.oauth_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) FROM stdin;
be74b7908b86b9914211b14c81cd196f5ebfbacb	testclient	\N	2020-10-23 09:58:21	\N
fccbf46cedf980cffe6952649956427de2dff2f5	testclient	\N	2020-10-23 09:58:59	\N
1cec8dfab906b6052c882e04318ab81d2dda495c	testclient	\N	2020-10-23 09:59:32	\N
371ec1ce71c2e73b2fd0cadaeef993cfca2461db	testclient	\N	2020-10-23 10:00:06	\N
a06eb3392d873445666371a48adf16c2bfc4ac31	testclient	\N	2020-10-23 10:03:13	\N
2adb2d4efa562b465751fd090239539564e7fda6	testclient	\N	2020-10-23 10:08:15	\N
6ce265a0156425cfccea338240f8623cbd67ebcf	testclient	\N	2020-10-23 10:09:06	\N
313d616da52d04532d6c94eef154d51f268175a0	testclient	\N	2020-10-23 10:09:25	\N
51c645eafdbd571bf42943aaf30216eea568eeef	testclient	\N	2020-10-23 10:42:28	\N
3c33a1e9405daa1506f9ecd45a0a2684eeb75dc1	testclient	\N	2020-10-23 11:37:03	\N
c1665e1bc3a406a2d8de6f989a6acb221b3dc775	testclient	\N	2020-10-23 11:37:45	\N
ff14cdda237294e7733e14f3effa2f693f7ba375	testclient	\N	2020-10-23 11:38:15	\N
b3707b8af928283f42d06798502e8f453d9d4a9d	testclient	\N	2020-10-23 11:38:32	\N
b4e614764adab3f63c616ac3b806416900954661	testclient	\N	2020-10-23 11:38:45	\N
63e1310f2a30f0162f75902f3f83f28e194abef3	testclient	\N	2020-10-23 11:39:04	\N
ecec11b9236dda7e00daa4b3fd32126c5b27c5c3	testclient	\N	2020-10-23 11:41:03	\N
6c5827679f5cd6b13f1762119ab49b0e1cac46f5	testclient	\N	2020-10-23 11:41:52	\N
2a1b0dd17ca337e3dfdae922937b9b883155c352	testclient	\N	2020-10-23 11:42:09	\N
a4242e15d9f83efa9eb0d3baaa219fc9ce26d8ff	testclient	\N	2020-10-23 11:47:41	\N
4a4397df0dff1ce964df29a2bd4baf388d99ac79	testclient	\N	2020-10-23 11:48:09	\N
12da821de88c699349d4fedaa6e4c17301c91643	testclient	\N	2020-10-23 11:48:45	\N
7c489c7022b2832e6756da7f976f7de8fddc01d1	testclient	\N	2020-10-23 11:48:55	\N
a15789699f0303b51bce411d8ac63bd48e0b6c6e	testclient	\N	2020-10-23 11:49:02	\N
02c04b2f09da26ea191ffb58b06878e10e878340	testclient	\N	2020-10-23 11:49:13	\N
17b623f1a690a993188d70de6bc79487197b4b0d	testclient	\N	2020-10-23 11:49:52	\N
83712859953241fd38cc41d6bd5e9ca2b4b15500	testclient	\N	2020-10-23 11:50:26	\N
d5e29a06cb23ab809a15633fc4dd2842497781d1	testclient	\N	2020-10-23 11:50:56	\N
8073f56975aa7b09765d44fb8e54819ddf48bcd7	testclient	\N	2020-10-23 11:51:43	\N
1c140785a99ab65cbb1fe916811bcfa88e88f31a	testclient	\N	2020-10-23 11:53:48	\N
e3dd19546b98fc6ba5f318915558a1c2e31ef2ac	testclient	\N	2020-10-23 11:55:29	\N
639d157eb362ea3840334a1de9f79b9fd331b96b	testclient	\N	2020-10-23 11:56:43	\N
aae6caa1dddaa5c1dc5eac5fa6f8c23f4bc95cb4	testclient	\N	2020-10-23 11:59:32	\N
900fc0d800ba83dc552aa641c51abcc84b085a17	testclient	\N	2020-10-23 12:00:28	\N
37a9e5aacd9c0f1e3d8dab0cd39cae95b97b51eb	testclient	\N	2020-10-23 12:00:32	\N
4c29b77c4ca0b8f2406e1cb998798f88551ceec5	testclient	\N	2020-10-23 12:00:42	\N
a703246483d00711badaca9a632de7f746c706d9	testclient	\N	2020-10-23 12:01:55	\N
f060f11039f3a446d7d756094bb946f6ad4d6660	testclient	\N	2020-10-23 12:03:26	\N
6639824f1628b0309497f5f2a28b60af1383374c	testclient	\N	2020-10-23 12:04:43	\N
b4f2fd64bbf4d5db0a2c4eb9c4cdde1f3f3d133f	testclient	\N	2020-10-23 12:04:56	\N
ea40da76796e0461b8859be1183be08e949dc80d	testclient	\N	2020-10-23 12:05:23	\N
b9d79d0d850081fbf30caa4ea7703833af46970b	testclient	\N	2020-10-23 12:08:45	\N
9d6310df90b84a620ab2e13dadcfa999e20662bb	testclient	\N	2020-10-23 12:08:55	\N
8d21840f15de2bca2d14942234fd3d150db07ceb	testclient	\N	2020-10-23 12:11:58	\N
9f53babad6545be9f2762e57beb601f6a0d6ca32	testclient	\N	2020-10-23 12:16:35	\N
5631b4e23f621b8f21d7417aca349dfbf4334e98	testclient	\N	2020-10-23 12:29:08	\N
71fa6dd4e6bf61a328f29aab3d1412f9dc54b0f4	testclient	\N	2020-10-23 12:29:30	\N
de23c6e08c1ada4f2b4a1402923b400120cd816e	testclient	\N	2020-10-23 12:34:55	\N
956b2d6c4a5392215edc1083f81189e78caf9aab	testclient	\N	2020-10-23 12:46:18	\N
e8e6c5a1490cfbe3d18d4d6a04ae00a29f2a4511	testclient	\N	2020-10-23 12:46:35	\N
b062e010b18cc6ebf8fb54f00d64f289a2b64d46	testclient	\N	2020-10-23 12:46:43	\N
0a5a83da2be178653310258edbf83ba478cc9a13	testclient	\N	2020-10-23 16:16:25	\N
754e05ea15be9184491653e20b783c703fcc9896	testclient	\N	2020-10-23 16:16:58	\N
8f6b2d8d4acf95a8fe6154e547ac497230f598f8	testclient	\N	2020-10-23 16:17:45	\N
45ef61539fe8e9be5b255926901c5e536078aae7	testclient	\N	2020-10-23 16:19:30	\N
fef77457e22826b4b5ce3af7fca279c6f99019da	testclient	\N	2020-10-23 16:19:41	\N
135cf6e5008862d7dbb8ae8d4356bf3d8f1b288a	testclient	\N	2020-10-23 16:19:49	\N
7d9b4ac6d9a78239e48889fd16643e68a41e98f2	testclient	\N	2020-10-23 16:20:00	\N
d1196344c81050896f62101d1fbee4b7ead45242	testclient	\N	2020-10-23 16:20:07	\N
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_clients (client_id, client_secret, redirect_uri, grant_types, scope, user_id) FROM stdin;
testclient	testpass	http:\\\\www.fake.com	\N	\N	\N
\.


--
-- Data for Name: oauth_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_email (id, user_id, destination, msg_body, created_date, updated_date) FROM stdin;
3	4	jajangsofian537@yahoo.com	contoh 2	2020-10-23 11:46:49	2020-10-23 11:46:49
4	4	jajangsofian537@yahoo.com	contoh 2	2020-10-23 15:19:56	2020-10-23 15:19:56
5	4	jajangsofian537@yahoo.com	contoh 2	2020-10-23 15:20:13	2020-10-23 15:20:13
\.


--
-- Data for Name: oauth_scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_scopes (scope, is_default) FROM stdin;
\.


--
-- Data for Name: oauth_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_users (username, password, first_name, last_name, email, email_verified, scope, id) FROM stdin;
testaja	$2y$10$as0XQcZkBO.ijEJbwTMCfOUjEJxgnWu8QlDiC3u/wyTI5myMNDkri	test	aja	testaja@gmail.com	\N	\N	4
\.


--
-- Name: oauth_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_email_id_seq', 5, true);


--
-- Name: oauth_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_users_id_seq', 5, true);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (access_token);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (client_id);


--
-- Name: oauth_scopes oauth_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_scopes
    ADD CONSTRAINT oauth_scopes_pkey PRIMARY KEY (scope);


--
-- Name: oauth_users oauth_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_users
    ADD CONSTRAINT oauth_users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

