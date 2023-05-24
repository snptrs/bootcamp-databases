require 'recipe_repository'

RSpec.describe RecipeRepository do
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_recipes_table
  end
  
  it "returns two recipes" do
    repo = RecipeRepository.new
    recipes = repo.all
    
    expect(recipes.length).to eq 2
    expect(recipes.last.name).to eq 'Bircher Muesli'
    expect(recipes.last.rating).to eq '5'
    expect(recipes.last.cooking_time).to eq '30'
  end

  it "returns a recipe by id" do
    repo = RecipeRepository.new
    recipes = repo.find(1)

    expect(recipes.last.name).to eq 'Peanut Butter Spice Rice'
  end
end
