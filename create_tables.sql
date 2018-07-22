-- TABLES

CREATE TABLE soundplace.user_data
(
  id text PRIMARY KEY,
  name text NOT NULL,
  image text
);

CREATE TABLE soundplace.playlist_data
(
  id text PRIMARY KEY,
  name text NOT NULL,
  cover text,
  user_id text REFERENCES soundplace.user_data (id) NOT NULL
);

CREATE TABLE soundplace.album_data
(
  id text PRIMARY KEY,
  name text NOT NULL,
  cover text
);

CREATE TABLE soundplace.artist_data
(
  id text PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE soundplace.track_data
(
  id text PRIMARY KEY,
  name text NOT NULL,
  duration numeric NOT NULL,
  artist_id text REFERENCES soundplace.artist_data (id) NOT NULL,
  album_id text REFERENCES soundplace.album_data (id) NOT NULL
);

CREATE TABLE soundplace.spotify_auth
(
  user_id text PRIMARY KEY NOT NULL,
  access_token text NOT NULL,
  refresh_token text NOT NULL
);

-- RELATIONSHIP

CREATE TABLE soundplace.playlist_track
(
  playlist_id text REFERENCES soundplace.playlist_data (id) NOT NULL,
  track_id text REFERENCES soundplace.track_data (id) NOT NULL,
  CONSTRAINT playlist_track_pkey PRIMARY KEY (playlist_id, track_id)
);
