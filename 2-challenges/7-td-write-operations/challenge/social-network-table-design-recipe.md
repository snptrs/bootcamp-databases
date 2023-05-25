# Social Network Two Table Design Recipe Template

## 1. Extract nouns from the user stories or specification

```
# USER STORIES

As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.
```

```
Nouns:

user, email, username, posts, post title, post content, post view count
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| user                  | username, email
| post                  | title, content, view_count

1. Name of the first table (always plural): `users` 

    Column names: `username`, `email`

2. Name of the second table (always plural): `posts` 

    Column names: `title`, `content`, `view_count`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: users
id: SERIAL
username: text
email: text

Table: posts
id: SERIAL
title: text
content: text
view_count: int
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one user have many posts? (Yes)
2. Can one post have many users? (No)

You'll then be able to say that:

1. **[User] has many [posts]**
2. And on the other side, **[posts] belongs to [user]**
3. In that case, the foreign key is in the table [posts]

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: social_network_schema.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  view_count int,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 social_network < social_network_schema.sql
```