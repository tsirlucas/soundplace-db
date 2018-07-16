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
  user_id text REFERENCES soundplace.user_data (id)
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
  album text REFERENCES soundplace.album_data (id),
  duration numeric NOT NULL
);

-- RELATIONSHIP

CREATE TABLE soundplace.playlist_track
(
  playlist_id text REFERENCES soundplace.playlist_data (id),
  track_id text REFERENCES soundplace.track_data (id),
  CONSTRAINT playlist_track_pkey PRIMARY KEY (playlist_id, track_id)
);

CREATE TABLE soundplace.album_artist
(
  album_id text REFERENCES soundplace.album_data (id),
  artist_id text REFERENCES soundplace.artist_data (id),
  CONSTRAINT album_artist_pkey PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE soundplace.track_artist
(
  track_id text REFERENCES soundplace.track_data (id),
  artist_id text REFERENCES soundplace.artist_data (id),
  CONSTRAINT artist_artist_pkey PRIMARY KEY (track_id, artist_id)
);
