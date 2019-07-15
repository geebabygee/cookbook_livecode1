require_relative "view"
require_relative "recipe"
require_relative "scraper"

class Controller
  def initialize(repo)
    @repo = repo
    @view = View.new
  end

  def create
    name = @view.ask_user_for("name")
    desc = @view.ask_user_for("description")
    recipe = Recipe.new(name,desc)
    @repo.add(recipe)
    #1. ask user for name and desc (view)
    #2. make recipe with that info
    #3. give it to repo to add and store
  end

  def list
    recipes = @repo.all
    @view.display(recipes)
  end

  def destroy
    list
    index = @view.ask_user_for("number").to_i - 1
    @repo.remove_at(index)
  end

  def import
    #1. Ask user for ingredient to scrape for
    #2. Make a new instance of Scraper and create new instance and call its scrape method
    #3. show the user results and ask him to choose one number

    #4. add the recipe from the results to the repo
    ingredient = @view.ask_user_for("ingredient")
    results = Scraper.new(ingredient).scrape
    @view.display(results)
    index = @view.ask_user_for("number").to_i - 1
    recipe = results[index]
    @repo.add(recipe)
  end

  def mark_as_done
    list
    index = @view.ask_user_for("number").to_i - 1
    # recipe = @repo.find(index)
    # recipe.mark_as_done!
    # @repo.save_to_csv
    recipe = @repo.mark_as_done(index)
  end
end
