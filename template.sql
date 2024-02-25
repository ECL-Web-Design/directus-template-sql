--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.10.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.10.1)

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
-- Name: analytics_events_day; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.analytics_events_day (
    id integer NOT NULL,
    date_created timestamp with time zone,
    event character varying(255) DEFAULT NULL::character varying
);


--
-- Name: analytics_events_day_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.analytics_events_day_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: analytics_events_day_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.analytics_events_day_id_seq OWNED BY public.analytics_events_day.id;


--
-- Name: builder_cta_section; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.builder_cta_section (
    id integer NOT NULL,
    sort integer,
    date_created timestamp with time zone,
    title character varying(255)
);


--
-- Name: builder_cta_section_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.builder_cta_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: builder_cta_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.builder_cta_section_id_seq OWNED BY public.builder_cta_section.id;


--
-- Name: builder_cta_section_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.builder_cta_section_links (
    id integer NOT NULL,
    builder_cta_section_id integer,
    item character varying(255),
    sort integer,
    collection character varying(255)
);


--
-- Name: builder_cta_section_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.builder_cta_section_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: builder_cta_section_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.builder_cta_section_links_id_seq OWNED BY public.builder_cta_section_links.id;


--
-- Name: builder_section_base; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.builder_section_base (
    id integer NOT NULL,
    date_updated timestamp with time zone,
    subtitle character varying(255),
    title integer,
    content json,
    header_anchor_tag character varying(255)
);


--
-- Name: builder_section_base_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.builder_section_base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: builder_section_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.builder_section_base_id_seq OWNED BY public.builder_section_base.id;


--
-- Name: builder_section_base_section_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.builder_section_base_section_links (
    id integer NOT NULL,
    builder_section_base_id integer,
    item character varying(255),
    collection character varying(255),
    sort integer
);


--
-- Name: builder_section_base_section_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.builder_section_base_section_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: builder_section_base_section_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.builder_section_base_section_links_id_seq OWNED BY public.builder_section_base_section_links.id;


--
-- Name: builder_section_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.builder_section_image (
    id integer NOT NULL,
    sort integer,
    date_updated timestamp with time zone,
    section_title character varying(255),
    section_image uuid,
    section_content json
);


--
-- Name: builder_section_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.builder_section_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: builder_section_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.builder_section_image_id_seq OWNED BY public.builder_section_image.id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact (
    id integer NOT NULL
);


--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_extensions (
    name character varying(255) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer
);


--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);


--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json
);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);


--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: external_link_button; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.external_link_button (
    id integer NOT NULL,
    sort integer,
    button_text character varying(255),
    button_external_link character varying(255),
    type character varying(255) DEFAULT 'external'::character varying
);


--
-- Name: external_link_button_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.external_link_button_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: external_link_button_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.external_link_button_id_seq OWNED BY public.external_link_button.id;


--
-- Name: field_display_condition_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.field_display_condition_item (
    id integer NOT NULL,
    field_display_condition_id integer,
    name character varying(255),
    value character varying(255)
);


--
-- Name: field_display_condition_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.field_display_condition_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: field_display_condition_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.field_display_condition_item_id_seq OWNED BY public.field_display_condition_item.id;


--
-- Name: footer_section; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.footer_section (
    id integer NOT NULL,
    sort integer,
    heading character varying(255),
    footer_section_id integer
);


--
-- Name: footer_section_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.footer_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: footer_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.footer_section_id_seq OWNED BY public.footer_section.id;


--
-- Name: form_field; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.form_field (
    id integer NOT NULL,
    sort integer,
    placeholder character varying(255) DEFAULT NULL::character varying,
    name character varying(255) NOT NULL,
    type character varying(255) DEFAULT NULL::character varying NOT NULL,
    dynamic_options boolean DEFAULT true,
    dynamic_options_fetch_url character varying(255),
    dynamic_option_label_field character varying(255),
    dynamic_option_value_field character varying(255),
    static_options_list json,
    form_field_id integer,
    required boolean DEFAULT true NOT NULL,
    dynamic_options_data_field character varying(255) DEFAULT 'data'::character varying,
    autocomplete_enabled boolean DEFAULT true,
    autocomplete_value character varying(255),
    note character varying(255),
    form_list_field_id integer,
    label character varying(255),
    real_time_validation boolean DEFAULT false,
    field_icon character varying(255),
    dynamic_option_icon_field character varying(255)
);


--
-- Name: form_field_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.form_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: form_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.form_field_id_seq OWNED BY public.form_field.id;


--
-- Name: form_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.form_group (
    id integer NOT NULL,
    sort integer,
    form_group_id integer,
    group_label character varying(255),
    form_group_list_id integer,
    group_small_text character varying(255)
);


--
-- Name: form_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.form_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: form_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.form_group_id_seq OWNED BY public.form_group.id;


--
-- Name: form_section; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.form_section (
    id integer NOT NULL,
    sort integer,
    section_heading integer,
    form_item integer
);


--
-- Name: form_section_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.form_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: form_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.form_section_id_seq OWNED BY public.form_section.id;


--
-- Name: forms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.forms (
    id integer NOT NULL,
    post_url character varying(255),
    grouped boolean DEFAULT false,
    form_name character varying(255),
    on_submit_error json,
    on_submit_success json,
    submit_success_icon character varying(255),
    submit_error_icon character varying(255)
);


--
-- Name: forms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.forms_id_seq OWNED BY public.forms.id;


--
-- Name: generic_content_section; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.generic_content_section (
    id integer NOT NULL,
    sort integer,
    date_updated timestamp with time zone,
    section_heading integer
);


--
-- Name: generic_content_section_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.generic_content_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: generic_content_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.generic_content_section_id_seq OWNED BY public.generic_content_section.id;


--
-- Name: highlighted_title; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.highlighted_title (
    id integer NOT NULL,
    title character varying(255) DEFAULT NULL::character varying NOT NULL,
    highlighted_words json
);


--
-- Name: highlighted_title_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.highlighted_title_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: highlighted_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.highlighted_title_id_seq OWNED BY public.highlighted_title.id;


--
-- Name: home_page; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.home_page (
    id integer NOT NULL,
    selected_page integer
);


--
-- Name: home_page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.home_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: home_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.home_page_id_seq OWNED BY public.home_page.id;


--
-- Name: icon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.icon (
    id integer NOT NULL,
    sort integer,
    icon_id integer,
    icon character varying(255),
    icon_id_2 integer
);


--
-- Name: icon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.icon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.icon_id_seq OWNED BY public.icon.id;


--
-- Name: internal_link_button; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.internal_link_button (
    id integer NOT NULL,
    sort integer,
    button_text character varying(255),
    type character varying(255) DEFAULT 'internal'::character varying,
    route_link integer,
    cta_section_link_id integer
);


--
-- Name: internal_link_button_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.internal_link_button_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: internal_link_button_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.internal_link_button_id_seq OWNED BY public.internal_link_button.id;


--
-- Name: meta_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meta_tag (
    id integer NOT NULL,
    meta_name character varying(255),
    meta_content character varying(255),
    tag_id integer
);


--
-- Name: meta_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meta_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meta_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meta_tag_id_seq OWNED BY public.meta_tag.id;


--
-- Name: multi_step_form; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.multi_step_form (
    id integer NOT NULL,
    form_post_url character varying(255)
);


--
-- Name: multi_step_form_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.multi_step_form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: multi_step_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.multi_step_form_id_seq OWNED BY public.multi_step_form.id;


--
-- Name: multi_step_form_section; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.multi_step_form_section (
    id integer NOT NULL,
    sort integer,
    section_heading integer,
    form_content integer
);


--
-- Name: multi_step_form_section_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.multi_step_form_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: multi_step_form_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.multi_step_form_section_id_seq OWNED BY public.multi_step_form_section.id;


--
-- Name: page; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.page (
    id integer NOT NULL,
    sort integer,
    date_updated timestamp with time zone,
    guid character varying(255) DEFAULT NULL::character varying NOT NULL,
    meta_title character varying(255) DEFAULT NULL::character varying,
    og_title character varying(255) DEFAULT NULL::character varying,
    og_description character varying(255) DEFAULT NULL::character varying,
    og_image uuid,
    page_id integer,
    is_home_page boolean DEFAULT false,
    is_dynamic boolean DEFAULT false,
    route_page_id integer,
    route_sort integer
);


--
-- Name: page_footer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.page_footer (
    id integer NOT NULL,
    date_updated timestamp with time zone,
    privacy_policy_route integer,
    copywrite_info character varying(255),
    footer_button integer
);


--
-- Name: page_footer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.page_footer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_footer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.page_footer_id_seq OWNED BY public.page_footer.id;


--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.page_id_seq OWNED BY public.page.id;


--
-- Name: page_sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.page_sections (
    id integer NOT NULL,
    page_id integer,
    item character varying(255),
    collection character varying(255)
);


--
-- Name: page_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.page_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.page_sections_id_seq OWNED BY public.page_sections.id;


--
-- Name: route_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.route_item (
    id integer NOT NULL,
    sort integer,
    parsed_route character varying(255),
    route_id integer,
    navbar_label character varying(255),
    show_on_navbar boolean DEFAULT true,
    route_footer_id integer,
    active_page integer
);


--
-- Name: route_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.route_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: route_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.route_item_id_seq OWNED BY public.route_item.id;


--
-- Name: route_item_page; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.route_item_page (
    id integer NOT NULL,
    route_item_id integer,
    page_id integer,
    sort integer
);


--
-- Name: route_item_page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.route_item_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: route_item_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.route_item_page_id_seq OWNED BY public.route_item_page.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.routes (
    id integer NOT NULL,
    date_updated timestamp with time zone
);


--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_settings (
    id integer NOT NULL,
    date_updated timestamp with time zone,
    global_meta_title character varying(255),
    logo uuid,
    site_name character varying(255)
);


--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.site_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.site_settings_id_seq OWNED BY public.site_settings.id;


--
-- Name: social_link; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.social_link (
    id integer NOT NULL,
    sort integer,
    key character varying(255),
    link character varying(255) DEFAULT NULL::character varying NOT NULL,
    social_link_id integer,
    label character varying(255),
    contact_social_id integer,
    contact_link_id integer
);


--
-- Name: social_link_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.social_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: social_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.social_link_id_seq OWNED BY public.social_link.id;


--
-- Name: validation_check; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.validation_check (
    id integer NOT NULL,
    sort integer,
    condition character varying(255),
    value character varying(255),
    validation_item_check_id integer
);


--
-- Name: validation_check_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.validation_check_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: validation_check_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.validation_check_id_seq OWNED BY public.validation_check.id;


--
-- Name: validation_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.validation_item (
    id integer NOT NULL,
    sort integer,
    validation_fail_message character varying(255) DEFAULT 'Validation Failure'::character varying NOT NULL,
    form_field_validation_id integer,
    description text,
    label character varying(255) NOT NULL
);


--
-- Name: validation_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.validation_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: validation_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.validation_item_id_seq OWNED BY public.validation_item.id;


--
-- Name: work_item_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_item_files (
    id integer NOT NULL,
    directus_files_id uuid
);


--
-- Name: work_item_files_1; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_item_files_1 (
    id integer NOT NULL,
    directus_files_id uuid
);


--
-- Name: work_item_files_1_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.work_item_files_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_item_files_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.work_item_files_1_id_seq OWNED BY public.work_item_files_1.id;


--
-- Name: work_item_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.work_item_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_item_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.work_item_files_id_seq OWNED BY public.work_item_files.id;


--
-- Name: work_item_issue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_item_issue (
    id integer NOT NULL,
    sort integer,
    issue_icon character varying(255),
    issue_tagline character varying(255)
);


--
-- Name: work_item_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.work_item_issue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_item_issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.work_item_issue_id_seq OWNED BY public.work_item_issue.id;


--
-- Name: work_item_solution; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_item_solution (
    id integer NOT NULL,
    sort integer,
    solution_icon character varying(255),
    solution_tagline character varying(255)
);


--
-- Name: work_item_solution_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.work_item_solution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_item_solution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.work_item_solution_id_seq OWNED BY public.work_item_solution.id;


--
-- Name: analytics_events_day id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.analytics_events_day ALTER COLUMN id SET DEFAULT nextval('public.analytics_events_day_id_seq'::regclass);


--
-- Name: builder_cta_section id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_cta_section ALTER COLUMN id SET DEFAULT nextval('public.builder_cta_section_id_seq'::regclass);


--
-- Name: builder_cta_section_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_cta_section_links ALTER COLUMN id SET DEFAULT nextval('public.builder_cta_section_links_id_seq'::regclass);


--
-- Name: builder_section_base id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_section_base ALTER COLUMN id SET DEFAULT nextval('public.builder_section_base_id_seq'::regclass);


--
-- Name: builder_section_base_section_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_section_base_section_links ALTER COLUMN id SET DEFAULT nextval('public.builder_section_base_section_links_id_seq'::regclass);


--
-- Name: builder_section_image id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_section_image ALTER COLUMN id SET DEFAULT nextval('public.builder_section_image_id_seq'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: external_link_button id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.external_link_button ALTER COLUMN id SET DEFAULT nextval('public.external_link_button_id_seq'::regclass);


--
-- Name: field_display_condition_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.field_display_condition_item ALTER COLUMN id SET DEFAULT nextval('public.field_display_condition_item_id_seq'::regclass);


--
-- Name: footer_section id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_section ALTER COLUMN id SET DEFAULT nextval('public.footer_section_id_seq'::regclass);


--
-- Name: form_field id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_field ALTER COLUMN id SET DEFAULT nextval('public.form_field_id_seq'::regclass);


--
-- Name: form_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_group ALTER COLUMN id SET DEFAULT nextval('public.form_group_id_seq'::regclass);


--
-- Name: form_section id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_section ALTER COLUMN id SET DEFAULT nextval('public.form_section_id_seq'::regclass);


--
-- Name: forms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forms ALTER COLUMN id SET DEFAULT nextval('public.forms_id_seq'::regclass);


--
-- Name: generic_content_section id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.generic_content_section ALTER COLUMN id SET DEFAULT nextval('public.generic_content_section_id_seq'::regclass);


--
-- Name: highlighted_title id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.highlighted_title ALTER COLUMN id SET DEFAULT nextval('public.highlighted_title_id_seq'::regclass);


--
-- Name: home_page id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.home_page ALTER COLUMN id SET DEFAULT nextval('public.home_page_id_seq'::regclass);


--
-- Name: icon id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.icon ALTER COLUMN id SET DEFAULT nextval('public.icon_id_seq'::regclass);


--
-- Name: internal_link_button id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.internal_link_button ALTER COLUMN id SET DEFAULT nextval('public.internal_link_button_id_seq'::regclass);


--
-- Name: meta_tag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_tag ALTER COLUMN id SET DEFAULT nextval('public.meta_tag_id_seq'::regclass);


--
-- Name: multi_step_form id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multi_step_form ALTER COLUMN id SET DEFAULT nextval('public.multi_step_form_id_seq'::regclass);


--
-- Name: multi_step_form_section id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multi_step_form_section ALTER COLUMN id SET DEFAULT nextval('public.multi_step_form_section_id_seq'::regclass);


--
-- Name: page id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page ALTER COLUMN id SET DEFAULT nextval('public.page_id_seq'::regclass);


--
-- Name: page_footer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_footer ALTER COLUMN id SET DEFAULT nextval('public.page_footer_id_seq'::regclass);


--
-- Name: page_sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_sections ALTER COLUMN id SET DEFAULT nextval('public.page_sections_id_seq'::regclass);


--
-- Name: route_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_item ALTER COLUMN id SET DEFAULT nextval('public.route_item_id_seq'::regclass);


--
-- Name: route_item_page id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_item_page ALTER COLUMN id SET DEFAULT nextval('public.route_item_page_id_seq'::regclass);


--
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);


