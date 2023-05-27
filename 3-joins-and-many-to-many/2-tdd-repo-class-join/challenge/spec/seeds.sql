-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE comments, posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, content) VALUES
('Post 1', 'Lorem ipsum dolor sit amet.'),
('Post 2', 'At in tellus integer feugiat scelerisque.');

INSERT INTO comments (comment, date, post_id) VALUES
('The HDD system is down, back up the solid state interface so we can copy the API bus!', '2023-03-19', 1),
('Try to program the HTTP pixel, maybe it will navigate the back-end protocol!', '2023-03-21', 1),
('Try to override the AI alarm, maybe it will input the virtual transmitter!', '2023-03-22', 2),
('If we back up the pixel, we can get to the IP circuit through the open-source SCSI feed!', '2023-03-23', 2);
