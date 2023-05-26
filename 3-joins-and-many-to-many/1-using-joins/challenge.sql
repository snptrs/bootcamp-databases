SELECT albums.id, albums.title, albums.release_year
 FROM albums
  JOIN artists
  ON albums.artist_id = artists.id
 WHERE artists.name = 'Nina Simone' AND albums.release_year > '1975';
