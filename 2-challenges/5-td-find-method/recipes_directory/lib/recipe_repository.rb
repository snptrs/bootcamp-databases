require_relative 'recipe'

class RecipeRepository
  def all
    recipes = []
    sql = 'SELECT id, name, ingredients, instructions, cooking_time, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      recipe = Recipe.new

      recipe.id = record['id']
      recipe.name = record['name']
      recipe.ingredients = record['ingredients']
      recipe.instructions = record['instructions']
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end
    return recipes
  end

  def find(id)
    recipes = []
    sql = 'SELECT id, name, ingredients, instructions, cooking_time, rating FROM recipes WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    result_set.each do |record|
      recipe = Recipe.new

      recipe.id = record['id']
      recipe.name = record['name']
      recipe.ingredients = record['ingredients']
      recipe.instructions = record['instructions']
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end
    return recipes
  end
end
