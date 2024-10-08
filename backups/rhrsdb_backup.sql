--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Postgres.app)
-- Dumped by pg_dump version 16.4 (Postgres.app)

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

--
-- Name: RoleName; Type: TYPE; Schema: public; Owner: peaceishimwem
--

CREATE TYPE public."RoleName" AS ENUM (
    'User',
    'Admin',
    'SuperAdmin'
);


ALTER TYPE public."RoleName" OWNER TO peaceishimwem;

--
-- Name: Status; Type: TYPE; Schema: public; Owner: peaceishimwem
--

CREATE TYPE public."Status" AS ENUM (
    'Enabled',
    'Disabled'
);


ALTER TYPE public."Status" OWNER TO peaceishimwem;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Project; Type: TABLE; Schema: public; Owner: peaceishimwem
--

CREATE TABLE public."Project" (
    id uuid NOT NULL,
    name text NOT NULL,
    team_leader text NOT NULL,
    description text NOT NULL,
    logo text NOT NULL,
    cover_image text NOT NULL,
    link text NOT NULL,
    status public."Status" DEFAULT 'Enabled'::public."Status" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    fields text[]
);


ALTER TABLE public."Project" OWNER TO peaceishimwem;

--
-- Name: Rating; Type: TABLE; Schema: public; Owner: peaceishimwem
--

