--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-04-11 12:29:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE jschat;
--
-- TOC entry 2127 (class 1262 OID 16385)
-- Name: jschat; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE jschat WITH TEMPLATE = template0 ENCODING = 'WIN1252' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE jschat OWNER TO postgres;

\connect jschat

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: ynau
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO ynau;

--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: ynau
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 185 (class 1259 OID 16425)
-- Name: chat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chat_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 16427)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chat (
    id integer DEFAULT nextval('chat_id_seq'::regclass) NOT NULL,
    room text,
    username text,
    msg text,
    datee timestamp with time zone
);


ALTER TABLE chat OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16397)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rooms (
    id integer NOT NULL,
    room text,
    creator text,
    participants text[],
    status text
);


ALTER TABLE rooms OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16395)
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rooms_id_seq OWNER TO postgres;

--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 181
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- TOC entry 183 (class 1259 OID 16416)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1023
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16418)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    username text,
    role text,
    passwd text,
    participants text[],
    status text
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 1996 (class 2604 OID 16400)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- TOC entry 2122 (class 0 OID 16427)
-- Dependencies: 186
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO chat (id, room, username, msg, datee) VALUES (1, 'Ted', 'sawq', 'sdd', NULL);
INSERT INTO chat (id, room, username, msg, datee) VALUES (2, 'Ted', 'wdsa', 'sadsad', '2016-04-04 16:58:13.281377+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (3, 'undefined', 'undefined', 'sdfsf', '2016-04-05 08:47:49.489158+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (4, 'undefined', 'undefined', 'sdfsfd', '2016-04-05 08:47:52.422417+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (5, 'ww', 'undefined', 'sdsfd', '2016-04-05 08:48:10.816101+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (6, 'ww', 'undefined', 'dsfdsfdsf', '2016-04-05 08:48:12.914753+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (7, 'undefined', 'undefined', 'sd', '2016-04-05 11:31:15.669865+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (8, 'undefined', 'undefined', 'edfewf', '2016-04-05 12:33:21.45645+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (9, 'undefined', 'undefined', '', '2016-04-05 12:33:22.171476+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (10, 'undefined', 'undefined', 'fewfwef', '2016-04-05 12:33:23.513539+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (11, 'qa', 'undefined', 'ef', '2016-04-05 12:33:26.400668+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (12, 'qa', 'undefined', 'efef', '2016-04-05 12:33:27.912738+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (13, 'asd', 'undefined', 'i87i', '2016-04-05 12:38:43.369715+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (14, 'undefined', 'undefined', 'sdf', '2016-04-05 12:46:01.161214+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (15, 'undefined', 'undefined', 'sdfsdf', '2016-04-05 12:46:02.903286+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (16, 'undefined', 'undefined', 'dsfssdf', '2016-04-05 12:46:05.243374+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (17, 'qa', 'undefined', 'sdf', '2016-04-05 12:46:07.6905+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (18, 'qa', 'undefined', 'sdf', '2016-04-05 12:46:08.791555+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (19, 'qa', 'undefined', 'asas', '2016-04-05 12:46:40.044454+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (20, 'qa', 'undefined', 'sadd', '2016-04-05 12:46:42.052524+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (21, 'qa', 'jhd', 'sd', '2016-04-05 13:27:50.227977+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (22, 'qa', 'usr', 'vv', '2016-04-05 13:27:54.294216+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (23, 'qa', 'jhd', 'ergeg', '2016-04-05 13:34:42.379772+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (24, 'qa', 'usr', 'dds', '2016-04-05 13:45:43.903251+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (25, 'qa', 'jhd', 'd', '2016-04-05 13:45:47.200455+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (26, 'qa', 'jhd', 'sdsad', '2016-04-05 13:48:56.995287+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (27, 'qa', 'usr', 'dsfsdf', '2016-04-05 13:49:05.624281+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (28, 'qa', 'jhd', 'dsfsdf', '2016-04-05 13:49:08.275457+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (29, 'qa', 'jhd', 'd', '2016-04-05 13:49:14.482836+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (30, 'qa', 'jhd', 'sadad', '2016-04-05 14:05:55.240278+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (31, 'qa', 'usr', 'zxzx', '2016-04-05 14:06:05.143946+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (32, 'qa', 'jhd', 'dsfsdf', '2016-04-05 14:35:24.152012+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (33, 'qa', 'jhd', 'dddd', '2016-04-05 14:35:28.318293+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (34, 'qa', 'jhd', 'ytht', '2016-04-05 14:58:36.326553+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (35, 'qa', 'jhd', 'thth', '2016-04-05 14:58:38.264619+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (36, 'qa', 'usr', 'dsfsf', '2016-04-05 15:03:36.456696+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (37, 'qa', 'jhd', 'sadads', '2016-04-05 15:03:51.395613+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (38, 'qa', 'usr', 'ddd', '2016-04-05 15:03:54.600813+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (39, 'qa', 'jhd', 'wewee', '2016-04-05 15:04:01.20855+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (40, 'qa', 'usr', 'weewe', '2016-04-05 15:04:06.123781+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (41, 'qa', 'jhd', '321', '2016-04-05 15:04:10.87598+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (42, 'wes', 'jhd', '10', '2016-04-05 15:04:21.994526+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (43, 'wes', 'usr', '20', '2016-04-05 15:04:28.494817+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (44, 'wes', 'jhd', '10', '2016-04-05 15:04:33.285025+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (45, 'wes', 'usr', '30', '2016-04-05 15:04:37.464221+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (46, 'qa', 'jhd', 'dsfsdfdsf', '2016-04-05 15:08:56.628635+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (47, 'qa', 'jhd', 'dsfdsfds', '2016-04-05 15:08:58.169694+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (48, 'qa', 'jhd', 'dsfdsf', '2016-04-05 15:08:59.557749+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (49, 'qa', 'jhd', 'dsfsf', '2016-04-05 15:09:13.374373+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (50, 'qa', 'jhd', 'sdfdsf', '2016-04-05 15:09:15.033436+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (51, 'qa', 'usr', 'dsdfdsf', '2016-04-05 15:09:18.521637+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (52, 'qa', 'usr', '', '2016-04-05 15:09:19.131658+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (53, 'qa', 'usr', 'sdfdsf', '2016-04-05 15:09:20.940722+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (54, 'undefined', 'undefined', 'sdfdsf', '2016-04-05 16:14:58.337465+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (55, 'undefined', 'undefined', 'dsf', '2016-04-05 16:14:58.362467+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (56, 'qa', 'jhd', 'hi john', '2016-04-05 16:15:14.494155+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (57, 'qa', 'john', 'hi jhd', '2016-04-05 16:15:21.907924+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (58, 'qa', 'jhd', '321', '2016-04-05 16:19:44.155211+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (59, 'qwerty', 'jhd', 'sadas', '2016-04-05 16:21:21.199403+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (60, 'qwerty', 'jhd', 'asdsad', '2016-04-05 16:21:22.912649+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (61, 'qa', 'john', '321', '2016-04-05 16:24:57.549188+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (62, 'qa', 'john', 'dsfsdfs', '2016-04-05 16:25:03.957284+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (63, 'qwerty', 'jhd', 'dsfdsf', '2016-04-05 16:25:06.905824+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (64, 'qa', 'jhd', 'sadasd', '2016-04-05 16:25:28.199043+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (65, 'qa', 'jhd', 'asd', '2016-04-05 16:25:29.888477+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (66, 'qa', 'jhd', 'hi', '2016-04-05 16:25:42.344158+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (67, 'qa', 'john', 'hello', '2016-04-05 16:25:46.42363+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (68, 'qa', 'john', '321', '2016-04-05 16:25:54.098745+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (69, 'qa', 'jhd', 'ret', '2016-04-05 16:25:57.068076+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (70, 'ww', 'jhd', 'qwqw', '2016-04-05 16:31:49.841351+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (71, 'ww', 'john', '54', '2016-04-05 16:32:04.435487+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (72, 'gh', 'john', 'dsadsad', '2016-04-05 16:33:38.884274+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (73, 'ww', 'jhd', 'sdad', '2016-04-05 16:33:49.212951+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (74, 'gh', 'john', 'sdddd', '2016-04-05 16:33:54.957468+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (75, 'qa', 'jhd', '.invite', '2016-04-05 17:01:21.091307+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (76, 'qa', 'jhd', '.invite', '2016-04-05 17:01:47.549125+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (77, 'qa', 'jhd', '.invite', '2016-04-05 17:02:11.558977+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (78, 'qa', 'jhd', '.invite', '2016-04-05 17:03:18.42243+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (79, 'qa', 'jhd', '.invite', '2016-04-05 17:04:55.675226+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (80, 'qa', 'jhd', '.invite', '2016-04-05 17:06:50.936566+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (81, 'qa', 'jhd', '.invite', '2016-04-05 17:09:30.126801+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (82, 'qa', 'jhd', 'invite', '2016-04-05 17:09:36.807011+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (83, 'qa', 'jhd', 'invite', '2016-04-05 17:09:46.588768+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (84, 'qa', 'jhd', 'invite', '2016-04-05 17:10:13.597245+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (85, 'qa', 'jhd', 'invite', '2016-04-05 17:10:48.058694+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (86, 'qa', 'jhd', 'invite', '2016-04-05 17:11:26.713033+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (87, 'qa', 'jhd', '00', '2016-04-05 17:12:28.049406+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (88, 'qa', 'jhd', '00', '2016-04-05 17:13:48.704473+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (89, 'qa', 'jhd', '00', '2016-04-05 17:13:55.04889+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (90, 'qa', 'jhd', '32', '2016-04-06 06:52:46.564148+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (91, 'qa', 'jhd', '112', '2016-04-06 06:52:50.411812+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (92, 'qa', 'jhd', 'kjyuk', '2016-04-06 06:54:11.552915+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (93, 'qa', 'jhd', 'uykuy', '2016-04-06 06:54:12.802156+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (94, 'qa', 'jhd', 'yukuyk', '2016-04-06 06:54:14.301401+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (95, 'qa', 'jhd', 'yukuyk', '2016-04-06 06:54:15.535443+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (96, 'qa', 'jhd', 'uykuyk', '2016-04-06 06:54:16.850282+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (97, 'qa', 'jhd', 'uyiuyi', '2016-04-06 06:54:18.168516+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (98, 'qa', 'jhd', 'ytiutyu', '2016-04-06 06:54:19.351355+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (99, 'qa', 'jhd', 'ytutyu', '2016-04-06 06:54:20.596997+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (100, 'qa', 'jhd', 'tyutyu', '2016-04-06 06:54:21.948438+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (101, 'qa', 'jhd', 'tyutyu', '2016-04-06 06:54:23.216075+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (102, 'qa', 'jhd', 'tuyutuy', '2016-04-06 06:54:24.681922+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (103, 'qa', 'usr', 'tyry', '2016-04-06 06:54:41.060091+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (104, 'qa', 'john', 'ertertetr', '2016-04-06 06:54:43.558225+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (105, 'qa', 'john', 'ttt', '2016-04-06 06:54:45.891363+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (106, 'qa', 'jhd', 'ertert', '2016-04-06 06:56:00.18162+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (107, 'qa', 'jhd', 'erter', '2016-04-06 06:56:01.63446+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (108, 'null', 'jhd', 'dsfsdf', '2016-04-06 06:59:44.192119+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (109, 'null', 'jhd', 'dsfs', '2016-04-06 06:59:45.592354+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (110, 'null', 'jhd', 'sdf', '2016-04-06 06:59:46.957593+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (111, 'qa', 'jhd', 'd', '2016-04-06 07:04:54.455573+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (112, 'qa', 'jhd', 'hi guys', '2016-04-06 07:08:00.862722+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (113, 'qa', 'usr', 'wussup?', '2016-04-06 07:08:12.516119+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (114, 'undefined', 'jhd', 'sdad', '2016-04-06 07:19:23.933731+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (115, 'qa', 'jhd', 'sdfsf', '2016-04-06 07:19:34.082971+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (116, 'qa', 'jhd', 'sdfdsf', '2016-04-06 07:19:37.082427+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (117, 'qa', 'jhd', 'qww', '2016-04-06 07:20:16.518346+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (118, 'qa', 'jhd', 'asdasd', '2016-04-06 07:22:11.595552+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (119, 'qa', 'jhd', 'dsfdsf', '2016-04-06 07:25:33.145205+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (120, 'qa', 'jhd', 'sdfsdf', '2016-04-06 07:25:34.795248+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (121, 'qa', 'jhd', '1', '2016-04-06 07:30:46.72563+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (122, 'qa', 'jhd', '2', '2016-04-06 07:30:49.507758+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (123, 'qa', 'jhd', '3', '2016-04-06 07:30:53.178881+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (124, 'wes', 'usr', 'efrwefr', '2016-04-06 07:31:22.42967+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (125, 'qa', 'john', 'sdd', '2016-04-06 07:38:47.483266+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (126, 'qa', 'john', 'sss', '2016-04-06 07:38:49.550112+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (127, 'qa', 'john', 'ssadsd', '2016-04-06 07:38:51.949175+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (128, 'undefined', 'undefined', 'erferf', '2016-04-06 12:58:34.659021+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (129, 'undefined', 'undefined', 'efrerf', '2016-04-06 12:58:36.266078+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (130, 'undefined', 'undefined', 'erfer', '2016-04-06 12:58:37.623128+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (131, 'qa', 'jhd', 'uyu', '2016-04-06 13:50:38.663986+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (132, 'wes', 'jhd', 'yuuy', '2016-04-06 13:50:42.773127+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (133, 'room1', 'jhd', 'tyjtyj', '2016-04-06 15:07:03.053215+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (134, 'room1', 'john', 'saa', '2016-04-06 15:10:02.282335+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (135, 'room2', '15', 'fhfgh', '2016-04-06 15:48:27.279234+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (136, 'room2', '15', 'ghgh', '2016-04-06 15:48:29.169304+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (137, 'room2', '78', 'gfhgfh', '2016-04-06 15:48:33.807482+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (138, 'room2', '78', 'gfhfh', '2016-04-06 15:48:35.220541+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (139, 'room2', 'guest9', 'dfg', '2016-04-06 15:49:06.89446+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (140, 'room2', 'guest9', 'dfgfdg', '2016-04-06 15:49:09.195547+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (141, 'room2', 'guest 36', 'asdsad', '2016-04-06 15:51:51.908498+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (142, 'room2', 'guest 74', 'dsfsf', '2016-04-06 16:00:42.838647+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (143, 'room2', 'jhd', 'fgdg', '2016-04-06 16:01:39.677333+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (144, 'room2', 'jhd', 'fdgfdg', '2016-04-06 16:01:42.584419+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (145, 'room2', 'usr', 'dfgf', '2016-04-06 16:02:01.875944+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (146, 'room2', 'guest 23', 'edf', '2016-04-06 16:09:53.543001+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (147, 'room2', 'jhd', 'sd', '2016-04-06 16:10:02.721919+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (148, 'room2', 'jhd', 'dsf', '2016-04-06 16:10:06.774324+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (149, 'room2', 'jhd', 'dsfdsf', '2016-04-06 16:10:09.109558+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (150, 'room2', 'jhd', 'sdfdsf', '2016-04-06 16:10:10.660713+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (151, 'room2', 'usr', 'dsfsdf', '2016-04-06 16:10:18.692516+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (152, 'room2', 'guest 87', 'dwedew', '2016-04-06 16:11:18.681514+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (153, 'room2', 'guest 44', 'dfgfdg', '2016-04-06 16:11:27.884434+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (154, 'room2', 'guest 87', 'dfgfdg', '2016-04-06 16:11:32.433889+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (155, 'room2', 'guest 44', 'gdfgfd', '2016-04-06 16:11:35.571203+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (156, 'room2', 'guest 17', 'gjh', '2016-04-06 16:15:53.334977+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (157, 'room2', 'guest 20', 'gfhfh', '2016-04-06 16:15:57.06735+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (158, 'room2', 'guest 89', 'sdf', '2016-04-06 16:23:28.654504+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (159, 'room2', 'guest 29', 'sd', '2016-04-06 16:23:32.142853+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (160, 'undefined', 'guest 62', 'fdgdg', '2016-04-06 16:24:41.863824+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (161, 'room2', 'guest 17', 'dfgdfg', '2016-04-06 16:24:45.126151+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (162, 'room2', 'guest 97', 'erter', '2016-04-06 16:26:47.478385+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (163, 'room2', 'guest 34', 'erte', '2016-04-06 16:26:51.310768+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (164, 'room2', 'guest57', 'sad', '2016-04-06 16:36:29.731604+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (165, 'room2', 'jhd', 'sd', '2016-04-06 16:36:33.219953+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (166, 'room1', 'guest48', 'yiy', '2016-04-09 09:34:47.048088+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (167, 'room1', 'guest48', 'yuiyiu', '2016-04-09 09:34:48.640149+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (168, 'room1', 'guest48', 'yiyiu', '2016-04-09 09:34:49.93021+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (169, 'room1', 'guest48', '777', '2016-04-09 09:34:51.748281+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (170, 'room1', 'guest48', 'yiyi', '2016-04-09 09:34:52.902334+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (171, 'room1', 'guest77', 'ewfw', '2016-04-09 09:37:29.297613+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (172, 'room1', 'guest77', '[[', '2016-04-09 09:53:49.755188+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (173, 'room1', 'guest77', 'kiuk', '2016-04-09 09:53:51.195251+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (174, 'room1', 'guest85', 'regerg', '2016-04-09 10:01:35.802512+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (175, 'room1', 'guest48', 'edwwqd', '2016-04-09 10:03:39.802091+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (176, 'room1', 'guest17', 'wsqws', '2016-04-09 10:10:28.40206+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (177, 'room1', 'guest17', 'w', '2016-04-09 10:10:31.517157+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (178, 'room1', 'guest85', 'sdfsdf', '2016-04-09 10:35:59.622+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (179, 'room1', 'guest85', 'dsfdsf', '2016-04-09 10:36:01.012049+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (180, 'room1', 'guest85', 'dsfdsf', '2016-04-09 10:36:09.636276+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (181, 'room1', 'guest91', 'ewdew', '2016-04-09 10:36:22.965724+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (182, 'room2', 'guest91', '6hyttrh', '2016-04-09 10:37:18.772742+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (183, 'room1', 'guest1', 'sadd', '2016-04-09 10:37:32.888145+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (184, 'room1', 'guest1', 'asda', '2016-04-09 10:37:35.003211+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (185, 'room1', 'usr', 'dfgdfg', '2016-04-09 10:37:56.1062+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (186, 'room1', 'guest92', 'dsasd', '2016-04-09 10:48:33.189817+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (187, 'room1', 'guest92', 'asdasd', '2016-04-09 10:48:34.552877+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (188, 'undefined', 'guest19', 'sdfcds', '2016-04-09 10:50:00.415125+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (189, 'room1', 'guest18', 'sdf', '2016-04-09 10:50:36.233029+05');
INSERT INTO chat (id, room, username, msg, datee) VALUES (190, 'room1', 'guest39', 'sfdsf', '2016-04-09 10:50:42.997334+05');


--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 185
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('chat_id_seq', 190, true);


--
-- TOC entry 2118 (class 0 OID 16397)
-- Dependencies: 182
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rooms (id, room, creator, participants, status) VALUES (1051, 'room1', 'usr', '{jhd,usr,john}', 'closed');
INSERT INTO rooms (id, room, creator, participants, status) VALUES (1052, 'room2', 'usr', '{jhd}', 'open');
INSERT INTO rooms (id, room, creator, participants, status) VALUES (1060, 'room3', 'jhd', '{jhd}', 'closed');
INSERT INTO rooms (id, room, creator, participants, status) VALUES (1061, 'room4', 'jhd', '{jhd,usr}', 'closed');
INSERT INTO rooms (id, room, creator, participants, status) VALUES (1063, 'rt', 'usr', '{usr}', 'closed');
INSERT INTO rooms (id, room, creator, participants, status) VALUES (1065, 'null', 'guest19', '{guest19}', 'closed');
INSERT INTO rooms (id, room, creator, participants, status) VALUES (1066, 'sss', 'jhd', '{jhd}', 'closed');
INSERT INTO rooms (id, room, creator, participants, status) VALUES (1067, 'ds', 'jhd', '{jhd}', 'closed');


--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 181
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rooms_id_seq', 1067, true);


--
-- TOC entry 2120 (class 0 OID 16418)
-- Dependencies: 184
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, username, role, passwd, participants, status) VALUES (1032, 'jhd', 'admin', 'zxc', NULL, NULL);
INSERT INTO users (id, username, role, passwd, participants, status) VALUES (1034, 'usr', 'admin', 'cvb', NULL, NULL);
INSERT INTO users (id, username, role, passwd, participants, status) VALUES (1035, 'john', 'admin', 'qaz', NULL, NULL);


--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 183
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1035, true);


--
-- TOC entry 2000 (class 2606 OID 16446)
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 2002 (class 2606 OID 16444)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: ynau
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM ynau;
GRANT ALL ON SCHEMA public TO ynau;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-04-11 12:29:45

--
-- PostgreSQL database dump complete
--

