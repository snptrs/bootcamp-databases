# Blog Two Table Design Recipe

## 1. Extract nouns from the user stories or specification

```
# User story

As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.
```

```
Nouns:

blogger, posts, post title, post content, comments, comment content, commenter name
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| posts                 | title, content
| comments              | content, name

1. Name of the first table (always plural): `posts` 

    Column names: `title`, `content`

2. Name of the second table (always plural): `comments` 

    Column names: `content`, `name`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: posts
id: SERIAL
title: text
content: text

Table: comments
id: SERIAL
comments: text
name: text
```

## 4. Decide on The Tables Relationship


```
# EXAMPLE

1. Can one comment have many posts? NO
2. Can one post have many comments? YES

-> Therefore,
-> A post HAS MANY comments
-> A comment BELONGS to a post

-> Therefore, the foreign key is on the comments table (post_id).
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  name text,
  start_date date
  constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```