SELECT posts.id, posts.title
FROM posts 
  JOIN posts_tags ON posts_tags.post_id = posts.id
  JOIN tags ON posts_tags.tag_id = tags.id
  WHERE tags.name = 'travel';
