TRUNCATE TABLE users, posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email) VALUES ('Jane Doe', 'janedoe@example.com');
INSERT INTO users (name, email) VALUES ('Jonny Appleseed', 'appleseed@example.com');

-- TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, content, view_count, user_id) VALUES ('Post 1', 'Lorem ipsum.', 3, 1);
INSERT INTO posts (title, content, view_count, user_id) VALUES ('Post 2', 'Lorem ipsum dolor sit amet.', 5, 2);