--
-- Name: site_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_id_seq'::regclass);


--
-- Name: social_link id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_link ALTER COLUMN id SET DEFAULT nextval('public.social_link_id_seq'::regclass);


--
-- Name: validation_check id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.validation_check ALTER COLUMN id SET DEFAULT nextval('public.validation_check_id_seq'::regclass);


--
-- Name: validation_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.validation_item ALTER COLUMN id SET DEFAULT nextval('public.validation_item_id_seq'::regclass);


--
-- Name: work_item_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_files ALTER COLUMN id SET DEFAULT nextval('public.work_item_files_id_seq'::regclass);


--
-- Name: work_item_files_1 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_files_1 ALTER COLUMN id SET DEFAULT nextval('public.work_item_files_1_id_seq'::regclass);


--
-- Name: work_item_issue id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_issue ALTER COLUMN id SET DEFAULT nextval('public.work_item_issue_id_seq'::regclass);


--
-- Name: work_item_solution id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_solution ALTER COLUMN id SET DEFAULT nextval('public.work_item_solution_id_seq'::regclass);


--
-- Data for Name: analytics_events_day; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.analytics_events_day (id, date_created, event) FROM stdin;
\.


--
-- Data for Name: builder_cta_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.builder_cta_section (id, sort, date_created, title) FROM stdin;
1	\N	2023-09-21 17:02:31.012+00	Want Your Company On This Page?
\.


--
-- Data for Name: builder_cta_section_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.builder_cta_section_links (id, builder_cta_section_id, item, sort, collection) FROM stdin;
1	1	11	1	internal_link_button
\.


--
-- Data for Name: builder_section_base; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.builder_section_base (id, date_updated, subtitle, title, content, header_anchor_tag) FROM stdin;
1	\N	UK Based	\N	\N	\N
2	\N	UK Based	1	\N	\N
6	2023-06-22 21:17:32.009+00	Hear from our clients	5	\N	\N
7	2023-07-02 12:42:39.364+00	\N	6	\N	\N
11	\N	\N	10	\N	\N
12	\N	\N	11	\N	\N
3	2023-08-25 15:38:48.399+00	Our Process	2	\N	process
4	2023-09-12 10:45:58.566+00	See What We Do	3	{"time":1694436328410,"blocks":[{"id":"InaiWnMq2X","type":"header","data":{"text":"Want to see more?","level":3}}],"version":"2.27.0"}	\N
5	2023-09-12 10:45:58.698+00	Matching your needs	4	{"time":1694515295993,"blocks":[{"id":"cB7RZG5mfa","type":"header","data":{"text":"Need something else?","level":3}}],"version":"2.27.0"}	\N
14	2023-09-20 17:09:59.249+00	Contact	13	\N	\N
9	2023-09-21 18:14:47.712+00	Previous Work	8	\N	\N
13	2023-09-21 18:18:00.666+00	Start a Project	12	\N	\N
10	2023-09-21 18:18:17.444+00	Testimonials	9	\N	\N
8	2023-09-29 15:54:02.456+00	\N	7	{"time":1696002827302,"blocks":[{"id":"yu8EJ5Flu-","type":"paragraph","data":{"text":"PRIVACY POLICY"}},{"id":"8gX3pabdNa","type":"paragraph","data":{"text":"Last updated July 03, 2023"}},{"id":"f99a18ztme","type":"paragraph","data":{"text":"This privacy notice for &lt;COMPANY NAME&gt; ('we', 'us', or 'our'), describes how and why we might collect, store, use, and/or share ('process') your information when you use our services ('Services'), such as when you:"}},{"id":"Tib2elmWgh","type":"paragraph","data":{"text":"Visit our website at &lt;COMPANY SITE&gt;, or any website of ours that links to this privacy notice"}},{"id":"rhQbAZz1l7","type":"paragraph","data":{"text":"Engage with us in other related ways, including any sales, marketing, or events"}},{"id":"cBZZNFcBhM","type":"paragraph","data":{"text":"Questions or concerns?&nbsp;Reading this privacy notice will help you understand your privacy rights and choices. If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at &lt;COMPANY SITE&gt;."}},{"id":"XV2uBf8vwR","type":"paragraph","data":{"text":"SUMMARY OF KEY POINTS"}},{"id":"Wm38wKSLbL","type":"paragraph","data":{"text":"This summary provides key points from our privacy notice, but you can find out more details about any of these topics by clicking the link following each key point or by using our&nbsp;table of contents&nbsp;below to find the section you are looking for."}},{"id":"aGdjAeK715","type":"paragraph","data":{"text":"What personal information do we process? When you visit, use, or navigate our Services, we may process personal information depending on how you interact with us and the Services, the choices you make, and the products and features you use. Learn more about&nbsp;personal information you disclose to us."}},{"id":"LibFR4MyFZ","type":"paragraph","data":{"text":"Do we process any sensitive personal information? We do not process sensitive personal information."}},{"id":"KMGPuv0HLH","type":"paragraph","data":{"text":"Do we receive any information from third parties? We do not receive any information from third parties."}},{"id":"RSE2HEd7Po","type":"paragraph","data":{"text":"How do we process your information? We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent. We process your information only when we have a valid legal reason to do so. Learn more about&nbsp;how we process your information."}},{"id":"GZAaqN4Sdt","type":"paragraph","data":{"text":"In what situations and with which parties do we share personal information? We may share information in specific situations and with specific third parties. Learn more about&nbsp;when and with whom we share your personal information."}},{"id":"9nja53z7Qp","type":"paragraph","data":{"text":"How do we keep your information safe? We have organisational and technical processes and procedures in place to protect your personal information. However, no electronic transmission over the internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorised third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. Learn more about&nbsp;how we keep your information safe."}},{"id":"9a5NZRIApI","type":"paragraph","data":{"text":"What are your rights? Depending on where you are located geographically, the applicable privacy law may mean you have certain rights regarding your personal information. Learn more about&nbsp;your privacy rights."}},{"id":"MFRTKZIXIM","type":"paragraph","data":{"text":"How do you exercise your rights? The easiest way to exercise your rights is by submitting a&nbsp;data subject access request, or by contacting us. We will consider and act upon any request in accordance with applicable data protection laws."}},{"id":"UT7S_M35ml","type":"paragraph","data":{"text":"Want to learn more about what we do with any information we collect?&nbsp;Review the privacy notice in full."}},{"id":"mQmwjpoLR_","type":"paragraph","data":{"text":"TABLE OF CONTENTS"}},{"id":"RknvWV3Fu8","type":"paragraph","data":{"text":"1. WHAT INFORMATION DO WE COLLECT?"}},{"id":"xGyKzm84t1","type":"paragraph","data":{"text":"2. HOW DO WE PROCESS YOUR INFORMATION?"}},{"id":"E6v2dQB-PI","type":"paragraph","data":{"text":"3. WHAT LEGAL BASES DO WE RELY ON TO PROCESS YOUR PERSONAL INFORMATION?"}},{"id":"x2vICGaDRN","type":"paragraph","data":{"text":"4. WHEN AND WITH WHOM DO WE SHARE YOUR PERSONAL INFORMATION?"}},{"id":"OJxd3LR5iD","type":"paragraph","data":{"text":"5. HOW LONG DO WE KEEP YOUR INFORMATION?"}},{"id":"0f8qhZwWQo","type":"paragraph","data":{"text":"6. HOW DO WE KEEP YOUR INFORMATION SAFE?"}},{"id":"UvIWC_MZO9","type":"paragraph","data":{"text":"7. DO WE COLLECT INFORMATION FROM MINORS?"}},{"id":"vxVQ4K-7Ir","type":"paragraph","data":{"text":"8. WHAT ARE YOUR PRIVACY RIGHTS?"}},{"id":"-LOECnqekG","type":"paragraph","data":{"text":"9. CONTROLS FOR DO-NOT-TRACK FEATURES"}},{"id":"3eIE-s9elC","type":"paragraph","data":{"text":"10. DO UNITED STATES RESIDENTS HAVE SPECIFIC PRIVACY RIGHTS?"}},{"id":"8qhPVibDLp","type":"paragraph","data":{"text":"11. DO WE MAKE UPDATES TO THIS NOTICE?"}},{"id":"PlwOuPy5kR","type":"paragraph","data":{"text":"12. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?"}},{"id":"c9wyOy8YxE","type":"paragraph","data":{"text":"13. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?"}},{"id":"1iFpCKsJ-9","type":"paragraph","data":{"text":"1. WHAT INFORMATION DO WE COLLECT?"}},{"id":"18yhiR1U5W","type":"paragraph","data":{"text":"Personal information you disclose to us"}},{"id":"rKlm6Sm8mt","type":"paragraph","data":{"text":"In Short:&nbsp;We collect personal information that you provide to us."}},{"id":"cju1BE34LJ","type":"paragraph","data":{"text":"We collect personal information that you voluntarily provide to us when you express an interest in obtaining information about us or our products and Services, when you participate in activities on the Services, or otherwise when you contact us."}},{"id":"-4nx-bTE2r","type":"paragraph","data":{"text":"Personal Information Provided by You. The personal information that we collect depends on the context of your interactions with us and the Services, the choices you make, and the products and features you use. The personal information we collect may include the following:"}},{"id":"tHs-QTTLkk","type":"paragraph","data":{"text":"names"}},{"id":"XTxolWA1oK","type":"paragraph","data":{"text":"email addresses"}},{"id":"UkH_COWF1i","type":"paragraph","data":{"text":"contact preferences"}},{"id":"x-R8IsUo-A","type":"paragraph","data":{"text":"phone numbers"}},{"id":"t11G4vRRaw","type":"paragraph","data":{"text":"other contact details"}},{"id":"AKhqPRSM7c","type":"paragraph","data":{"text":"Sensitive Information. We do not process sensitive information."}},{"id":"0gMFK0ZDat","type":"paragraph","data":{"text":"All personal information that you provide to us must be true, complete, and accurate, and you must notify us of any changes to such personal information."}},{"id":"XBuvyUGO2Y","type":"paragraph","data":{"text":"Information automatically collected"}},{"id":"ucJPOXOe3X","type":"paragraph","data":{"text":"In Short:&nbsp;Some information — such as your Internet Protocol (IP) address and/or browser and device characteristics — is collected automatically when you visit our Services."}},{"id":"w1oRURMtde","type":"paragraph","data":{"text":"We automatically collect certain information when you visit, use, or navigate the Services. This information does not reveal your specific identity (like your name or contact information) but may include device and usage information, such as your IP address, browser and device characteristics, operating system, language preferences, referring URLs, device name, country, location, information about how and when you use our Services, and other technical information. This information is primarily needed to maintain the security and operation of our Services, and for our internal analytics and reporting purposes."}},{"id":"_V7vFWQgJO","type":"paragraph","data":{"text":"The information we collect includes:"}},{"id":"HjHLAs-YxB","type":"paragraph","data":{"text":"Log and Usage Data. Log and usage data is service-related, diagnostic, usage, and performance information our servers automatically collect when you access or use our Services and which we record in log files. Depending on how you interact with us, this log data may include your IP address, device information, browser type, and settings and information about your activity in the Services&nbsp;(such as the date/time stamps associated with your usage, pages and files viewed, searches, and other actions you take such as which features you use), device event information (such as system activity, error reports (sometimes called 'crash dumps'), and hardware settings)."}},{"id":"S_kAl9SLRo","type":"paragraph","data":{"text":"2. HOW DO WE PROCESS YOUR INFORMATION?"}},{"id":"IiTHEZGM0h","type":"paragraph","data":{"text":"In Short:&nbsp;We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent."}},{"id":"aAN2jjZdgx","type":"paragraph","data":{"text":"We process your personal information for a variety of reasons, depending on how you interact with our Services, including:"}},{"id":"KPdsm_j5v4","type":"paragraph","data":{"text":"To deliver and facilitate delivery of services to the user.&nbsp;We may process your information to provide you with the requested service."}},{"id":"9uR7wMZAwr","type":"paragraph","data":{"text":"To respond to user inquiries/offer support to users.&nbsp;We may process your information to respond to your inquiries and solve any potential issues you might have with the requested service."}},{"id":"N0dgt872WS","type":"paragraph","data":{"text":"To save or protect an individual's vital interest. We may process your information when necessary to save or protect an individual’s vital interest, such as to prevent harm."}},{"id":"gUlz9H4Cuc","type":"paragraph","data":{"text":"3. WHAT LEGAL BASES DO WE RELY ON TO PROCESS YOUR INFORMATION?"}},{"id":"Ln-wamj0qu","type":"paragraph","data":{"text":"In Short:&nbsp;We only process your personal information when we believe it is necessary and we have a valid legal reason (i.e. legal basis) to do so under applicable law, like with your consent, to comply with laws, to provide you with services to enter into or fulfil our contractual obligations, to protect your rights, or to fulfil our legitimate business interests."}},{"id":"TzmeArL4P_","type":"paragraph","data":{"text":"The General Data Protection Regulation (GDPR) and UK GDPR require us to explain the valid legal bases we rely on in order to process your personal information. As such, we may rely on the following legal bases to process your personal information:"}},{"id":"fPrPgvL5Mg","type":"paragraph","data":{"text":"Consent.&nbsp;We may process your information if you have given us permission (i.e. consent) to use your personal information for a specific purpose. You can withdraw your consent at any time. Learn more about&nbsp;withdrawing your consent."}},{"id":"ZZmLOt8WpJ","type":"paragraph","data":{"text":"Performance of a Contract. We may process your personal information when we believe it is necessary to fulfil our contractual obligations to you, including providing our Services or at your request prior to entering into a contract with you."}},{"id":"76IT5qrpY4","type":"paragraph","data":{"text":"Legal Obligations. We may process your information where we believe it is necessary for compliance with our legal obligations, such as to cooperate with a law enforcement body or regulatory agency, exercise or defend our legal rights, or disclose your information as evidence in litigation in which we are involved."}},{"id":"g0N3IaWQO-","type":"paragraph","data":{"text":"Vital Interests. We may process your information where we believe it is necessary to protect your vital interests or the vital interests of a third party, such as situations involving potential threats to the safety of any person."}},{"id":"z8wyLio67U","type":"paragraph","data":{"text":"4. WHEN AND WITH WHOM DO WE SHARE YOUR PERSONAL INFORMATION?"}},{"id":"Vz6QFtFQ_b","type":"paragraph","data":{"text":"In Short:&nbsp;We may share information in specific situations described in this section and/or with the following third parties."}},{"id":"RsdBVq0wWQ","type":"paragraph","data":{"text":"We may need to share your personal information in the following situations:"}},{"id":"IHcAoYeN3S","type":"paragraph","data":{"text":"Business Transfers. We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company."}},{"id":"WdSLdd2I1J","type":"paragraph","data":{"text":"5. HOW LONG DO WE KEEP YOUR INFORMATION?"}},{"id":"F1euQ4GQxA","type":"paragraph","data":{"text":"In Short:&nbsp;We keep your information for as long as necessary to fulfil the purposes outlined in this privacy notice unless otherwise required by law."}},{"id":"if0oeES4m1","type":"paragraph","data":{"text":"We will only keep your personal information for as long as it is necessary for the purposes set out in this privacy notice, unless a longer retention period is required or permitted by law (such as tax, accounting, or other legal requirements)."}},{"id":"LqeqCmhwLN","type":"paragraph","data":{"text":"When we have no ongoing legitimate business need to process your personal information, we will either delete or anonymise such information, or, if this is not possible (for example, because your personal information has been stored in backup archives), then we will securely store your personal information and isolate it from any further processing until deletion is possible."}},{"id":"yOW37XgVhO","type":"paragraph","data":{"text":"6. HOW DO WE KEEP YOUR INFORMATION SAFE?"}},{"id":"mA1R2sqxz1","type":"paragraph","data":{"text":"In Short:&nbsp;We aim to protect your personal information through a system of organisational and technical security measures."}},{"id":"-btbZ97cPG","type":"paragraph","data":{"text":"We have implemented appropriate and reasonable technical and organisational security measures designed to protect the security of any personal information we process. However, despite our safeguards and efforts to secure your information, no electronic transmission over the Internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorised third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. Although we will do our best to protect your personal information, transmission of personal information to and from our Services is at your own risk. You should only access the Services within a secure environment."}},{"id":"bkG9AEMbI2","type":"paragraph","data":{"text":"7. DO WE COLLECT INFORMATION FROM MINORS?"}},{"id":"aiRp1Zxxrr","type":"paragraph","data":{"text":"In Short:&nbsp;We do not knowingly collect data from or market to children under 18 years of age."}},{"id":"caKuJCR-Ug","type":"paragraph","data":{"text":"We do not knowingly solicit data from or market to children under 18 years of age. By using the Services, you represent that you are at least 18 or that you are the parent or guardian of such a minor and consent to such minor dependent’s use of the Services. If we learn that personal information from users less than 18 years of age has been collected, we will deactivate the account and take reasonable measures to promptly delete such data from our records. If you become aware of any data we may have collected from children under age 18, please contact us at &lt;COMPANY EMAIL&gt;."}},{"id":"4pmbjMDWv9","type":"paragraph","data":{"text":"8. WHAT ARE YOUR PRIVACY RIGHTS?"}},{"id":"Wo8U_CjfSm","type":"paragraph","data":{"text":"In Short:&nbsp;In some regions, such as the European Economic Area (EEA) and United Kingdom (UK), you have rights that allow you greater access to and control over your personal information.&nbsp;You may review, change, or terminate your account at any time."}},{"id":"8LziPCn7n_","type":"paragraph","data":{"text":"In some regions (like the EEA and UK), you have certain rights under applicable data protection laws. These may include the right (i) to request access and obtain a copy of your personal information, (ii) to request rectification or erasure; (iii) to restrict the processing of your personal information; and (iv) if applicable, to data portability. In certain circumstances, you may also have the right to object to the processing of your personal information. You can make such a request by contacting us by using the contact details provided in the section 'HOW CAN YOU CONTACT US ABOUT THIS NOTICE?' below."}},{"id":"xOZd89iqAB","type":"paragraph","data":{"text":"We will consider and act upon any request in accordance with applicable data protection laws."}},{"id":"XOPNCP8zBg","type":"paragraph","data":{"text":"If you are located in the EEA or UK and you believe we are unlawfully processing your personal information, you also have the right to complain to your Member State data protection authority or&nbsp;UK data protection authority."}},{"id":"MB9QYxNDXi","type":"paragraph","data":{"text":"If you are located in Switzerland, you may contact the Federal Data Protection and Information Commissioner."}},{"id":"U3Cc-1izVU","type":"paragraph","data":{"text":"Withdrawing your consent: If we are relying on your consent to process your personal information, you have the right to withdraw your consent at any time. You can withdraw your consent at any time by contacting us by using the contact details provided in the section 'HOW CAN YOU CONTACT US ABOUT THIS NOTICE?' below."}},{"id":"8nd3_t_6Cc","type":"paragraph","data":{"text":"However, please note that this will not affect the lawfulness of the processing before its withdrawal nor, will it affect the processing of your personal information conducted in reliance on lawful processing grounds other than consent."}},{"id":"Lrze-r5JvF","type":"paragraph","data":{"text":"If you have questions or comments about your privacy rights, you may email us at &lt;COMPANY EMAIL&gt;."}},{"id":"Vor8uyBnHm","type":"paragraph","data":{"text":"9. CONTROLS FOR DO-NOT-TRACK FEATURES"}},{"id":"kAH7gW633X","type":"paragraph","data":{"text":"Most web browsers and some mobile operating systems and mobile applications include a Do-Not-Track ('DNT') feature or setting you can activate to signal your privacy preference not to have data about your online browsing activities monitored and collected. At this stage no uniform technology standard for recognising and implementing DNT signals has been finalised. As such, we do not currently respond to DNT browser signals or any other mechanism that automatically communicates your choice not to be tracked online. If a standard for online tracking is adopted that we must follow in the future, we will inform you about that practice in a revised version of this privacy notice."}},{"id":"K_mCf-wqLg","type":"paragraph","data":{"text":"10. DO UNITED STATES RESIDENTS HAVE SPECIFIC PRIVACY RIGHTS?"}},{"id":"pKDjQ_HNRh","type":"paragraph","data":{"text":"In Short:&nbsp;If you are a resident of California, you are granted specific rights regarding access to your personal information."}},{"id":"4BSYHrNtoZ","type":"paragraph","data":{"text":"California Residents"}},{"id":"vBNezPcPXO","type":"paragraph","data":{"text":"California Civil Code Section 1798.83, also known as the 'Shine The Light' law, permits our users who are California residents to request and obtain from us, once a year and free of charge, information about categories of personal information (if any) we disclosed to third parties for direct marketing purposes and the names and addresses of all third parties with which we shared personal information in the immediately preceding calendar year. If you are a California resident and would like to make such a request, please submit your request in writing to us using the contact information provided below."}},{"id":"Z1kj042cHl","type":"paragraph","data":{"text":"If you are under 18 years of age, reside in California, and have a registered account with the Services, you have the right to request removal of unwanted data that you publicly post on the Services. To request removal of such data, please contact us using the contact information provided below and include the email address associated with your account and a statement that you reside in California. We will make sure the data is not publicly displayed on the Services, but please be aware that the data may not be completely or comprehensively removed from all our systems (e.g. backups, etc.)."}},{"id":"PsB5Lqcbmq","type":"paragraph","data":{"text":"11. DO WE MAKE UPDATES TO THIS NOTICE?"}},{"id":"ymTL9T-k2F","type":"paragraph","data":{"text":"In Short:&nbsp;Yes, we will update this notice as necessary to stay compliant with relevant laws."}},{"id":"xabdiN_nxV","type":"paragraph","data":{"text":"We may update this privacy notice from time to time. The updated version will be indicated by an updated 'Revised' date and the updated version will be effective as soon as it is accessible. If we make material changes to this privacy notice, we may notify you either by prominently posting a notice of such changes or by directly sending you a notification. We encourage you to review this privacy notice frequently to be informed of how we are protecting your information."}},{"id":"IOZuh-W96o","type":"paragraph","data":{"text":"12. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?"}},{"id":"rSpLaGRuZ2","type":"paragraph","data":{"text":"If you have questions or comments about this notice, you may email us at &lt;COMPANY EMAIL&gt; or contact us by post at:"}},{"id":"icPz5nvQ5g","type":"paragraph","data":{"text":"&lt;COMPANY NAME&gt;<br>"}},{"id":"OeMuDKKpVX","type":"paragraph","data":{"text":"__________"}},{"id":"_zzHLBk_wK","type":"paragraph","data":{"text":"__________"}},{"id":"YuLOwIFUU0","type":"paragraph","data":{"text":"United Kingdom"}},{"id":"zPFQVD2dRN","type":"paragraph","data":{"text":"13. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?"}},{"id":"pZ80sq7ZjX","type":"paragraph","data":{"text":"You have the right to request access to the personal information we collect from you, change that information, or delete it. To request to review, update, or delete your personal information, please fill out and submit a&nbsp;data subject access request."}}],"version":"2.27.0"}	\N
15	2024-01-13 00:12:45.959+00	\N	14	{"time":1696002878974,"blocks":[{"id":"TW-zUyeMiU","type":"paragraph","data":{"text":"This is your new site :)<br>"}}],"version":"2.27.0"}	\N
16	\N	\N	15	\N	\N
\.


