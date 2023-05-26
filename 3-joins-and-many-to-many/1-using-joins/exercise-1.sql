SELECT albums.id, albums.title
 FROM albums
  JOIN artists
  ON albums.artist_id = artists.id
 WHERE artists.name = 'Taylor Swift';

# Albums:id |title| release_year | artist_id
# Artists:id |name|genre
