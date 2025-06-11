--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

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
-- Name: hotel_booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel_booking (
    booking_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    room_number character varying(10) NOT NULL,
    room_type character varying(10) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    total_cost numeric(10,2) NOT NULL,
    payment_amount numeric(10,2) NOT NULL,
    payment_method character varying(20) NOT NULL,
    CONSTRAINT hotel_booking_check CHECK (((((room_number)::text = '101'::text) AND ((room_type)::text = 'small'::text)) OR (((room_number)::text = '102'::text) AND ((room_type)::text = 'large'::text)) OR (((room_number)::text = '103'::text) AND ((room_type)::text = 'medium'::text)))),
    CONSTRAINT hotel_booking_payment_amount_check CHECK ((payment_amount > (0)::numeric)),
    CONSTRAINT hotel_booking_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['credit_card'::character varying, 'cash'::character varying, 'online'::character varying])::text[]))),
    CONSTRAINT hotel_booking_room_number_check CHECK (((room_number)::text = ANY ((ARRAY['101'::character varying, '102'::character varying, '103'::character varying])::text[]))),
    CONSTRAINT hotel_booking_room_type_check CHECK (((room_type)::text = ANY ((ARRAY['small'::character varying, 'medium'::character varying, 'large'::character varying])::text[]))),
    CONSTRAINT hotel_booking_total_cost_check CHECK ((total_cost >= (0)::numeric))
);


ALTER TABLE public.hotel_booking OWNER TO postgres;

--
-- Name: hotel_booking_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotel_booking_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hotel_booking_booking_id_seq OWNER TO postgres;

--
-- Name: hotel_booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotel_booking_booking_id_seq OWNED BY public.hotel_booking.booking_id;


--
-- Name: hotel_booking booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_booking ALTER COLUMN booking_id SET DEFAULT nextval('public.hotel_booking_booking_id_seq'::regclass);


--
-- Data for Name: hotel_booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel_booking (booking_id, name, email, phone, room_number, room_type, start_time, end_time, total_cost, payment_amount, payment_method) FROM stdin;
4	Yash Kannan	ykk@gmail.com	1234567890	103	medium	2025-05-18 00:00:00	2025-05-20 00:00:00	3000.00	3000.00	cash
5	Manda Sai	ms@gmail.com	9087654321	101	small	2025-06-05 00:00:00	2025-06-07 00:00:00	2000.00	2000.00	credit_card
2	Nivesh Kumar	raghav@gmail.com	8932543109	101	small	2025-05-19 00:00:00	2025-05-22 00:00:00	6000.00	6000.00	online
\.


--
-- Name: hotel_booking_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotel_booking_booking_id_seq', 7, true);


--
-- Name: hotel_booking hotel_booking_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_booking
    ADD CONSTRAINT hotel_booking_email_key UNIQUE (email);


--
-- Name: hotel_booking hotel_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_booking
    ADD CONSTRAINT hotel_booking_pkey PRIMARY KEY (booking_id);


--
-- PostgreSQL database dump complete
--

