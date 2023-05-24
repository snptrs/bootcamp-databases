CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  start_date date
);

-- Then the table with the foreign key first.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id)
    on delete cascade
);