TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email) VALUES ('Jane Doe', 'janedoe@example.com');
INSERT INTO users (name, email) VALUES ('Jonny Appleseed', 'appleseed@example.com');