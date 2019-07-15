require "csv"

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def add(recipe)
    @recipes << recipe
    save_to_csv
  end

  def all
    @recipes
  end

  def remove_at(index)
    @recipes.delete_at(index)
    save_to_csv
  end

  def find(index)
    @recipes[index]
  end

  def mark_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    save_to_csv
  end

  private

  def save_to_csv
    # Ruby objects --> CSV
    CSV.open(@csv_file, "wb") do |row|
      @recipes.each do |recipe|
        row << [recipe.name, recipe.description, recipe.prep_time, recipe.done]
      end
    end
  end

  def load_csv
    # CSV --> Ruby objects
    CSV.foreach(@csv_file) do |row|
      name =  row[0]
      description =  row[1]
      recipe = Recipe.new(name,description)
      recipe.prep_time = row[2]
      if row[3] == "true"
        recipe.mark_as_done!
      end
      @recipes << recipe
    end
  end





end
