SELECT albums.id, albums.title, albums.release_year
 FROM albums
  JOIN artists
  ON albums.artist_id = artists.id
 WHERE artists.name = 'Pixies' AND albums.release_year = '1988';
