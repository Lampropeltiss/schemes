CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS song (
	song_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL, 
	duration INT NOT NULL,
	album_id INT REFERENCES album(album_id) NOT NULL
);

CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_genre (
	artist_genre_id SERIAL PRIMARY KEY,
	artist_id INT NOT NULL,
	genre_id INT NOT NULL,
	CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE, 
	CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS artist_album (
	artist_album_id SERIAL PRIMARY KEY,
	artist_id INT NOT NULL,
	album_id INT NOT NULL,
	CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE,
	CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES album(album_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS song_collection (
	song_collection_id SERIAL PRIMARY KEY,
	song_id INT NOT NULL,
	collection_id INT NOT NULL,
	CONSTRAINT fk_song FOREIGN KEY(song_id) REFERENCES song(song_id) ON DELETE CASCADE,
	CONSTRAINT fk_collection FOREIGN KEY(collection_id) REFERENCES collection(collection_id) ON DELETE CASCADE
);