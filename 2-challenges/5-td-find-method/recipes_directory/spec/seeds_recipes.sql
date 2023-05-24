TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, ingredients, instructions, cooking_time, rating) VALUES ('Peanut Butter Spice Rice', '1 tbsp coconut oil,1 tbsp toasted sesame oil,2 garlic cloves,2 inch piece fresh ginger,1 fresh red chilli,4 spring onions', 'Prepare the vegetables | Peel and grate the garlic and ginger | Trim and finely slice the chili', 30, 5);
INSERT INTO recipes (name, ingredients, instructions, cooking_time, rating) VALUES ('Bircher Muesli', '100g oats,2 tablespoons white chia seeds,1 tablespoon pumpkin seeds,350ml milk of your choice,1 tablespoon maple syrup,a dash of all-natural vanilla extract', 'The night before, put the oats, chia seeds and pumpkin seeds into a bowl or container, pour over the milk, and add the maple syrup, vanilla and lemon juice.', 30, 5);