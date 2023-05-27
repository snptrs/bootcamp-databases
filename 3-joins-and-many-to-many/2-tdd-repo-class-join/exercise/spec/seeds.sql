-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE students, cohorts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO cohorts (id, name, start_date) VALUES
(1, 'May 2023', '2023-05-01'),
(2, 'June 2023', '2023-06-01');

INSERT INTO students (id, name, cohort_id) VALUES
(1, 'Darren McDermott', 1),
(2, 'Yvette Bahringer Sr.', 1),
(3, 'Lillian Hammes', 2),
(4, 'Jerome Labadie', 2);

