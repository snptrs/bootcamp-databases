# Create a new 'sql' tag
INSERT INTO tags (name) VALUES ('sql');

# Tag the 'SQL basics' post with 'sql'
INSERT INTO posts_tags (post_id, tag_id) VALUES (7, 5);

# Retrieve all the posts tagged 'sql'
SELECT posts.id, posts.title
FROM posts 
  JOIN posts_tags ON posts_tags.post_id = posts.id
  JOIN tags ON posts_tags.tag_id = tags.id
  WHERE tags.name = 'sql';