CREATE TABLE public."Rating" (
    id uuid NOT NULL,
    "userId" uuid NOT NULL,
    "projectId" uuid NOT NULL,
    relevance integer NOT NULL,
    impact_to_society integer NOT NULL,
    performance integer NOT NULL,
    progress integer NOT NULL,
    feedback character varying(500),
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Rating" OWNER TO peaceishimwem;

--
-- Name: Role; Type: TABLE; Schema: public; Owner: peaceishimwem
--

CREATE TABLE public."Role" (
    id uuid NOT NULL,
    name public."RoleName" NOT NULL,
    description text NOT NULL,
    status public."Status" DEFAULT 'Enabled'::public."Status" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Role" OWNER TO peaceishimwem;

--
-- Name: User; Type: TABLE; Schema: public; Owner: peaceishimwem
--

CREATE TABLE public."User" (
    id uuid NOT NULL,
    "fullName" text NOT NULL,
    "roleId" uuid NOT NULL,
    status public."Status" DEFAULT 'Enabled'::public."Status" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    code text NOT NULL
);


ALTER TABLE public."User" OWNER TO peaceishimwem;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: peaceishimwem
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO peaceishimwem;

--
-- Data for Name: Project; Type: TABLE DATA; Schema: public; Owner: peaceishimwem
--

COPY public."Project" (id, name, team_leader, description, logo, cover_image, link, status, "createdAt", "updatedAt", fields) FROM stdin;
5e05fa88-85de-495a-8073-144d17b9b649	Agrinexa	Ineza Munyaneza Celia	AgriNexa enhances agriculture by using IoT sensors and AI to provide real-time data on soil and environmental conditions, optimizing fertilizer use and enabling remote irrigation management. Additionally, it features a security alarm system that alerts farmers of intruders via mobile notifications, ensuring efficient and secure farming operations.	/projects/logo/Agrinexa_logo_e98cd02fa81fa3ef3dbdc76ceef153a0.svg	/projects/cover/Agrinexa_cover_image_22b49a3c6a509ad0fdbf7a2264f8be68.png	https://github.com/Agrinexa-project	Enabled	2024-10-07 08:39:53.458	2024-10-07 09:36:04.858	{Agriculture}
e0fb30f0-6694-4844-8bea-c6bebf6236bd	BinexoPay	Rukundo Prince	BinexoPay is transforming transaction systems by making payments faster and more secure through biometric authentication. Using advanced fingerprint and facial recognition technology, we aim to streamline payments while ensuring top-level security and efficiency. Our goal is to set a new standard for secure, seamless transactions.	/projects/logo/Binexopay_logo_48a97947e01fb3c15d063fcaabe25bd0.svg	/projects/cover/Binexopay_cover_image_19fcc2ca1a4bbfbc3c63eb8e83d42fcc.png	https://www.rca.ac.rw/	Enabled	2024-10-07 08:44:57.758	2024-10-07 09:36:44.544	{"Financial Technology"}
504bc9dd-f083-4cad-9d99-efcb8dd942d4	ECOWATCH	ISHIMWE Lorie	Ecowatch is an innovative initiative committed to eradicating pollution in aquatic environments while revolutionizing the fishing industry and enhancing access to water resources for all citizens.\nOur state-of-the-art underwater drone is designed to empower water management companies and drive impactful change beneath the surface.\n	/projects/logo/Ecowatch_logo_c3c4da5060d44058cba415154c2b5c7e.svg	/projects/cover/Ecowatch_cover_image_a0cc8bd15059e78ccb24d4bfdb2394de.png	https://www.rca.ac.rw/	Enabled	2024-10-07 09:00:01.691	2024-10-07 09:37:50.671	{"Water environment management"}
5884cde0-91ea-452f-9432-c31326ab91ba	LabSync	NIYONSENGA Valens	LabSync is an innovative AI-driven company dedicated to solving education challenges.By enabling all the schools to do experiments virtually and reduce the expenses made while purchasing using VR.	/projects/logo/Labsync_logo_704200344d2f9d2b056ab1d4b3912bf9.svg	/projects/cover/Labsync_cover_image_b175c06d0d15fe22725eebbfb56c1c24.png	https://www.labsync.rw/	Enabled	2024-10-07 09:11:06.361	2024-10-07 09:38:08.467	{Education}
3036158f-a2f7-4cdf-8938-8b60e43ec6f6	Fosec	Umutoni Kaze Joana Michelle	FOSEC is an innovative platform designed to revolutionize agriculture\nwith real-time weather forecasts, personalized farming tips powered\nby machine learning, and secure cryptographic seals for supply chains,\nFOSEC empowers farmers, improves market access, and enhances\nfood security. We're shaping the future of farming through technology!	/projects/logo/Fosec_logo_35fb165fd355927459b269cfc3b3f0cf.svg	/projects/cover/Fosec_cover_image_f5e9058f54e207e981b46db77ba8f242.png	https://fosec.vercel.app/	Enabled	2024-10-07 09:14:05.136	2024-10-07 09:38:34.891	{Agriculture}
2afe18ca-5793-403a-b99e-cbff5865d2f0	Navigo	NDAYAMBAJE Patrick	NaviGo is an innovative AI-driven company dedicated to solving transportation challenges. We specialize in traffic management and efficient transport services, collaborating with industry leaders to enhance mobility. Harnessing AI's power, we're transforming the future of transportation.	/projects/logo/Navigo_logo_c44a2c3ef61a2483fa648de94c7a28aa.svg	/projects/cover/Navigo_cover_image_81f012961359cef0215a068a2cb4206c.png	https://navigo.rw/	Enabled	2024-10-07 08:52:10.588	2024-10-07 09:40:47.768	{Transport}
c5dd4c59-b3b2-495e-b0fe-1fdfde4f8b14	Novars	Uwase Vanessa	Novars transforms agriculture with Farm Security, Monitoring, and Automation. Powered by Embedded Systems, IoT, and AI, it delivers real-time monitoring, theft prevention, and automation, reducing labor and resource waste. Novars enhances productivity, driving higher yields and sustainable farming practices.	/projects/logo/Novars_logo_16c0c324c08adb49e0039b212de54cf9.svg	/projects/cover/Novars_cover_image_02e71eb358eaed3f25ee41b5b42b8ddd.png	http://194.164.167.131:3030/	Enabled	2024-10-07 09:18:10.82	2024-10-07 09:41:36.948	{Agriculture}
f70b7dd5-807c-45e1-81b4-7587e1c84748	Spartan	KALISA Giovanni	Spartan is a system that integrates AI technology, a companion mobile app, and a mechanical bed component to monitor and enhance the safety of infants during sleep. It Enhances child safety and peace of mind by pioneering AI-driven solutions for infant sleep, preventing SIDS and promoting healthy sleep practices.	/projects/logo/Spartan_logo_bba40975defd2a996e92fb6bc3c731a7.svg	/projects/cover/Spartan_cover_image_7a0b87946c0f4b09491a84e20c4a1b2c.png	https://www.rca.ac.rw/	Enabled	2024-10-07 11:45:34.443	2024-10-07 11:45:34.443	{"Child care"}
64f32dd7-2294-43f5-949b-b591821a1313	SpeedSense	MURANGWA Pacifique	Our project focuses on developing a smart, in-vehicle speed monitoring system that addresses the shortcomings of traditional fixed speed cameras and speed governors. This innovative solution combines the functionality of a speed governor with real-time speed limit detection and feedback mechanisms, powered by an integrated AI assistant. The AI assistant provides real-time feedback to drivers, alerts them when speed limits are exceeded, and addresses any inquiries or concerns they may have during their journey. By offering dynamic speed control and personalized assistance, our system promotes safer driving practices and reduces the risk of accidents, all while simplifying vehicle systems and reducing costs.	/projects/logo/Speedsense_logo_457b96994491d5b9cfaf827419068fd5.svg	/projects/cover/Speedsense_cover_image_6b51fcb43fb84f2a4bec9e0a50382178.png	https://www.rca.ac.rw/	Enabled	2024-10-07 11:52:54.245	2024-10-07 11:52:54.245	{Transport}
ec815334-bc06-404e-a4a6-7055ba2a7c59	MinceTech	ASIFIWE Marie Angele	Mince Tech is a digital platform where users can track and manage their monetary assets  easily by keeping them informed about  their money flow through real-time notifications , making their transactions convenient safer through the payment with watches and other affordable devices.	/projects/logo/Mincetech_logo_d63debbc8bb3496fecde1ae1b9caf22f.svg	/projects/cover/Mincetech_cover_image_eb9b21b126d0be70cbc27a4e1b89d847.png	https://www.rca.ac.rw/	Enabled	2024-10-07 11:59:01.929	2024-10-07 11:59:01.929	{Finance}
f91981fb-a176-4285-8b81-7504080f129e	Quanta Ledger	Nkurunziza Andy Melvin	QuantaLedger leverages blockchain technology and tamper-proof QR codes to trace the entire supply chain of minerals, packaged food, and pharmaceuticals. This ensures ethical mineral sourcing and product safety through transparent and verifiable tracking.	/projects/logo/Quantaledger_logo_81c93dcd3df3e2487a6dc3d45b924c4d.svg	/projects/cover/Quantaledger_cover_image_953e5e3f97d050743133088ab0fe364e.png	https://www.rca.ac.rw/	Enabled	2024-10-08 18:01:53.341	2024-10-08 18:11:55.938	{"Supply Chain Management"}
18964e91-6e8c-4fb7-be72-424527f8738f	Rangurura	Sibomana Edouard	RANGURURA connects citizens and leaders through a platform for efficient issue reporting and tracking. It enhances transparency, improves communication, and ensures timely issue resolution.	/projects/logo/Rangurura_logo_c83255696087ae3c610318f434cac5d0.svg	/projects/cover/Rangurura_cover_image_ca5aba9f8f48d518bf5b2cc76d38ebca.png	http://194.163.167.131:3000/	Enabled	2024-10-07 11:56:02.893	2024-10-07 12:14:20.331	{Governance}
a5a702a4-ce71-486e-a618-a0ed96a51419	CryptaVita	Ineza Cinta Castella	CryptaVita is an innovative AI-driven platform focused on predicting, preventing and warning about natural disasters. We specialize in early warning systems for floods, landslides, and other hazards, using AI and drone technology to provide real-time alerts and safeguard lives. In collaboration with key partners, we're transforming how communities and governments respond to natural threats.\n	/projects/logo/Cryptavita_logo_ba9dbe4de0355212e5a2c5e1c773ca71.svg	/projects/cover/Cryptavita_cover_image_f85a571a516ba38c5c6449e795b4bbfd.png	https://cryptavita.vercel.app/	Enabled	2024-10-07 20:00:40.062	2024-10-07 20:00:40.062	{"Disaster Risk Management"}
ba5a82b1-f577-44b4-8749-82d1d53f95c5	Fishot	Gisele Akuzwe MIGISHA	Fishot: A cutting-edge robot fighting water pollution by autonomously removing plastic waster. Its advanced tech ensures efficient and eco-friendly cleanup, making it a  compelling investment for a cleaner aquatic future.	/projects/logo/Fishot_logo_86c242b8c90b70e5907e08b59296a38d.svg	/projects/cover/Fishot_cover_image_913af2a82e1bf852fd067231669add8d.png	https://www.rca.ac.rw/	Enabled	2024-10-07 20:05:43.297	2024-10-07 20:08:14.534	{"Environmental technology"}
eb3e39aa-2a0e-4e0f-9ea2-f7eaf26d684e	ETix	Arsene Muvunyi	ETix is a mobile app designed for Rwandan citizens to streamline the bus ticketing process. It enables users to purchase tickets, track buses in real-time, generate QR codes for easy validation and AR Navigation in case of emergency. The app also offers features for bus drivers to view passenger details and ratings.	/projects/logo/Etix_logo_a68f08bda1e6fbdafd7d71c097465da8.svg	/projects/cover/Etix_cover_image_3364adde17379f16c188632eda91c99b.png	https://www.rca.ac.rw/	Enabled	2024-10-07 12:00:45.578	2024-10-08 17:58:33.733	{Transport}
\.


--
-- Data for Name: Rating; Type: TABLE DATA; Schema: public; Owner: peaceishimwem
--

COPY public."Rating" (id, "userId", "projectId", relevance, impact_to_society, performance, progress, feedback, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: peaceishimwem
--

COPY public."Role" (id, name, description, status, "createdAt", "updatedAt") FROM stdin;
4e2766c5-da37-444e-a94a-92fab739ff53	User	System users	Enabled	2024-09-29 13:01:53.033	2024-09-29 13:01:53.033
4cdb58d1-5388-4b68-ae30-c6971ec49488	Admin	System manager	Enabled	2024-09-29 13:02:14.905	2024-09-29 13:02:14.905
c4f28d56-a4ba-4220-b7a2-a36cd46bb447	SuperAdmin	System owner	Enabled	2024-09-29 13:03:05.792	2024-09-30 09:31:42.958
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: peaceishimwem
--

COPY public."User" (id, "fullName", "roleId", status, "createdAt", "updatedAt", code) FROM stdin;
78abd53c-e352-444b-84d2-4dff048ec9a8	Peace Ishimwe	4cdb58d1-5388-4b68-ae30-c6971ec49488	Enabled	2024-09-29 13:03:17.929	2024-09-30 09:50:36.402	1775
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: peaceishimwem
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
df452244-7ead-47bd-8eba-32c2da3399ec	0ec4ee91ee5fa8d6cd0715f84634026f954755d7181697b630d114c44ac26462	2024-09-29 14:43:59.510571+02	20240928201517_user_role_user_and_role	\N	\N	2024-09-29 14:43:59.499383+02	1
2cf93336-6727-4d92-8432-f43cb63ac55f	c0957595d349feea9e8e19c003ba4fe9c0a7ed1c11563bb16a99390dd61b9304	2024-09-29 14:44:16.365822+02	20240929124416_rhrs_1	\N	\N	2024-09-29 14:44:16.361729+02	1
b142522f-d3ac-4821-8b9d-9d716ae5e4f9	dab704fd39928144a06516852c6804b7c860c9b78f90c4608f4c0d37b61469ae	2024-09-29 15:19:52.069167+02	20240929131952_rhrs_2	\N	\N	2024-09-29 15:19:52.063832+02	1
35072b3d-3694-4343-88bf-b12feadc3c41	7e316465e8e2fd6dfc774fc882cd9b2a1f241cf375b16b8ed7f172a3837fbed6	2024-09-29 22:24:49.322142+02	20240929202449_projects	\N	\N	2024-09-29 22:24:49.317394+02	1
2ea84d00-05e9-4bf7-9690-714fdf1c4a88	71ee6b11a47cfa508a73e2374c176f9545e6f59146de9a4b585505064a891e27	2024-09-30 07:25:40.885391+02	20240930052540_admin_user	\N	\N	2024-09-30 07:25:40.87544+02	1
f5efe1dd-9df3-49e8-9c59-23184438e182	66aac3cad010b0ff802454ee6480f84810ca7685af3e100cfda6cbc1c96b83a8	2024-09-30 07:59:28.577385+02	20240930055928_removed_user_admin	\N	\N	2024-09-30 07:59:28.572819+02	1
17bdc2e9-f207-41c1-bf20-2b39338d4908	f2815c08e1624a254623f1e6ded44baea2e093eeaa63dac03702ab6e9f4731f3	2024-09-30 08:51:47.726515+02	20240930065147_added_status_on_projects	\N	\N	2024-09-30 08:51:47.723053+02	1
3e16dbbc-a3df-48f2-b105-503a3483ef0e	174d420aa614458abc8c404d41d0e9137c73b1cf3e24d72a4a08492e9eab8621	2024-09-30 09:42:30.061751+02	20240930074230_rating	\N	\N	2024-09-30 09:42:30.050006+02	1
5f19be8d-7e2e-4119-905f-16a1d701a16a	8b4e55572c055652ddd944c37ca3b26fe1f0460f1b5c412e866e752d6d8a8183	2024-10-03 09:08:20.190881+02	20241003070820_changed_field_to_array	\N	\N	2024-10-03 09:08:20.186909+02	1
9b45e21e-ba31-41cc-b166-b0f819963b96	fbb3d602ebfcb92f073cfab1eceb1b4afe961d344645f28a69ea7427fce90d78	2024-10-03 09:14:57.293634+02	20241003071457_changed_field_to_fields	\N	\N	2024-10-03 09:14:57.2918+02	1
7ba37028-4ec1-473d-a8e4-63566c1240e9	617998719d3cadde785d6ac99da9b4292044c147e23b859ff20e1ae4c73d7aa6	2024-10-03 16:19:00.031042+02	20241003141900_feedback_not_required	\N	\N	2024-10-03 16:19:00.028495+02	1
\.


--
-- Name: Project Project_pkey; Type: CONSTRAINT; Schema: public; Owner: peaceishimwem
--

ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (id);


--
-- Name: Rating Rating_pkey; Type: CONSTRAINT; Schema: public; Owner: peaceishimwem
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_pkey" PRIMARY KEY (id);


--
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: peaceishimwem
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: peaceishimwem
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: peaceishimwem
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Project_name_key; Type: INDEX; Schema: public; Owner: peaceishimwem
--

CREATE UNIQUE INDEX "Project_name_key" ON public."Project" USING btree (name);


--
-- Name: Role_name_key; Type: INDEX; Schema: public; Owner: peaceishimwem
--

CREATE UNIQUE INDEX "Role_name_key" ON public."Role" USING btree (name);


--
-- Name: User_fullName_key; Type: INDEX; Schema: public; Owner: peaceishimwem
--

CREATE UNIQUE INDEX "User_fullName_key" ON public."User" USING btree ("fullName");


--
-- Name: Rating Rating_projectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: peaceishimwem
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES public."Project"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Rating Rating_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: peaceishimwem
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: User User_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: peaceishimwem
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