--
-- Data for Name: builder_section_base_section_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.builder_section_base_section_links (id, builder_section_base_id, item, collection, sort) FROM stdin;
1	\N	4	internal_link_button	\N
2	6	5	internal_link_button	\N
3	7	6	internal_link_button	\N
4	14	7	internal_link_button	1
5	4	8	internal_link_button	1
6	5	9	internal_link_button	1
7	15	1	external_link_button	1
8	15	12	internal_link_button	2
\.


--
-- Data for Name: builder_section_image; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.builder_section_image (id, sort, date_updated, section_title, section_image, section_content) FROM stdin;
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contact (id) FROM stdin;
1
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
7917	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.421+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	6feaba6a-49da-44ae-be50-18ebcadffc8f	\N	https://eclwebdesign.co.uk
7918	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.427+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	1fc6c3b0-1deb-45b8-bd91-0e237c9e1b2f	\N	https://eclwebdesign.co.uk
7919	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.43+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	7954cdaf-c6b9-40b4-b165-45f7bb20d3c7	\N	https://eclwebdesign.co.uk
7920	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.435+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	a849a98a-45f6-4256-949a-8be6dae97e86	\N	https://eclwebdesign.co.uk
7921	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.437+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	a3a666c3-5c80-4883-a6d7-53b3116b68ee	\N	https://eclwebdesign.co.uk
7922	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.441+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	2441fdef-93fc-4523-99ec-40caed39ad6f	\N	https://eclwebdesign.co.uk
7923	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.443+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	96416993-9b51-4633-991c-b5635ad68ec9	\N	https://eclwebdesign.co.uk
7924	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.446+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	4ee62a13-de1c-442f-a7c2-d17deeba820b	\N	https://eclwebdesign.co.uk
7925	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.449+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	f0abd0f9-5447-4bbe-a1fa-149d44b25d1f	\N	https://eclwebdesign.co.uk
7926	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.451+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	aeab05cc-a37b-493d-a8b8-6eea29c494e8	\N	https://eclwebdesign.co.uk
7927	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.454+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	454e226c-6299-43e4-b40f-bdebcd48e6a7	\N	https://eclwebdesign.co.uk
7928	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.458+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	5ecea876-d23d-44d6-8764-fcd5e08fcb97	\N	https://eclwebdesign.co.uk
7929	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.461+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	5dbdabcf-109b-4681-b67b-681f98a08605	\N	https://eclwebdesign.co.uk
7930	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.463+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	4122b557-4535-43b5-a599-0b5d281d5dd6	\N	https://eclwebdesign.co.uk
7931	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.466+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	aa601649-dc30-45e2-8a36-f27b1e351bf8	\N	https://eclwebdesign.co.uk
7932	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.47+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	ae5220c7-dbb9-4b63-bbc8-2b46569dce3b	\N	https://eclwebdesign.co.uk
7933	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.472+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	1121568a-ddf9-4d77-9176-38e92a538fe8	\N	https://eclwebdesign.co.uk
7934	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.475+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	c4f133bd-0a3e-4495-86fe-7f6842179c78	\N	https://eclwebdesign.co.uk
7935	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.478+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	b61abe98-7cf6-41e7-90bb-d8d708cc3827	\N	https://eclwebdesign.co.uk
7936	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.482+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	51938777-fb23-48be-9920-dc5ec6ff3c64	\N	https://eclwebdesign.co.uk
7937	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.485+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	af9f9272-2056-4e06-ae93-7c51b09046bc	\N	https://eclwebdesign.co.uk
7938	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.491+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	58fef5db-334d-4a9c-8ce9-37e43517bc3b	\N	https://eclwebdesign.co.uk
7939	delete	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-02-25 00:11:49.494+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	directus_files	892b1f1b-5531-40ed-a4ed-4beeeba7ec65	\N	https://eclwebdesign.co.uk
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
form_group	format_list_bulleted	\N	{{group_label}} -- Fields: {{fields.name}}	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	2	Form_Items	open	\N	f
field_display_condition_item	nest_display	\N	{{name}} -- {{value}}	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	3	Form_Items	open	\N	f
internal_link_button	link	\N	{{button_text}} -- {{route_link.parsed_route}}	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	2	builder_items	open	\N	f
external_link_button	insert_link	\N	{{button_text}} | {{button_external_link}}	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	3	builder_items	open	\N	f
highlighted_title	format_ink_highlighter	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	5	builder_items	open	\N	f
validation_item	verified	\N	{{label}} -- [ {{check_regex}} ]	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	1	form_field	open	\N	f
routes	directions	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	1	site_settings	open	\N	f
home_page	home	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	2	site_settings	open	\N	f
contact	call	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	4	site_settings	open	\N	f
page_footer	barefoot	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	5	site_settings	open	\N	f
forms	edit_note	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	4	global_articles	open	\N	f
site_settings	language	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	1	\N	open	\N	f
meta_tag	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	generic_items	open	\N	f
validation_check	question_mark	\N	Value Condition {{value}}	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	1	validation_item	open	\N	f
builder_section_base	dock_to_right	\N	{{title.title}} -- {{subtitle}} / Links: [ {{section_links}} ]	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	4	builder_items	open	\N	f
global_articles	folder	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	\N	open	\N	f
icon	face_5	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	3	generic_items	open	\N	f
footer_section	footprint	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	4	generic_items	open	\N	f
route_item	route	\N	{{parsed_route}} -- Pages({{route.guid}})	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	5	generic_items	open	\N	f
social_link	group	\N	{{key}} -- {{link}}	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	6	generic_items	open	\N	f
builder_section_image	vertical_split	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	4	builder_sections	open	\N	f
multi_step_form	difference	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	Form_Items	open	\N	f
form_field	edit_note	\N	{{field_icon}} {{name}} ( {{type}} )	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	4	Form_Items	open	\N	f
analytics_events_day	confirmation_number	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	analytics	open	\N	f
builder_cta_section	call_to_action	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	5	builder_sections	open	\N	f
builder_sections	folder	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	5	\N	open	\N	f
builder_items	folder	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	6	\N	open	\N	f
generic_items	folder	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	7	\N	open	\N	f
Form_Items	folder	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	8	\N	open	\N	f
analytics	folder	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	9	\N	open	\N	f
page_sections	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	10	\N	open	\N	f
work_item_files	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	11	\N	open	\N	f
builder_section_base_section_links	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	12	\N	open	\N	f
route_item_page	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	13	\N	open	\N	f
work_item_files_1	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	14	\N	open	\N	f
generic_content_section	description	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	10	builder_sections	open	\N	f
multi_step_form_section	difference	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	14	builder_sections	open	\N	f
form_section	edit_note	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	15	builder_sections	open	\N	f
builder_cta_section_links	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
work_item_solution	check	\N	{{solution_icon}}  {{solution_tagline}}	t	f	\N	\N	t	\N	\N	sort	all	\N	\N	2	\N	open	\N	f
work_item_issue	exclamation	\N	{{issue_icon}}  {{issue_tagline}}	t	f	\N	\N	t	\N	\N	sort	all	\N	\N	1	\N	open	\N	f
page	description	\N	{{guid}}	f	f	[{"language":"en-US","translation":"All Pages"}]	\N	t	\N	\N	sort	all	\N	\N	3	site_settings	open	\N	t
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
1f65b993-2f99-4801-bc43-f556b11cc08c	Analytics	dashboard	\N	2023-07-28 23:31:24.008+00	01f40a10-4a01-4469-aa3d-83cebee1e309	\N
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_extensions (name, enabled) FROM stdin;
generate-types:module	t
schema-management:module	t
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
98	meta_tag	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
100	meta_tag	meta_content	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
99	meta_tag	meta_name	\N	input	{"iconLeft":null}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
376	home_page	selected_page	m2o	select-dropdown-m2o	{"enableCreate":false,"template":"{{guid}}"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
379	builder_section_base_section_links	sort	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
497	validation_item	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
550	field_display_condition_item	value	\N	input	{"placeholder":"Field Value"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
289	page	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
405	generic_content_section	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
335	routes	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
406	generic_content_section	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
107	site_settings	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
290	page	sort	\N	input	\N	\N	\N	f	t	2	half	\N	\N	\N	f	\N	\N	\N
336	routes	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	2	half	\N	\N	\N	f	\N	\N	\N
388	route_item	navbar_appearance	alias,no-data,group	group-detail	{"headerIcon":"navigation"}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
392	page_footer	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
296	page	sections	m2a	list-m2a	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
108	site_settings	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	2	half	\N	\N	\N	f	\N	\N	\N
630	site_settings	site_name	\N	input	{"placeholder":"Your site name"}	\N	\N	f	f	3	full	\N	This name will display in your navbar and footer by default.	\N	f	\N	\N	\N
577	form_group	group_small_text	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
345	route_item	route_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	6	full	\N	\N	\N	f	\N	\N	\N
393	page_footer	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
394	footer_section	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
120	builder_section_image	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
121	builder_section_image	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
122	builder_section_image	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
123	builder_section_image	section_title	\N	input	{"iconLeft":"title"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
395	footer_section	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
125	builder_section_image	section_image	file	file-image	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
396	footer_section	heading	\N	input	{"iconLeft":"title"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
399	page_footer	sections	o2m	list-o2m	{"enableSelect":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
293	page	meta_title	\N	input	{"placeholder":"browser title for page, prefixed by site Title","iconLeft":"title"}	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
407	generic_content_section	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
294	page	og_title	\N	input	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N
341	page	page_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	16	full	\N	\N	\N	f	\N	\N	\N
498	validation_item	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
142	work_item_files	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
144	work_item_files	directus_files_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
624	builder_cta_section	links	m2a	list-m2a	{"enableSelect":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
627	builder_cta_section_links	item	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
628	builder_cta_section_links	sort	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
596	work_item_files_1	directus_files_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
368	route_item_page	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
299	page_sections	item	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
369	route_item_page	route_item_id	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
449	form_group	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
424	contact	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
625	builder_cta_section_links	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
199	highlighted_title	title	\N	input	{"iconLeft":"title"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
161	internal_link_button	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
162	internal_link_button	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
192	builder_section_base	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
163	internal_link_button	button_text	\N	input	{"iconLeft":"text_rotation_none"}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
193	builder_section_base	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	2	half	\N	\N	\N	f	\N	\N	\N
173	internal_link_button	type	\N	input	\N	\N	\N	t	t	3	full	\N	\N	\N	f	\N	\N	\N
165	external_link_button	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
166	external_link_button	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
174	external_link_button	type	\N	input	\N	\N	\N	t	t	3	full	\N	\N	\N	f	\N	\N	\N
167	external_link_button	button_text	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
169	external_link_button	button_external_link	\N	input	{"iconLeft":"insert_link"}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	{"_and":[{"button_external_link":{"_contains":"https://"}},{"_and":[]},{"button_external_link":{"_contains":"."}}]}	Invalid url format
175	icon	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
176	icon	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
178	icon	icon_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
198	highlighted_title	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
200	highlighted_title	highlighted_words	cast-json	tags	{"iconLeft":"format_ink_highlighter","alphabetize":true}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
201	builder_section_base	title	m2o	select-dropdown-m2o	{"template":"{{title}}","enableSelect":false}	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
195	builder_section_base	subtitle	\N	input	{"iconLeft":"subtitles"}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
206	builder_section_image	section_content	cast-json	input-block-editor	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
209	builder_section_base	content	cast-json	input-block-editor	{"folder":"70e171b2-dfcc-4fc6-9568-b8deb783a8c9"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
241	builder_section_base_section_links	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
242	builder_section_base_section_links	builder_section_base_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
243	builder_section_base_section_links	item	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
244	builder_section_base_section_links	collection	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
240	builder_section_base	section_links	m2a	list-m2a	{"enableSelect":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
179	icon	icon	\N	select-icon	\N	icon	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
177	internal_link_button	icons	o2m	list-o2m	{"template":"{{icon}}","enableSelect":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
246	external_link_button	icons	o2m	list-o2m	{"template":"{{icon}}","enableSelect":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
247	icon	icon_id_2	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
402	page_footer	copywrite_info	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
109	site_settings	global_meta_title	\N	input	{"placeholder":"Global Site Browser Title"}	\N	\N	f	f	4	full	\N	This will prefix other titles set in the "pages" collection eg [Global Title] | [Page Title]	\N	f	\N	\N	\N
380	site_settings	logo	file	file-image	{"folder":"7502ca94-957c-4abf-a79e-c30103699df2","crop":false}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
417	site_settings	social_links	o2m	list-o2m	{"template":"{{key}} -- {{link}}","enableSelect":false}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
501	form_field	validation_checks	o2m	list-o2m	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N
594	work_item_files_1	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
365	page	route_page_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	17	full	\N	\N	\N	f	\N	\N	\N
502	validation_item	form_field_validation_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
578	forms	submit_success_icon	\N	select-icon	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
297	page_sections	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
298	page_sections	page_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
300	page_sections	collection	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
626	builder_cta_section_links	builder_cta_section_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
404	page_footer	footer_button	m2o	select-dropdown-m2o	{"template":"{{route_link.parsed_route}} -- {{button_text}}"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
613	work_item_issue	issue_icon	\N	select-icon	\N	\N	\N	f	f	4	half	\N	\N	\N	f	\N	\N	\N
629	builder_cta_section_links	collection	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
346	page	is_home_page	cast-boolean	boolean	{"iconOn":"home","iconOff":"close","colorOff":"#BD0000","colorOn":"#5C1CD4","label":"Is home page"}	boolean	{"labelOn":null,"labelOff":null,"colorOn":"#25A923","colorOff":"#C42121","iconOn":"home"}	t	t	6	full	\N	\N	\N	f	\N	\N	\N
391	route_item	show_on_navbar	cast-boolean	boolean	{"label":"Visible on navbar"}	boolean	{"iconOn":"visibility","iconOff":"visibility_off","colorOff":"#5E5E5E","colorOn":"#24BDFF"}	f	f	2	full	\N	If the nav item should be visible on the site navbar or not	\N	f	navbar_appearance	\N	\N
303	meta_tag	tag_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
397	footer_section	links	o2m	list-o2m	{"enableCreate":false,"template":"{{parsed_route}}"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
292	page	guid	\N	input	{"iconLeft":"key"}	\N	\N	f	f	4	half	\N	Routing key for page, must be unique	\N	t	\N	\N	\N
400	footer_section	footer_section_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
401	page_footer	privacy_policy_route	m2o	select-dropdown-m2o	{"template":"{{parsed_route}}","enableCreate":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
413	social_link	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
389	route_item	navbar_label	\N	input	{"placeholder":"Label for the site navbar, if blank will use active page guid","iconLeft":"label"}	\N	\N	f	f	1	full	\N	\N	\N	f	navbar_appearance	\N	\N
337	route_item	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
344	routes	route_list	o2m	list-o2m	{"template":"{{parsed_route}} -- Page(s): {{route.guid}}","enableSelect":false,"layout":"table","fields":["parsed_route","show_on_navbar","navbar_label","active_page.guid"],"tableSpacing":"comfortable"}	related-values	{"template":null}	f	f	3	fill	[{"language":"en-US","translation":"Configure Routes"}]	Create your route from existing pages, the final route will be updated when saved	\N	f	\N	\N	\N
423	social_link	contact_social_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
408	generic_content_section	section_heading	m2o	select-dropdown-m2o	{"template":"{{title.title}}","enableSelect":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
339	route_item	parsed_route	\N	input	\N	formatted-value	{"bold":true,"italic":true,"color":"#3681E2"}	t	f	3	half	\N	Created automatically from route field	\N	f	\N	\N	\N
409	route_item	active_page	m2o	select-dropdown-m2o	{"template":"{{guid}}","enableCreate":false,"enableSelect":false}	\N	\N	t	f	4	half	\N	\N	\N	f	\N	\N	\N
367	route_item	route	m2m	list-m2m	{"enableCreate":false,"filter":{"_and":[{"is_home_page":{"_eq":false}}]},"template":"{{page_id.guid}}"}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
338	route_item	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
301	page	divider-whuzq5	alias,no-data	presentation-divider	{"title":"Page Meta","inlineTitle":true}	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
398	route_item	route_footer_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	8	full	\N	\N	\N	f	\N	\N	\N
370	route_item_page	page_id	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
342	home_page	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
418	social_link	social_link_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
414	social_link	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
416	social_link	link	\N	input	{"iconLeft":"link"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	{"_and":[{"_or":[{"link":{"_contains":"https://"}},{"link":{"_contains":"@"}}]},{"_and":[]},{"link":{"_contains":"."}}]}	Invalid Url or email
375	route_item_page	sort	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
302	page	meta_tags	o2m	list-o2m	{"enableSelect":false}	\N	\N	f	f	11	full	\N	Use only for generic seo tags, use OG section below for OpenGraph content	\N	f	\N	\N	\N
348	internal_link_button	route_link	m2o	select-dropdown-m2o	{"template":"{{parsed_route}}","enableCreate":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
305	page	divider-15f_1m	alias,no-data	presentation-divider	{"title":"OG Preview","inlineTitle":true}	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
295	page	og_description	\N	input	\N	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N
304	page	og_image	file	file-image	{"folder":"d5b7f883-29a2-43c6-bb72-02f20ef12214","crop":false}	\N	\N	f	f	15	full	\N	\N	\N	f	\N	\N	\N
366	page	route_sort	\N	\N	\N	\N	\N	f	t	18	full	\N	\N	\N	f	\N	\N	\N
425	contact	contact_links	o2m	list-o2m	{"template":"{{key}} / {{label}} -- {{link}}","enableCreate":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
426	social_link	contact_link_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
549	field_display_condition_item	name	\N	input	{"placeholder":"Field Name"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	{"_and":[{"name":{"_ncontains":" "}}]}	No spaces allowed
523	forms	form_name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
579	forms	submit_error_icon	\N	select-icon	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
614	work_item_solution	solution_icon	\N	select-icon	\N	\N	\N	f	f	4	half	\N	\N	\N	f	\N	\N	\N
500	validation_item	validation_fail_message	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
503	validation_item	description	\N	input-multiline	{"placeholder":"describe what the validation checks for"}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
421	social_link	label	\N	input	{"iconLeft":"label"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
415	social_link	key	\N	select-dropdown	{"choices":[{"text":"Email","value":"email"},{"text":"Twitter","value":"twitter"},{"text":"Youtube","value":"youtube"},{"text":"Github","value":"github"},{"text":"Linkedin","value":"linkedin"},{"text":"Facebook","value":"facebook"},{"text":"Trustpilot","value":"trustpilot"},{"text":"Telegram","value":"telegram"},{"text":"Whatsapp","value":"whatsapp"}],"icon":"group"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
504	validation_item	label	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
538	form_section	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
539	form_section	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
540	form_section	section_heading	m2o	select-dropdown-m2o	{"enableSelect":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
541	form_section	form_item	m2o	select-dropdown-m2o	{"enableCreate":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
551	form_field	label	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
565	form_field	field_icon	\N	select-icon	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
615	work_item_issue	issue_tagline	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N
291	page	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
360	page	is_dynamic	cast-boolean	boolean	\N	\N	\N	f	f	5	half	[{"language":"en-US","translation":"Enable Dynamic Routing"}]	Dynamic pages pass don't have a fixed guid and instead pass the id from the route to their child components	\N	f	\N	\N	\N
521	form_group	form_group_list_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	7	full	\N	\N	\N	f	\N	\N	\N
514	forms	post_url	\N	input	{"placeholder":"Url that the form data is posted to","iconLeft":"link"}	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
516	forms	grouped_container	alias,no-data,group	group-raw	\N	\N	\N	f	f	10	full	\N	\N	[{"name":"Show for grouped","rule":{"_and":[{"grouped":{"_eq":false}}]},"readonly":true,"hidden":true,"options":{}}]	f	\N	\N	\N
447	multi_step_form	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
601	work_item_issue	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
519	form_field	form_list_field_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
566	form_field	dynamic_option_icon_field	\N	input	{"placeholder":"Leave blank to ignore"}	\N	\N	f	f	5	full	\N	\N	\N	f	dynamic_options_settings	\N	\N
602	work_item_issue	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
605	work_item_solution	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
606	work_item_solution	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
616	work_item_solution	solution_tagline	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N
567	forms	on_submit_error	cast-json	input-block-editor	{"tools":["header","paragraph"]}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
527	validation_check	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
528	validation_check	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
530	validation_check	condition	\N	select-dropdown	{"choices":[{"text":"Equals","value":"==="},{"text":"Not Equals","value":"!=="},{"text":"Regex","value":"regex"},{"text":"Contains","value":"contains"},{"text":"Less Than","value":"<"},{"text":"More Than","value":">"},{"text":"Less Than Inclusive","value":"<="},{"text":"More Than Inclusive","value":">="},{"text":"Length More Than","value":"lengthMoreThan"},{"text":"Length Less Than","value":"lengthLessThan"},{"text":"Length More Than Inclusive","value":"lengthMoreThanInclusive"},{"text":"Length Less Than Inclusive","value":"lengthLessThanInclusive"}]}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
531	validation_check	value	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	[]	f	\N	\N	\N
544	field_display_condition_item	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
548	field_display_condition_item	field_display_condition_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
450	form_field	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
451	form_field	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
553	form_field	real_time_validation	cast-boolean	boolean	{"label":"Enable real time validation"}	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N
448	form_group	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
478	form_group	form_group_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
484	form_group	group_label	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
453	form_field	name	\N	input	{}	\N	\N	f	f	5	full	\N	Field name should be unique per FORM, not group, duplicate names will have their values overridden by each other	\N	t	\N	{"_and":[{"name":{"_ncontains":" "}}]}	No spaces allowed
455	form_field	type	\N	select-dropdown	{"choices":[{"text":"Text","value":"text"},{"text":"Number","value":"number"},{"text":"Textarea","value":"textarea"},{"text":"Checkbox","value":"checkbox"},{"text":"Select Single","value":"selectSingle"},{"text":"Select Multi","value":"selectMulti"},{"text":"Select Button","value":"selectButton"},{"text":"Date","value":"date"},{"text":"Date Time","value":"dateTime"},{"text":"Time","value":"time"}]}	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
459	form_field	static_options	alias,no-data,group	group-detail	\N	\N	\N	f	f	2	full	\N	\N	[{"name":"Hide for dynamic","rule":{"_and":[{"dynamic_options":{"_eq":true}}]},"readonly":true,"hidden":true,"options":{"start":"open"}}]	f	for_select	\N	\N
470	multi_step_form_section	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
471	multi_step_form_section	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
472	multi_step_form_section	section_heading	m2o	select-dropdown-m2o	{"enableSelect":false}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
482	form_group	fields	o2m	list-o2m	{"template":"{{name}} ( {{type}} )","fields":["field_icon"]}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
618	builder_cta_section	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
452	form_field	placeholder	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
486	form_field	required	cast-boolean	boolean	{"label":"Required"}	\N	\N	f	f	10	full	\N	If the field is required or not	\N	f	\N	\N	\N
456	form_field	dynamic_options	cast-boolean	boolean	{"label":"Use Dynamic Options"}	\N	\N	f	f	1	full	\N	\N	\N	f	for_select	\N	\N
458	form_field	dynamic_options_settings	alias,no-data,group	group-detail	\N	\N	\N	f	f	3	full	\N	\N	[{"name":"Hide for static","rule":{"_and":[{"dynamic_options":{"_eq":false}}]},"readonly":true,"hidden":true,"options":{"start":"open"}}]	f	for_select	\N	\N
619	builder_cta_section	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
547	form_field	display_conditions	o2m	list-o2m	{"enableSelect":false}	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
454	form_field	for_select	alias,no-data,group	group-detail	{"headerIcon":"format_list_bulleted","start":"closed"}	\N	\N	f	f	16	full	\N	Options for input select type, ignore for other types	[{"name":"Show For Select","rule":{"_and":[{"type":{"_neq":"selectSingle"}},{"_and":[]},{"type":{"_neq":"selectMulti"}},{"type":{"_neq":"selectButton"}}]},"readonly":true,"options":{"start":"open"},"hidden":true}]	f	\N	\N	\N
620	builder_cta_section	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
621	builder_cta_section	title	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
487	form_field	dynamic_options_data_field	\N	input	\N	\N	\N	f	f	2	full	\N	Field for accessing top level data of fetch request, delete if no top level exists	\N	t	dynamic_options_settings	\N	\N
479	multi_step_form	form_post_url	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
480	multi_step_form_section	form_content	m2o	select-dropdown-m2o	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
533	validation_item	checks	o2m	list-o2m	{}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
460	form_field	dynamic_option_label_field	\N	input	{"placeholder":"syntax: fieldName, for nested: fieldParent.fieldName"}	\N	\N	f	f	3	half	\N	field from the fetched data that contains the label value	\N	f	dynamic_options_settings	\N	\N
483	form_field	form_field_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N
513	forms	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
561	analytics_events_day	event	\N	input	\N	\N	\N	t	f	\N	half	\N	\N	\N	f	\N	\N	\N
568	forms	on_submit_success	cast-json	input-block-editor	{"tools":["header","nestedlist","paragraph","underline"]}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
477	multi_step_form	form_groups	o2m	list-o2m	{"template":"{{group_label}} -- [{{fields.name}}]"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
583	builder_section_base	header_anchor_tag	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
461	form_field	dynamic_option_value_field	\N	input	{"placeholder":"syntax: fieldName, for nested: fieldParent.fieldName"}	\N	\N	f	f	4	half	\N	Field name of fetch data that contains the value for the option	\N	f	dynamic_options_settings	\N	\N
462	form_field	static_options_list	cast-json	list	{"fields":[{"field":"label","name":"label","type":"string","meta":{"field":"label","width":"half","type":"string","interface":"input","note":"Option Label","required":true}},{"field":"value","name":"value","type":"string","meta":{"field":"value","width":"half","type":"string","interface":"input","note":"option value","required":true}}],"addLabel":"Create Option","template":"{{label}} : {{value}}"}	\N	\N	f	f	1	full	\N	\N	\N	f	static_options	\N	\N
623	internal_link_button	cta_section_link_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
489	form_field	autocomplete_enabled	cast-boolean	boolean	{"label":"Autocomplete Enabled"}	\N	\N	f	f	1	full	\N	\N	\N	f	autocomplete_options	\N	\N
490	form_field	autocomplete_details	alias,no-data,group	group-raw	\N	\N	\N	f	f	2	full	\N	\N	[{"name":"Show if autocomplete enabled","rule":{"_and":[{"autocomplete_enabled":{"_eq":false}}]},"readonly":true,"hidden":true,"options":{}}]	f	autocomplete_options	\N	\N
491	form_field	autocomplete_value	\N	input	\N	\N	\N	f	f	1	full	\N	See available values here: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete	\N	f	autocomplete_details	\N	\N
515	forms	grouped	cast-boolean	boolean	{"label":"Grouped"}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
517	forms	normal_container	alias,no-data,group	group-raw	\N	\N	\N	f	f	9	full	\N	\N	[{"name":"Show For normal","rule":{"_and":[{"grouped":{"_eq":true}}]},"readonly":true,"hidden":true,"options":{}}]	f	\N	\N	\N
558	analytics_events_day	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
559	analytics_events_day	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
457	form_field	dynamic_options_fetch_url	\N	input	{"placeholder":"Url for dynamic options list, must be an array of objects"}	\N	\N	f	f	1	full	\N	\N	\N	f	dynamic_options_settings	\N	\N
492	form_field	note	\N	input	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
488	form_field	autocomplete_options	alias,no-data,group	group-detail	\N	\N	\N	f	f	15	full	\N	\N	[{"name":"Show For Autocomplete compatible","rule":{"_and":[{"type":{"_eq":"checkbox"}},{"_and":[]},{"type":{"_eq":"selectSingle"}},{"_and":[]},{"type":{"_eq":"selectMulti"}}]},"readonly":true,"hidden":true,"options":{"start":"open"}}]	f	\N	\N	\N
518	forms	field_list	o2m	list-o2m	\N	\N	\N	f	f	1	full	\N	\N	\N	f	normal_container	\N	\N
520	forms	group_list	o2m	list-o2m	\N	\N	\N	f	f	1	full	\N	\N	\N	f	grouped_container	\N	\N
534	validation_check	validation_item_check_id	\N	select-dropdown-m2o	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y) FROM stdin;
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
9f12872c-3103-4acc-8e79-21f2d035fb83	Auto Create Route	directions	\N	Creates the parsed route from a route item	active	event	\N	{"type":"action","scope":["items.update","items.create"],"collections":["route_item"]}	155fd479-212f-4a0b-9e70-ed03f1745b53	2023-06-28 15:37:28.599+00	01f40a10-4a01-4469-aa3d-83cebee1e309
3a273d37-ff6b-41c1-a7db-f37713b676bc	Data To Array	data_array	\N	Transforms array of objects to array of values based on key passed in	active	operation	\N	{"return":"$last"}	b5073623-4fb5-4655-a286-5d526d80de59	2023-06-29 16:54:15.171+00	01f40a10-4a01-4469-aa3d-83cebee1e309
cb86a4b4-e9b1-4fdf-99dc-846cc26194fc	Parse Keys	key	\N	Parses the keys from an update or create trigger so they are of homogeneous structure	active	operation	\N	{"return":"$last"}	cff51d3f-b717-4554-945f-5715adf75c66	2023-06-28 23:18:33.596+00	01f40a10-4a01-4469-aa3d-83cebee1e309
2d90e591-d174-4809-b1d0-adf2da347e3a	Set Home Page	home	\N	Sets home page boolean when home page is chosen	active	event	\N	{"type":"action","scope":["items.update"],"collections":["home_page"]}	8e914ebc-3e6f-4b3d-84bd-ccdcf48b2f5b	2023-06-28 15:55:42.764+00	01f40a10-4a01-4469-aa3d-83cebee1e309
da763f86-9808-462b-b2cc-8f1a44d5c398	Log Analytics Event	bolt	\N	\N	active	webhook	all	{"cacheEnabled":false,"async":true}	\N	2023-07-28 23:50:08.627+00	01f40a10-4a01-4469-aa3d-83cebee1e309
e54e8c78-7fab-43a2-8687-01e97c737d56	Auto Guid	bolt	\N	\N	inactive	event	all	{"type":"filter","scope":["items.create","items.update"]}	da639558-12d3-4842-bf68-a0cab93f8597	2023-09-29 16:27:53.139+00	01f40a10-4a01-4469-aa3d-83cebee1e309
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2023-01-21 01:13:41.385137+00
20201029A	Remove System Relations	2023-01-21 01:13:41.390235+00
20201029B	Remove System Collections	2023-01-21 01:13:41.393773+00
20201029C	Remove System Fields	2023-01-21 01:13:41.414663+00
20201105A	Add Cascade System Relations	2023-01-21 01:13:41.446167+00
20201105B	Change Webhook URL Type	2023-01-21 01:13:41.450869+00
20210225A	Add Relations Sort Field	2023-01-21 01:13:41.454819+00
20210304A	Remove Locked Fields	2023-01-21 01:13:41.458197+00
20210312A	Webhooks Collections Text	2023-01-21 01:13:41.461944+00
20210331A	Add Refresh Interval	2023-01-21 01:13:41.464428+00
20210415A	Make Filesize Nullable	2023-01-21 01:13:41.468448+00
20210416A	Add Collections Accountability	2023-01-21 01:13:41.473301+00
20210422A	Remove Files Interface	2023-01-21 01:13:41.47584+00
20210506A	Rename Interfaces	2023-01-21 01:13:41.500917+00
20210510A	Restructure Relations	2023-01-21 01:13:41.518468+00
20210518A	Add Foreign Key Constraints	2023-01-21 01:13:41.527116+00
20210519A	Add System Fk Triggers	2023-01-21 01:13:41.547802+00
20210521A	Add Collections Icon Color	2023-01-21 01:13:41.550083+00
20210525A	Add Insights	2023-01-21 01:13:41.569409+00
20210608A	Add Deep Clone Config	2023-01-21 01:13:41.571941+00
20210626A	Change Filesize Bigint	2023-01-21 01:13:41.582173+00
20210716A	Add Conditions to Fields	2023-01-21 01:13:41.584646+00
20210721A	Add Default Folder	2023-01-21 01:13:41.588635+00
20210802A	Replace Groups	2023-01-21 01:13:41.592139+00
20210803A	Add Required to Fields	2023-01-21 01:13:41.594763+00
20210805A	Update Groups	2023-01-21 01:13:41.597368+00
20210805B	Change Image Metadata Structure	2023-01-21 01:13:41.599877+00
20210811A	Add Geometry Config	2023-01-21 01:13:41.602154+00
20210831A	Remove Limit Column	2023-01-21 01:13:41.604318+00
20210903A	Add Auth Provider	2023-01-21 01:13:41.616494+00
20210907A	Webhooks Collections Not Null	2023-01-21 01:13:41.620625+00
20210910A	Move Module Setup	2023-01-21 01:13:41.623895+00
20210920A	Webhooks URL Not Null	2023-01-21 01:13:41.6279+00
20210924A	Add Collection Organization	2023-01-21 01:13:41.631935+00
20210927A	Replace Fields Group	2023-01-21 01:13:41.637492+00
20210927B	Replace M2M Interface	2023-01-21 01:13:41.639776+00
20210929A	Rename Login Action	2023-01-21 01:13:41.641981+00
20211007A	Update Presets	2023-01-21 01:13:41.646091+00
20211009A	Add Auth Data	2023-01-21 01:13:41.650409+00
20211016A	Add Webhook Headers	2023-01-21 01:13:41.6529+00
20211103A	Set Unique to User Token	2023-01-21 01:13:41.657238+00
20211103B	Update Special Geometry	2023-01-21 01:13:41.659851+00
20211104A	Remove Collections Listing	2023-01-21 01:13:41.662137+00
20211118A	Add Notifications	2023-01-21 01:13:41.674475+00
20211211A	Add Shares	2023-01-21 01:13:41.691494+00
20211230A	Add Project Descriptor	2023-01-21 01:13:41.694054+00
20220303A	Remove Default Project Color	2023-01-21 01:13:41.697896+00
20220308A	Add Bookmark Icon and Color	2023-01-21 01:13:41.700408+00
20220314A	Add Translation Strings	2023-01-21 01:13:41.702544+00
20220322A	Rename Field Typecast Flags	2023-01-21 01:13:41.705076+00
20220323A	Add Field Validation	2023-01-21 01:13:41.707257+00
20220325A	Fix Typecast Flags	2023-01-21 01:13:41.709443+00
20220325B	Add Default Language	2023-01-21 01:13:41.714722+00
20220402A	Remove Default Value Panel Icon	2023-01-21 01:13:41.719057+00
20220429A	Add Flows	2023-01-21 01:13:41.751105+00
20220429B	Add Color to Insights Icon	2023-01-21 01:13:41.754489+00
20220429C	Drop Non Null From IP of Activity	2023-01-21 01:13:41.757682+00
20220429D	Drop Non Null From Sender of Notifications	2023-01-21 01:13:41.761462+00
20220614A	Rename Hook Trigger to Event	2023-01-21 01:13:41.76432+00
20220801A	Update Notifications Timestamp Column	2023-01-21 01:13:41.769369+00
20220802A	Add Custom Aspect Ratios	2023-01-21 01:13:41.77244+00
20220826A	Add Origin to Accountability	2023-01-21 01:13:41.77644+00
20230401A	Update Material Icons	2023-05-23 12:41:12.800356+00
20230525A	Add Preview Settings	2023-06-29 11:54:48.214129+00
20230526A	Migrate Translation Strings	2023-06-29 11:54:48.240231+00
20230721A	Require Shares Fields	2024-01-10 12:46:05.555641+00
20230823A	Add Content Versioning	2024-01-10 12:46:05.637355+00
20230927A	Themes	2024-01-10 12:46:05.688139+00
20231009A	Update CSV Fields to Text	2024-01-10 12:46:05.697789+00
20231009B	Update Panel Options	2024-01-10 12:46:05.704654+00
20231010A	Add Extensions	2024-01-10 12:46:05.716614+00
20231215A	Add Focalpoints	2024-02-23 14:18:40.746525+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
e3a334b4-e298-4f1f-a042-bc0e9149d4b1	Update Data	item_update_841rj	item-update	55	1	{"payload":{"is_home_page":true},"query":{"filter":{"guid":{"_eq":"{{selected_page[0].guid}}"}}},"collection":"page","key":["{{selected_page.id}}"]}	\N	\N	2d90e591-d174-4809-b1d0-adf2da347e3a	2023-06-28 16:14:30.819+00	01f40a10-4a01-4469-aa3d-83cebee1e309
d787bf65-9211-4391-a89f-9fd6e580db29	Update Data	item_update_r9uo8	item-update	58	18	{"collection":"route_item","payload":{"parsed_route":"{{constructed_route.route}}","active_page":"{{constructed_route.activeId}}"},"key":["{{trigger_id.id}}"]}	\N	\N	9f12872c-3103-4acc-8e79-21f2d035fb83	2023-06-28 22:56:47.476+00	01f40a10-4a01-4469-aa3d-83cebee1e309
7aa8dfdb-18c1-4743-9772-a9e13d3a26af	Update Data	item_update_z1uqc	item-update	37	1	{"collection":"page","payload":{"is_home_page":false},"query":null}	e3a334b4-e298-4f1f-a042-bc0e9149d4b1	\N	2d90e591-d174-4809-b1d0-adf2da347e3a	2023-06-28 16:14:30.828+00	01f40a10-4a01-4469-aa3d-83cebee1e309
8e914ebc-3e6f-4b3d-84bd-ccdcf48b2f5b	Read Data	selected_page	item-read	19	1	{"collection":"page","key":["{{$trigger.payload.selected_page}}"],"query":null}	7aa8dfdb-18c1-4743-9772-a9e13d3a26af	\N	2d90e591-d174-4809-b1d0-adf2da347e3a	2023-06-28 16:22:53.171+00	01f40a10-4a01-4469-aa3d-83cebee1e309
e96f2645-e122-41f1-bba3-81f8cc35c48e	Run Script	constructed_route	exec	40	18	{"code":"module.exports = async function (data) {\\n    let constructedRoute = '/'\\n    \\n    const sortedIds = data.page_ids.mapped\\n    let pageGuids = data.route_page_guids\\n    \\n    if(!Array.isArray(pageGuids)) {\\n        pageGuids = [pageGuids]\\n    }\\n    \\n    pageGuids.sort((a, b) => {\\n    \\treturn sortedIds.indexOf(a.id) - sortedIds.indexOf(b.id)\\n    })\\n\\n    pageGuids.forEach((val) => {\\n        if (val?.guid) {\\n            const append = val?.is_dynamic ? ':dynamicGuid/' : val.guid + '/'\\n            constructedRoute += append\\n        }\\n    })\\n    \\n    if(constructedRoute.length) {\\n       constructedRoute = constructedRoute.slice(0, constructedRoute.length - 1) \\n    }\\n\\n    return {\\"route\\" : constructedRoute, \\"activeId\\": pageGuids.at(-1)?.id ?? null}\\n}\\n"}	d787bf65-9211-4391-a89f-9fd6e580db29	\N	9f12872c-3103-4acc-8e79-21f2d035fb83	2023-06-28 22:22:43.138+00	01f40a10-4a01-4469-aa3d-83cebee1e309
5d3b78e0-7e41-4685-86e6-4ba60a841414	Read Data	route_page_guids	item-read	22	18	{"collection":"page","key":"{{page_ids.mapped}}"}	e96f2645-e122-41f1-bba3-81f8cc35c48e	\N	9f12872c-3103-4acc-8e79-21f2d035fb83	2023-06-28 20:35:27.528+00	01f40a10-4a01-4469-aa3d-83cebee1e309
cff51d3f-b717-4554-945f-5715adf75c66	Run Script	trigger_id	exec	20	1	{"code":"module.exports = async function(data) {\\n    \\n    const trigger = data?.$trigger?.$trigger_in\\n    \\n    if(trigger?.keys) {\\n        return {id : trigger.keys[0]}\\n    }\\n    \\n    if(trigger?.key) {\\n        return {id : trigger.key}\\n    }\\n\\n    return {id : undefined} \\n}"}	\N	\N	cb86a4b4-e9b1-4fdf-99dc-846cc26194fc	2023-06-28 23:22:09.263+00	01f40a10-4a01-4469-aa3d-83cebee1e309
a0e9816a-0684-4699-b73f-5ae3be5c6a46	Get Page Ids	page_ids	trigger	21	34	{"flow":"3a273d37-ff6b-41c1-a7db-f37713b676bc","payload":{"key":"page_id","data":"{{route_pages}}"}}	5d3b78e0-7e41-4685-86e6-4ba60a841414	\N	9f12872c-3103-4acc-8e79-21f2d035fb83	2023-06-29 17:00:57.451+00	01f40a10-4a01-4469-aa3d-83cebee1e309
52c43356-e247-4bd7-b735-0efeb0581d8e	Route Page Junction Read	route_pages	item-read	3	34	{"collection":"route_item_page","key":"{{route_full.route}}","query":{"sort":"sort"}}	a0e9816a-0684-4699-b73f-5ae3be5c6a46	\N	9f12872c-3103-4acc-8e79-21f2d035fb83	2023-06-29 16:51:10.194+00	01f40a10-4a01-4469-aa3d-83cebee1e309
2ce7198b-c9c2-4a09-ab6e-db9bbcc5ae15	Read Data	route_full	item-read	3	18	{"collection":"route_item","query":null,"key":["{{trigger_id.id}}"]}	52c43356-e247-4bd7-b735-0efeb0581d8e	\N	9f12872c-3103-4acc-8e79-21f2d035fb83	2023-06-28 17:33:52.214+00	01f40a10-4a01-4469-aa3d-83cebee1e309
155fd479-212f-4a0b-9e70-ed03f1745b53	Parse Ids	trigger_id	trigger	19	1	{"flow":"cb86a4b4-e9b1-4fdf-99dc-846cc26194fc","payload":{"$trigger_in":"{{$trigger}}"}}	2ce7198b-c9c2-4a09-ab6e-db9bbcc5ae15	\N	9f12872c-3103-4acc-8e79-21f2d035fb83	2023-06-28 23:25:54.696+00	01f40a10-4a01-4469-aa3d-83cebee1e309
5127aa59-eacd-467c-ba9b-eb740f8d7171	Log to Console	log_uwqz4	log	41	1	{"message":"{{$last}} -- {{$trigger}} -- {{trigger_id}}"}	\N	\N	9f12872c-3103-4acc-8e79-21f2d035fb83	2023-06-28 17:36:33.338+00	01f40a10-4a01-4469-aa3d-83cebee1e309
b5073623-4fb5-4655-a286-5d526d80de59	Run Script	exec_lejhj	exec	19	1	{"code":"module.exports = async function(data) {\\n\\t\\n    let {data :dataIn, key} = data.$trigger\\n    \\n    if(!dataIn || !key) {\\n        throw new Error('data or key fields missing')\\n        return {}\\n    }\\n    \\n    dataIn = Array.isArray(dataIn) ? dataIn : [dataIn]\\n    \\n    const mapped = dataIn.map((val) => {\\n        return val?.[data.$trigger.key] ?? undefined\\n    })\\n    \\n    return {mapped : mapped}\\n}"}	\N	\N	3a273d37-ff6b-41c1-a7db-f37713b676bc	2023-06-29 16:58:49.397+00	01f40a10-4a01-4469-aa3d-83cebee1e309
da639558-12d3-4842-bf68-a0cab93f8597	Create Guid	create_guid	exec	19	1	{"code":"module.exports = async function(data) {\\n    \\n    const payload = data.$trigger.payload\\n    \\n\\tif(!('name' in payload)) {\\n        return {\\n        \\t\\"guid\\": data\\n        };\\n    }\\n    \\n    payload.guid = payload.name.replace(/[^a-z A-Z0-9]/g, '').trim().replace(/\\\\s+/g,\\"-\\").toLowerCase()\\n    \\n    return data;\\n}"}	\N	\N	e54e8c78-7fab-43a2-8687-01e97c737d56	2023-09-29 16:28:13.339+00	01f40a10-4a01-4469-aa3d-83cebee1e309
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
147	23c2a622-ecca-4f42-a52b-b663aef2142e	directus_files	read	\N	\N	\N	filename_download,id,description,title,tags,width,height,uploaded_on,filesize,type,$thumbnail
71	\N	directus_files	read	{}	{}	\N	*
109	23c2a622-ecca-4f42-a52b-b663aef2142e	builder_cta_section	read	{}	{}	\N	*
110	23c2a622-ecca-4f42-a52b-b663aef2142e	builder_cta_section_links	read	{}	{}	\N	*
111	23c2a622-ecca-4f42-a52b-b663aef2142e	builder_section_base	read	{}	{}	\N	*
112	23c2a622-ecca-4f42-a52b-b663aef2142e	builder_section_base_section_links	read	{}	{}	\N	*
113	23c2a622-ecca-4f42-a52b-b663aef2142e	builder_section_image	read	{}	{}	\N	*
114	23c2a622-ecca-4f42-a52b-b663aef2142e	contact	read	{}	{}	\N	*
115	23c2a622-ecca-4f42-a52b-b663aef2142e	external_link_button	read	{}	{}	\N	*
116	23c2a622-ecca-4f42-a52b-b663aef2142e	field_display_condition_item	read	{}	{}	\N	*
117	23c2a622-ecca-4f42-a52b-b663aef2142e	footer_section	read	{}	{}	\N	*
118	23c2a622-ecca-4f42-a52b-b663aef2142e	form_field	read	{}	{}	\N	*
119	23c2a622-ecca-4f42-a52b-b663aef2142e	form_group	read	{}	{}	\N	*
120	23c2a622-ecca-4f42-a52b-b663aef2142e	form_section	read	{}	{}	\N	*
121	23c2a622-ecca-4f42-a52b-b663aef2142e	forms	read	{}	{}	\N	*
122	23c2a622-ecca-4f42-a52b-b663aef2142e	generic_content_section	read	{}	{}	\N	*
123	23c2a622-ecca-4f42-a52b-b663aef2142e	highlighted_title	read	{}	{}	\N	*
124	23c2a622-ecca-4f42-a52b-b663aef2142e	home_page	read	{}	{}	\N	*
125	23c2a622-ecca-4f42-a52b-b663aef2142e	icon	read	{}	{}	\N	*
126	23c2a622-ecca-4f42-a52b-b663aef2142e	internal_link_button	read	{}	{}	\N	*
127	23c2a622-ecca-4f42-a52b-b663aef2142e	meta_tag	read	{}	{}	\N	*
128	23c2a622-ecca-4f42-a52b-b663aef2142e	multi_step_form	read	{}	{}	\N	*
129	23c2a622-ecca-4f42-a52b-b663aef2142e	multi_step_form_section	read	{}	{}	\N	*
130	23c2a622-ecca-4f42-a52b-b663aef2142e	page	read	{}	{}	\N	*
131	23c2a622-ecca-4f42-a52b-b663aef2142e	page_footer	read	{}	{}	\N	*
132	23c2a622-ecca-4f42-a52b-b663aef2142e	page_sections	read	{}	{}	\N	*
134	23c2a622-ecca-4f42-a52b-b663aef2142e	route_item	read	{}	{}	\N	*
135	23c2a622-ecca-4f42-a52b-b663aef2142e	route_item_page	read	{}	{}	\N	*
136	23c2a622-ecca-4f42-a52b-b663aef2142e	routes	read	{}	{}	\N	*
137	23c2a622-ecca-4f42-a52b-b663aef2142e	site_settings	read	{}	{}	\N	*
138	23c2a622-ecca-4f42-a52b-b663aef2142e	social_link	read	{}	{}	\N	*
139	23c2a622-ecca-4f42-a52b-b663aef2142e	validation_check	read	{}	{}	\N	*
140	23c2a622-ecca-4f42-a52b-b663aef2142e	validation_item	read	{}	{}	\N	*
141	23c2a622-ecca-4f42-a52b-b663aef2142e	work_item_files	read	{}	{}	\N	*
142	23c2a622-ecca-4f42-a52b-b663aef2142e	work_item_files_1	read	{}	{}	\N	*
143	23c2a622-ecca-4f42-a52b-b663aef2142e	work_item_issue	read	{}	{}	\N	*
144	23c2a622-ecca-4f42-a52b-b663aef2142e	work_item_solution	read	{}	{}	\N	*
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
25	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	internal_link_button	\N	tabular	{"tabular":{"limit":25,"fields":["button_text","route_link.parsed_route","icons.icon"]},"cards":{"limit":25}}	\N	\N	\N	bookmark	\N
23	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	route_item_page	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
20	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	route_item	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
19	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	page_sections	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
29	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	form_field	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
14	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	directus_webhooks	\N	tabular	{"tabular":{"fields":["status","method","name","collections","actions"],"limit":25}}	{"tabular":{"widths":{"status":32,"method":100,"name":210,"collections":240,"actions":210}}}	\N	\N	bookmark	\N
30	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	forms	\N	\N	{"tabular":{"limit":25,"fields":["form_name","post_url","grouped"],"page":1}}	{"tabular":{"widths":{"form_name":255,"post_url":433}}}	\N	\N	bookmark	\N
7	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1,"limit":25}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark_border	\N
26	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	directus_presets	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
33	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	directus_translations	\N	\N	{"tabular":{"limit":25}}	\N	\N	\N	bookmark	\N
1	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1,"limit":25}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark_border	\N
16	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	page	\N	\N	{"tabular":{"limit":25,"fields":["id","guid","meta_title","is_home_page"],"page":1}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
22	\N	01f40a10-4a01-4469-aa3d-83cebee1e309	\N	directus_activity	\N	tabular	{"tabular":{"sort":["-timestamp"],"fields":["action","collection","timestamp","user"],"limit":25,"page":1}}	{"tabular":{"widths":{"action":100,"collection":210,"timestamp":240,"user":240}}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
13	builder_section_image	section_image	directus_files	\N	\N	\N	\N	\N	nullify
15	work_item_files	directus_files_id	directus_files	\N	\N	\N	work_item_id	\N	nullify
25	builder_section_base	title	highlighted_title	\N	\N	\N	\N	\N	nullify
72	route_item_page	page_id	page	\N	\N	\N	route_item_id	\N	nullify
38	builder_section_base_section_links	item	\N	\N	collection	external_link_button,internal_link_button	builder_section_base_id	\N	nullify
51	page_sections	page_id	page	sections	\N	\N	item	\N	nullify
21	icon	icon_id	internal_link_button	icons	\N	\N	\N	sort	nullify
40	icon	icon_id_2	external_link_button	icons	\N	\N	\N	sort	nullify
52	meta_tag	tag_id	page	meta_tags	\N	\N	\N	\N	nullify
53	page	og_image	directus_files	\N	\N	\N	\N	\N	nullify
73	route_item_page	route_item_id	route_item	route	\N	\N	page_id	sort	delete
75	home_page	selected_page	page	\N	\N	\N	\N	\N	nullify
39	builder_section_base_section_links	builder_section_base_id	builder_section_base	section_links	\N	\N	item	sort	delete
78	site_settings	logo	directus_files	\N	\N	\N	\N	\N	nullify
80	footer_section	footer_section_id	page_footer	sections	\N	\N	\N	sort	delete
65	route_item	route_id	routes	route_list	\N	\N	\N	sort	delete
66	internal_link_button	route_link	route_item	\N	\N	\N	\N	\N	nullify
81	page_footer	privacy_policy_route	route_item	\N	\N	\N	\N	\N	nullify
63	page	page_id	route_item	\N	\N	\N	\N	sort	nullify
71	page	route_page_id	route_item	\N	\N	\N	\N	route_sort	nullify
79	route_item	route_footer_id	footer_section	links	\N	\N	\N	sort	nullify
82	page_footer	footer_button	internal_link_button	\N	\N	\N	\N	\N	nullify
83	generic_content_section	section_heading	builder_section_base	\N	\N	\N	\N	\N	nullify
102	validation_item	form_field_validation_id	form_field	validation_checks	\N	\N	\N	\N	nullify
84	route_item	active_page	page	\N	\N	\N	\N	\N	nullify
85	social_link	social_link_id	site_settings	social_links	\N	\N	\N	\N	delete
94	multi_step_form_section	section_heading	builder_section_base	\N	\N	\N	\N	\N	nullify
86	social_link	contact_social_id	page_footer	\N	\N	\N	\N	sort	nullify
87	social_link	contact_link_id	contact	contact_links	\N	\N	\N	sort	nullify
103	form_field	form_list_field_id	forms	field_list	\N	\N	\N	\N	nullify
98	form_group	form_group_id	multi_step_form	form_groups	\N	\N	\N	\N	nullify
99	multi_step_form_section	form_content	multi_step_form	\N	\N	\N	\N	\N	nullify
104	form_group	form_group_list_id	forms	group_list	\N	\N	\N	sort	nullify
106	validation_check	validation_item_check_id	validation_item	checks	\N	\N	\N	sort	nullify
108	form_section	section_heading	builder_section_base	\N	\N	\N	\N	\N	nullify
109	form_section	form_item	forms	\N	\N	\N	\N	\N	nullify
122	internal_link_button	cta_section_link_id	builder_cta_section	\N	\N	\N	\N	sort	delete
111	field_display_condition_item	field_display_condition_id	form_field	display_conditions	\N	\N	\N	\N	delete
101	form_field	form_field_id	form_group	fields	\N	\N	\N	sort	nullify
117	work_item_files_1	directus_files_id	directus_files	\N	\N	\N	work_item_id	\N	nullify
123	builder_cta_section_links	item	\N	\N	collection	external_link_button,internal_link_button	builder_cta_section_id	\N	nullify
124	builder_cta_section_links	builder_cta_section_id	builder_cta_section	links	\N	\N	item	sort	delete
50	page_sections	item	\N	\N	collection	generic_content_section,form_section,builder_cta_section	page_id	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
49ecab76-e2f1-4af8-8896-87c11b5fdc99	Administrator	verified	$t:admin_description	\N	f	t	t
23c2a622-ecca-4f42-a52b-b663aef2142e	web api	language	\N	\N	f	f	f
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
giZ8jZCRJdPDhXQKixR7fY_RYRS86FUtODjn7_WUeuOSuKAmaKgH_AMlF6sHQAPl	01f40a10-4a01-4469-aa3d-83cebee1e309	2024-03-03 00:12:48.458+00	2a00:23c6:7523:1a01:99ae:7baa:7b10:b8d0	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123.0	\N	https://eclwebdesign.co.uk
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides) FROM stdin;
1	New Site	\N	#FFFFFF	\N	\N	\N	\N	25	/^.{8,}$/	all	\N	\N	\N	\N	\N	[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"generate-types","enabled":true},{"type":"module","id":"schema-management-module","enabled":false}]	\N	en-US	\N	\N	auto	Directus Color Match	\N	Directus Default	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
01f40a10-4a01-4469-aa3d-83cebee1e309	Admin	User	elliottloxley@gmail.com	$argon2id$v=19$m=65536,t=3,p=4$y/clelMjPYaQXJv83squuA$o4Bu0lZ+ODOUEFwtL+cO4VMCM5peja2K5OVOW9RsxTs	\N	\N	\N	\N	\N	\N	\N	active	49ecab76-e2f1-4af8-8896-87c11b5fdc99	\N	2024-02-25 00:12:48.46+00	/content/site_settings	default	\N	\N	t	\N	\N	\N	\N	\N
7fc9b220-c824-474b-b051-4daf2d7327d0	API	AGENT	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	23c2a622-ecca-4f42-a52b-b663aef2142e	_WSYw8iI8c3611_Qaqc1T1cxfc6M5hQZ	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- Data for Name: external_link_button; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.external_link_button (id, sort, button_text, button_external_link, type) FROM stdin;
\.


--
-- Data for Name: field_display_condition_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.field_display_condition_item (id, field_display_condition_id, name, value) FROM stdin;
1	5	business_or_personal	business
2	9	old_site_exists	1
\.


--
-- Data for Name: footer_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.footer_section (id, sort, heading, footer_section_id) FROM stdin;
2	1	Page Links	1
\.


--
-- Data for Name: form_field; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.form_field (id, sort, placeholder, name, type, dynamic_options, dynamic_options_fetch_url, dynamic_option_label_field, dynamic_option_value_field, static_options_list, form_field_id, required, dynamic_options_data_field, autocomplete_enabled, autocomplete_value, note, form_list_field_id, label, real_time_validation, field_icon, dynamic_option_icon_field) FROM stdin;
4	\N	Is the website for business?	business_or_personal	selectSingle	f	\N	\N	\N	[{"label":"Personal","value":"personal"},{"label":"Business","value":"business"}]	3	t	data	t	\N	\N	\N	\N	f	\N	\N
5	\N	Business Name	business_name	text	t	\N	\N	\N	\N	3	f	data	t	\N	\N	\N	\N	f	\N	\N
10	2	\N	company_name	text	t	\N	\N	\N	\N	1	f	data	f	\N	\N	\N	Company Name	f	\N	\N
1	1	Full Name	name	text	f	\N	\N	\N	\N	1	t	data	t	\N	\N	\N	Name	t	badge	\N
3	1	\N	email	text	t	\N	\N	\N	\N	2	t	data	t	\N	\N	\N	Email Address	t	\N	\N
11	2	\N	phone_number	text	t	\N	\N	\N	\N	2	f	data	t	\N	Fill in if you would also like to be contacted by text / Whatsapp message after starting your project	\N	Phone / Whatsapp number	f	\N	\N
2	3	\N	services_needed	selectMulti	t	https://api.eclwebdesign.co.uk/items/available_services?fields=name,icon	name	name	\N	1	t	data	f	\N	What services are you interested in?	\N	Services Needed	t	format_list_bulleted	icon
8	4	\N	old_site_exists	selectButton	f	\N	\N	\N	[{"label":"Yes","value":"1"},{"label":"No","value":"0"}]	\N	t	data	f	\N	\N	\N	Does you business already have a site?	f	\N	\N
9	5	\N	old_site_url	text	t	\N	\N	\N	\N	\N	f	data	f	\N	\N	\N	Url of your current site	f	\N	\N
12	\N	\N	Name	text	t	\N	\N	\N	\N	\N	t	data	t	\N	\N	2	Your name	f	text_format	\N
\.


--
-- Data for Name: form_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.form_group (id, sort, form_group_id, group_label, form_group_list_id, group_small_text) FROM stdin;
3	1	\N	Your Business	\N	\N
2	2	1	Contact Details	\N	Your contact information will be used solely for communication purposes related to your project and will not be used for marketing.
1	1	1	About You	\N	\N
\.


--
-- Data for Name: form_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.form_section (id, sort, section_heading, form_item) FROM stdin;
1	\N	13	\N
2	\N	16	2
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.forms (id, post_url, grouped, form_name, on_submit_error, on_submit_success, submit_success_icon, submit_error_icon) FROM stdin;
2	\N	f	Test Form	{"time":1705249799487,"blocks":[{"id":"U3eCBWP5tE","type":"paragraph","data":{"text":"Bad"}}],"version":"2.27.0"}	{"time":1705249794430,"blocks":[{"id":"Wt7pfT5fH8","type":"paragraph","data":{"text":"Great"}}],"version":"2.27.0"}	check	error
\.


--
-- Data for Name: generic_content_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.generic_content_section (id, sort, date_updated, section_heading) FROM stdin;
1	\N	2023-09-29 15:54:02.493+00	8
2	\N	2024-01-13 00:12:46.099+00	15
\.


--
-- Data for Name: highlighted_title; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.highlighted_title (id, title, highlighted_words) FROM stdin;
1	From Design to Deployment	["Deployment","Design"]
2	From Design to Deployment	["Deployment","Design"]
3	Previous Work	\N
4	Available Services	["services"]
5	Testimonials	\N
6	Any Questions?	[]
7	Privacy Policy	\N
10	Start a Project	\N
11	Start A Project	\N
13	Get In Touch	\N
8	See Some of the Exciting Projects We've Worked On	["Exciting","Projects"]
12	Tell us Your Needs And We'll be in Touch	["Needs","Your"]
9	Hear From Our Previous Clients	["Clients","Previous"]
14	New Site Home	\N
15	Form Page	\N
\.


--
-- Data for Name: home_page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.home_page (id, selected_page) FROM stdin;
1	1
\.


--
-- Data for Name: icon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.icon (id, sort, icon_id, icon, icon_id_2) FROM stdin;
2	\N	\N	email	\N
4	2	\N	work	\N
8	1	\N	rate_review	\N
9	2	\N	keyboard_double_arrow_right	\N
30	1	13	chevron_right	\N
12	1	\N	phone_in_talk	\N
13	2	\N	chat	\N
14	3	\N	video_camera_front	\N
21	1	\N	call	\N
22	2	\N	sms	\N
23	3	\N	mail	\N
3	3	\N	rocket_launch	\N
5	2	\N	format_list_bulleted	\N
1	1	\N	help	\N
15	1	\N	question_mark	\N
16	2	\N	format_list_bulleted	\N
17	3	\N	rocket_launch	\N
24	1	\N	question_mark	\N
25	2	\N	format_list_bulleted	\N
26	3	\N	rocket_launch	\N
27	1	\N	question_mark	\N
28	2	\N	format_list_bulleted	\N
29	3	\N	rocket_launch	\N
10	1	\N	rate_review	\N
11	2	\N	keyboard_double_arrow_right	\N
7	1	\N	apps	\N
6	2	\N	keyboard_double_arrow_right	\N
18	3	\N	work	\N
19	1	\N	deployed_code	\N
20	2	\N	apps	\N
\.


--
-- Data for Name: internal_link_button; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.internal_link_button (id, sort, button_text, type, route_link, cta_section_link_id) FROM stdin;
12	\N	test 2	internal	89	\N
13	\N	Call To Action	internal	90	\N
\.


--
-- Data for Name: meta_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meta_tag (id, meta_name, meta_content, tag_id) FROM stdin;
1	test	hello	\N
\.


--
-- Data for Name: multi_step_form; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.multi_step_form (id, form_post_url) FROM stdin;
1	\N
\.


--
-- Data for Name: multi_step_form_section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.multi_step_form_section (id, sort, section_heading, form_content) FROM stdin;
\.


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.page (id, sort, date_updated, guid, meta_title, og_title, og_description, og_image, page_id, is_home_page, is_dynamic, route_page_id, route_sort) FROM stdin;
7	\N	2023-09-29 15:54:02.394+00	privacy-policy	Our Policy	\N	\N	\N	\N	f	f	\N	\N
1	\N	2024-01-13 00:12:45.943+00	home	Home	ECL Web Design	\N	\N	\N	t	f	\N	\N
8	\N	2024-01-14 16:34:44.377+00	form-page	Form Page	\N	\N	\N	\N	f	f	\N	\N
\.


--
-- Data for Name: page_footer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.page_footer (id, date_updated, privacy_policy_route, copywrite_info, footer_button) FROM stdin;
1	2024-01-21 12:33:18.841+00	89	© <YEAR> <Company Name>  | All Rights Reserved	13
\.


--
-- Data for Name: page_sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.page_sections (id, page_id, item, collection) FROM stdin;
11	\N	1	customer_project_section
12	\N	1	form_section
7	\N	1	work_item_full
14	\N	1	contact_page_full
15	\N	1	builder_cta_section
9	\N	1	work_display_all
13	\N	1	form_section
10	\N	1	testimonials_display_all
8	7	1	generic_content_section
5	\N	1	home_testimonials_section
6	\N	1	home_last_contact
2	\N	1	home_process_section
1	\N	1	home_landing
3	\N	1	home_previous_work
4	\N	1	home_services_section
16	1	2	generic_content_section
17	8	2	form_section
\.


--
-- Data for Name: route_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.route_item (id, sort, parsed_route, route_id, navbar_label, show_on_navbar, route_footer_id, active_page) FROM stdin;
89	6	/privacy-policy	1	Privacy Policy	f	\N	7
90	7	/form-page	1	Form Page	t	2	8
\.


--
-- Data for Name: route_item_page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.route_item_page (id, route_item_id, page_id, sort) FROM stdin;
58	89	7	1
59	90	8	1
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.routes (id, date_updated) FROM stdin;
1	2024-01-21 12:34:55.651+00
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.site_settings (id, date_updated, global_meta_title, logo, site_name) FROM stdin;
1	2024-01-21 12:31:33.187+00	New Site	\N	Your New Site
\.


--
-- Data for Name: social_link; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.social_link (id, sort, key, link, social_link_id, label, contact_social_id, contact_link_id) FROM stdin;
3	\N	github	https://github.com/default	1	Github	\N	\N
1	4	twitter	https://twitter.com/default	1	Twitter	1	1
2	2	whatsapp	https://wa.me/message/DEFAULT	1	WhatsApp	1	1
4	3	telegram	https://t.me/default	1	Telegram	1	1
6	1	email	mailto:default@email.com	1	default@email.com	1	1
\.


--
-- Data for Name: validation_check; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.validation_check (id, sort, condition, value, validation_item_check_id) FROM stdin;
1	1	lengthMoreThan	10	1
2	1	regex	(https?:\\/\\/(?:www\\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\\.[^\\s]{2,}|www\\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\\.[^\\s]{2,}|https?:\\/\\/(?:www\\.|(?!www))[a-zA-Z0-9]+\\.[^\\s]{2,}|www\\.[a-zA-Z0-9]+\\.[^\\s]{2,})	2
3	1	contains	a	3
4	1	regex	^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$	4
\.


--
-- Data for Name: validation_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.validation_item (id, sort, validation_fail_message, form_field_validation_id, description, label) FROM stdin;
2	\N	Must be a valid URL	9	\N	Valid Url
1	\N	Validation Failure	\N	\N	Test Length
4	\N	Invalid email address	3	\N	Check email
3	\N	Must Contain the letter "a"	\N	\N	Contains "a"
\.


--
-- Data for Name: work_item_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.work_item_files (id, directus_files_id) FROM stdin;
\.


--
-- Data for Name: work_item_files_1; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.work_item_files_1 (id, directus_files_id) FROM stdin;
1	\N
2	\N
3	\N
4	\N
5	\N
6	\N
7	\N
9	\N
12	\N
11	\N
8	\N
10	\N
13	\N
14	\N
15	\N
16	\N
18	\N
19	\N
20	\N
17	\N
22	\N
21	\N
23	\N
24	\N
\.


--
-- Data for Name: work_item_issue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.work_item_issue (id, sort, issue_icon, issue_tagline) FROM stdin;
1	\N	storage	Low Server Storage
2	\N	space_dashboard	Outdated Design
3	\N	query_stats	Unoptimised SEO
4	\N	edit	Difficulty Editing
\.


--
-- Data for Name: work_item_solution; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.work_item_solution (id, sort, solution_icon, solution_tagline) FROM stdin;
1	2	query_stats	SEO Optimised
2	3	draw	Design Modernised
4	1	storage	Storage Increased
3	4	edit	Editing Simplified
\.


--
-- Name: analytics_events_day_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.analytics_events_day_id_seq', 1, false);


--
-- Name: builder_cta_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.builder_cta_section_id_seq', 1, true);


--
-- Name: builder_cta_section_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.builder_cta_section_links_id_seq', 1, true);


--
-- Name: builder_section_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.builder_section_base_id_seq', 16, true);


--
-- Name: builder_section_base_section_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.builder_section_base_section_links_id_seq', 8, true);


--
-- Name: builder_section_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.builder_section_image_id_seq', 1, false);


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contact_id_seq', 1, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 7939, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 630, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 149, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 33, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 124, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 7416, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: external_link_button_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.external_link_button_id_seq', 1, true);


--
-- Name: field_display_condition_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.field_display_condition_item_id_seq', 2, true);


--
-- Name: footer_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.footer_section_id_seq', 2, true);


--
-- Name: form_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.form_field_id_seq', 12, true);


--
-- Name: form_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.form_group_id_seq', 3, true);


--
-- Name: form_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.form_section_id_seq', 2, true);


--
-- Name: forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.forms_id_seq', 2, true);


--
-- Name: generic_content_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.generic_content_section_id_seq', 2, true);


--
-- Name: highlighted_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.highlighted_title_id_seq', 15, true);


--
-- Name: home_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.home_page_id_seq', 1, true);


--
-- Name: icon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.icon_id_seq', 30, true);


--
-- Name: internal_link_button_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.internal_link_button_id_seq', 13, true);


--
-- Name: meta_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meta_tag_id_seq', 1, true);


--
-- Name: multi_step_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.multi_step_form_id_seq', 1, true);


--
-- Name: multi_step_form_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.multi_step_form_section_id_seq', 1, false);


--
-- Name: page_footer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.page_footer_id_seq', 1, true);


--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.page_id_seq', 8, true);


--
-- Name: page_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.page_sections_id_seq', 17, true);


--
-- Name: route_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.route_item_id_seq', 90, true);


--
-- Name: route_item_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.route_item_page_id_seq', 59, true);


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.routes_id_seq', 1, true);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 1, true);


--
-- Name: social_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.social_link_id_seq', 7, true);


--
-- Name: validation_check_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.validation_check_id_seq', 4, true);


--
-- Name: validation_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.validation_item_id_seq', 4, true);


--
-- Name: work_item_files_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.work_item_files_1_id_seq', 24, true);


--
-- Name: work_item_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.work_item_files_id_seq', 1, false);


--
-- Name: work_item_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.work_item_issue_id_seq', 4, true);


--
-- Name: work_item_solution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.work_item_solution_id_seq', 4, true);


--
-- Name: analytics_events_day analytics_events_day_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.analytics_events_day
    ADD CONSTRAINT analytics_events_day_pkey PRIMARY KEY (id);


--
-- Name: builder_cta_section_links builder_cta_section_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_cta_section_links
    ADD CONSTRAINT builder_cta_section_links_pkey PRIMARY KEY (id);


--
-- Name: builder_cta_section builder_cta_section_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_cta_section
    ADD CONSTRAINT builder_cta_section_pkey PRIMARY KEY (id);


--
-- Name: builder_section_base builder_section_base_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_section_base
    ADD CONSTRAINT builder_section_base_pkey PRIMARY KEY (id);


--
-- Name: builder_section_base_section_links builder_section_base_section_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_section_base_section_links
    ADD CONSTRAINT builder_section_base_section_links_pkey PRIMARY KEY (id);


--
-- Name: builder_section_image builder_section_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_section_image
    ADD CONSTRAINT builder_section_image_pkey PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (name);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: external_link_button external_link_button_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.external_link_button
    ADD CONSTRAINT external_link_button_pkey PRIMARY KEY (id);


--
-- Name: field_display_condition_item field_display_condition_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.field_display_condition_item
    ADD CONSTRAINT field_display_condition_item_pkey PRIMARY KEY (id);


--
-- Name: footer_section footer_section_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_section
    ADD CONSTRAINT footer_section_pkey PRIMARY KEY (id);


--
-- Name: form_field form_field_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_field
    ADD CONSTRAINT form_field_pkey PRIMARY KEY (id);


--
-- Name: form_group form_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_group
    ADD CONSTRAINT form_group_pkey PRIMARY KEY (id);


--
-- Name: form_section form_section_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_section
    ADD CONSTRAINT form_section_pkey PRIMARY KEY (id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: generic_content_section generic_content_section_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.generic_content_section
    ADD CONSTRAINT generic_content_section_pkey PRIMARY KEY (id);


--
-- Name: highlighted_title highlighted_title_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.highlighted_title
    ADD CONSTRAINT highlighted_title_pkey PRIMARY KEY (id);


--
-- Name: home_page home_page_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.home_page
    ADD CONSTRAINT home_page_pkey PRIMARY KEY (id);


--
-- Name: icon icon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.icon
    ADD CONSTRAINT icon_pkey PRIMARY KEY (id);


--
-- Name: internal_link_button internal_link_button_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.internal_link_button
    ADD CONSTRAINT internal_link_button_pkey PRIMARY KEY (id);


--
-- Name: meta_tag meta_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_tag
    ADD CONSTRAINT meta_tag_pkey PRIMARY KEY (id);


--
-- Name: multi_step_form multi_step_form_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multi_step_form
    ADD CONSTRAINT multi_step_form_pkey PRIMARY KEY (id);


--
-- Name: multi_step_form_section multi_step_form_section_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multi_step_form_section
    ADD CONSTRAINT multi_step_form_section_pkey PRIMARY KEY (id);


--
-- Name: page_footer page_footer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_footer
    ADD CONSTRAINT page_footer_pkey PRIMARY KEY (id);


--
-- Name: page page_guid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_guid_unique UNIQUE (guid);


--
-- Name: page page_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);


--
-- Name: page_sections page_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_sections
    ADD CONSTRAINT page_sections_pkey PRIMARY KEY (id);


--
-- Name: route_item_page route_item_page_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_item_page
    ADD CONSTRAINT route_item_page_pkey PRIMARY KEY (id);


--
-- Name: route_item route_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_item
    ADD CONSTRAINT route_item_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: social_link social_link_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_link
    ADD CONSTRAINT social_link_pkey PRIMARY KEY (id);


--
-- Name: validation_check validation_check_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.validation_check
    ADD CONSTRAINT validation_check_pkey PRIMARY KEY (id);


--
-- Name: validation_item validation_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.validation_item
    ADD CONSTRAINT validation_item_pkey PRIMARY KEY (id);


--
-- Name: work_item_files_1 work_item_files_1_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_files_1
    ADD CONSTRAINT work_item_files_1_pkey PRIMARY KEY (id);


--
-- Name: work_item_files work_item_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_files
    ADD CONSTRAINT work_item_files_pkey PRIMARY KEY (id);


--
-- Name: work_item_issue work_item_issue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_issue
    ADD CONSTRAINT work_item_issue_pkey PRIMARY KEY (id);


--
-- Name: work_item_solution work_item_solution_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_solution
    ADD CONSTRAINT work_item_solution_pkey PRIMARY KEY (id);


--
-- Name: builder_cta_section_links builder_cta_section_links_builder_cta_section_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_cta_section_links
    ADD CONSTRAINT builder_cta_section_links_builder_cta_section_id_foreign FOREIGN KEY (builder_cta_section_id) REFERENCES public.builder_cta_section(id) ON DELETE CASCADE;


--
-- Name: builder_section_base_section_links builder_section_base_section_links_builder__2db2a550_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_section_base_section_links
    ADD CONSTRAINT builder_section_base_section_links_builder__2db2a550_foreign FOREIGN KEY (builder_section_base_id) REFERENCES public.builder_section_base(id) ON DELETE CASCADE;


--
-- Name: builder_section_base builder_section_base_title_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_section_base
    ADD CONSTRAINT builder_section_base_title_foreign FOREIGN KEY (title) REFERENCES public.highlighted_title(id) ON DELETE SET NULL;


--
-- Name: builder_section_image builder_section_image_section_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.builder_section_image
    ADD CONSTRAINT builder_section_image_section_image_foreign FOREIGN KEY (section_image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: field_display_condition_item field_display_condition_item_field_display__1e0b201c_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.field_display_condition_item
    ADD CONSTRAINT field_display_condition_item_field_display__1e0b201c_foreign FOREIGN KEY (field_display_condition_id) REFERENCES public.form_field(id) ON DELETE CASCADE;


--
-- Name: footer_section footer_section_footer_section_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.footer_section
    ADD CONSTRAINT footer_section_footer_section_id_foreign FOREIGN KEY (footer_section_id) REFERENCES public.page_footer(id) ON DELETE CASCADE;


--
-- Name: form_field form_field_form_field_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_field
    ADD CONSTRAINT form_field_form_field_id_foreign FOREIGN KEY (form_field_id) REFERENCES public.form_group(id) ON DELETE SET NULL;


--
-- Name: form_field form_field_form_list_field_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_field
    ADD CONSTRAINT form_field_form_list_field_id_foreign FOREIGN KEY (form_list_field_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: form_group form_group_form_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_group
    ADD CONSTRAINT form_group_form_group_id_foreign FOREIGN KEY (form_group_id) REFERENCES public.multi_step_form(id) ON DELETE SET NULL;


--
-- Name: form_group form_group_form_group_list_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_group
    ADD CONSTRAINT form_group_form_group_list_id_foreign FOREIGN KEY (form_group_list_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: form_section form_section_form_item_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_section
    ADD CONSTRAINT form_section_form_item_foreign FOREIGN KEY (form_item) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: form_section form_section_section_heading_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.form_section
    ADD CONSTRAINT form_section_section_heading_foreign FOREIGN KEY (section_heading) REFERENCES public.builder_section_base(id) ON DELETE SET NULL;


--
-- Name: generic_content_section generic_content_section_section_heading_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.generic_content_section
    ADD CONSTRAINT generic_content_section_section_heading_foreign FOREIGN KEY (section_heading) REFERENCES public.builder_section_base(id) ON DELETE SET NULL;


--
-- Name: home_page home_page_selected_page_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.home_page
    ADD CONSTRAINT home_page_selected_page_foreign FOREIGN KEY (selected_page) REFERENCES public.page(id) ON DELETE SET NULL;


--
-- Name: icon icon_icon_id_2_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.icon
    ADD CONSTRAINT icon_icon_id_2_foreign FOREIGN KEY (icon_id_2) REFERENCES public.external_link_button(id) ON DELETE SET NULL;


--
-- Name: icon icon_icon_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.icon
    ADD CONSTRAINT icon_icon_id_foreign FOREIGN KEY (icon_id) REFERENCES public.internal_link_button(id) ON DELETE SET NULL;


--
-- Name: internal_link_button internal_link_button_cta_section_link_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.internal_link_button
    ADD CONSTRAINT internal_link_button_cta_section_link_id_foreign FOREIGN KEY (cta_section_link_id) REFERENCES public.builder_cta_section(id) ON DELETE CASCADE;


--
-- Name: internal_link_button internal_link_button_route_link_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.internal_link_button
    ADD CONSTRAINT internal_link_button_route_link_foreign FOREIGN KEY (route_link) REFERENCES public.route_item(id) ON DELETE SET NULL;


--
-- Name: meta_tag meta_tag_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_tag
    ADD CONSTRAINT meta_tag_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES public.page(id) ON DELETE SET NULL;


--
-- Name: multi_step_form_section multi_step_form_section_form_content_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multi_step_form_section
    ADD CONSTRAINT multi_step_form_section_form_content_foreign FOREIGN KEY (form_content) REFERENCES public.multi_step_form(id) ON DELETE SET NULL;


--
-- Name: multi_step_form_section multi_step_form_section_section_heading_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multi_step_form_section
    ADD CONSTRAINT multi_step_form_section_section_heading_foreign FOREIGN KEY (section_heading) REFERENCES public.builder_section_base(id) ON DELETE SET NULL;


--
-- Name: page_footer page_footer_footer_button_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_footer
    ADD CONSTRAINT page_footer_footer_button_foreign FOREIGN KEY (footer_button) REFERENCES public.internal_link_button(id) ON DELETE SET NULL;


--
-- Name: page_footer page_footer_privacy_policy_route_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_footer
    ADD CONSTRAINT page_footer_privacy_policy_route_foreign FOREIGN KEY (privacy_policy_route) REFERENCES public.route_item(id) ON DELETE SET NULL;


--
-- Name: page page_og_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_og_image_foreign FOREIGN KEY (og_image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: page page_page_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_page_id_foreign FOREIGN KEY (page_id) REFERENCES public.route_item(id) ON DELETE SET NULL;


--
-- Name: page page_route_page_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_route_page_id_foreign FOREIGN KEY (route_page_id) REFERENCES public.route_item(id) ON DELETE SET NULL;


--
-- Name: page_sections page_sections_page_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.page_sections
    ADD CONSTRAINT page_sections_page_id_foreign FOREIGN KEY (page_id) REFERENCES public.page(id) ON DELETE SET NULL;


--
-- Name: route_item route_item_active_page_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_item
    ADD CONSTRAINT route_item_active_page_foreign FOREIGN KEY (active_page) REFERENCES public.page(id) ON DELETE SET NULL;


--
-- Name: route_item_page route_item_page_page_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_item_page
    ADD CONSTRAINT route_item_page_page_id_foreign FOREIGN KEY (page_id) REFERENCES public.page(id) ON DELETE CASCADE;


--
-- Name: route_item_page route_item_page_route_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_item_page
    ADD CONSTRAINT route_item_page_route_item_id_foreign FOREIGN KEY (route_item_id) REFERENCES public.route_item(id) ON DELETE CASCADE;


--
-- Name: route_item route_item_route_footer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_item
    ADD CONSTRAINT route_item_route_footer_id_foreign FOREIGN KEY (route_footer_id) REFERENCES public.footer_section(id) ON DELETE SET NULL;


--
-- Name: route_item route_item_route_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_item
    ADD CONSTRAINT route_item_route_id_foreign FOREIGN KEY (route_id) REFERENCES public.routes(id) ON DELETE CASCADE;


--
-- Name: site_settings site_settings_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_logo_foreign FOREIGN KEY (logo) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: social_link social_link_contact_link_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_link
    ADD CONSTRAINT social_link_contact_link_id_foreign FOREIGN KEY (contact_link_id) REFERENCES public.contact(id) ON DELETE SET NULL;


--
-- Name: social_link social_link_contact_social_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_link
    ADD CONSTRAINT social_link_contact_social_id_foreign FOREIGN KEY (contact_social_id) REFERENCES public.page_footer(id) ON DELETE SET NULL;


--
-- Name: social_link social_link_social_link_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.social_link
    ADD CONSTRAINT social_link_social_link_id_foreign FOREIGN KEY (social_link_id) REFERENCES public.site_settings(id) ON DELETE CASCADE;


--
-- Name: validation_check validation_check_validation_item_check_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.validation_check
    ADD CONSTRAINT validation_check_validation_item_check_id_foreign FOREIGN KEY (validation_item_check_id) REFERENCES public.validation_item(id) ON DELETE SET NULL;


--
-- Name: validation_item validation_item_form_field_validation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.validation_item
    ADD CONSTRAINT validation_item_form_field_validation_id_foreign FOREIGN KEY (form_field_validation_id) REFERENCES public.form_field(id) ON DELETE SET NULL;


--
-- Name: work_item_files_1 work_item_files_1_directus_files_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_files_1
    ADD CONSTRAINT work_item_files_1_directus_files_id_foreign FOREIGN KEY (directus_files_id) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: work_item_files work_item_files_directus_files_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_item_files
    ADD CONSTRAINT work_item_files_directus_files_id_foreign FOREIGN KEY (directus_files_id) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

