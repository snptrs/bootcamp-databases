TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.
TRUNCATE TABLE artists RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('Bob Dylan', 'Awesomeness');

INSERT INTO albums (title, release_year, artist_id) VALUES ('Highway 61 Revisited', '1965', 1);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Blonde on Blonde', '1966', 1);
