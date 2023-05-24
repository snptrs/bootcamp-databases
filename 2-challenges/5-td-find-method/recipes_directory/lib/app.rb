require_relative 'recipe_repository'
require_relative 'database_connection'

class App
  DatabaseConnection.connect('recipes_directory')
  
  def list
    recipes = RecipeRepository.new
    recipes.all.each do |recipe|
      p "#{recipe.id} – #{recipe.name} – #{recipe.rating}"
    end
  end
  
  def find(id)
    recipes = RecipeRepository.new
    recipes.find(id).each do |recipe|
      p "#{recipe.id} – #{recipe.name} – #{recipe.rating}"
    end
  end
end

app = App.new

p "===ALL RECIPES==="
app.list

p "\nChoose a recipe by ID:"
id = gets.chomp
app.find(id)
