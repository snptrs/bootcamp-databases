CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  ingredients text,
  instructions text,
  cooking_time int,
  rating int
);