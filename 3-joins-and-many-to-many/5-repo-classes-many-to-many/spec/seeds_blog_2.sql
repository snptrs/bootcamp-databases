-- -------------------------------------------------------------
-- TablePlus 5.3.8(500)
--
-- https://tableplus.com/
--
-- Database: blog_2
-- Generation Time: 2023-05-27 17:31:53.2110
-- -------------------------------------------------------------
TRUNCATE TABLE posts, tags, posts_tags RESTART IDENTITY;

INSERT INTO "public"."posts" ("id", "title") VALUES
(1, 'How to use Git'),
(2, 'Ruby classes'),
(3, 'Using IRB'),
(4, 'My weekend in Edinburgh'),
(5, 'The best chocolate cake EVER'),
(6, 'A foodie week in Spain'),
(7, 'SQL basics');

INSERT INTO "public"."tags" ("id", "name") VALUES
(1, 'coding'),
(2, 'travel'),
(3, 'cooking'),
(4, 'ruby'),
(5, 'sql');

INSERT INTO "public"."posts_tags" ("post_id", "tag_id") VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3),
(6, 2),
(7, 1),
(6, 3),
(2, 4),
(3, 4),
(7, 5);
