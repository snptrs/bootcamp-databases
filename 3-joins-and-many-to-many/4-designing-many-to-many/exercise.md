# Coach Two Table (Many-to-Many) Design Recipe Template

## 1. Extract nouns from the user stories or specification

```
# USER STORIES

As a coach
So I can get to know all students
I want to keep a list of students' names.

As a coach
So I can get to know all students
I want to assign tags to students (for example, "happy", "excited", etc).

As a coach
So I can get to know all students
I want to be able to assign the same tag to many different students.

As a coach
So I can get to know all students
I want to be able to assign many different tags to a student.
```

```
## Nouns

students, names, tags
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| students              | name
| tags                  | name

1. Name of the first table (always plural): `students` 

    Column names: `name`

2. Name of the second table (always plural): `tags` 

    Column names: `name`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
Table: students
id: SERIAL
name: text

Table: tags
id: SERIAL
name: text
```

## 4. Design the Many-to-Many relationship

Make sure you can answer YES to these two questions:

1. Can one student have many tags? (Yes)
2. Can one tag have many students]? (Yes)

## 5. Design the Join Table

```
Join table for tables: students and tags
Join table name: students_tags
Columns: student_id, tag_id
```

## 4. Write the SQL.

```sql
-- file: students_tags.sql

-- Replace the table name, columm names and types.

-- Create the first table.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text
);

-- Create the second table.
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name text
);

-- Create the join table.
CREATE TABLE students_tags (
  student_id int,
  tag_id int,
  constraint fk_student foreign key(student_id) references students(id) on delete cascade,
  constraint fk_tag foreign key(tag_id) references tags(id) on delete cascade,
  PRIMARY KEY (student_id, tag_id)
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 coaching < students_tags.sql
```
