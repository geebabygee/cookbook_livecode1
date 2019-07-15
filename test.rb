require_relative "recipe"
require_relative "cookbook"

# bifana = Recipe.new("Bifana", "Yummy pork sandwich")
# bitoque = Recipe.new("Bitoque", "Steak and egg")
csv_file = "recipes.csv"
cookbook = Cookbook.new(csv_file)
prego = Recipe.new("Prego", "Yummy steak sandwich")
# cookbook.add(prego)
# cookbook.add(bitoque)

# salad = Recipe.new("Salad", "leaves and shit")
# cookbook.add(salad)
cookbook.load_csv

