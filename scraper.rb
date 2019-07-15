require "nokogiri"
require "open-uri"
require_relative "recipe"

class Scraper
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def scrape
    results = []
    html = open("http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=beef").read
    doc = Nokogiri::HTML(html)
    doc.search(".recette_classique").first(5).each do |element|
        name = element.search('.m_titre_resultat').text.strip
        description = element.search('.m_texte_resultat').text.strip
        prep_time = element.search('.m_prep_time').first.parent.text.strip

        recipe = Recipe.new(name,description)
        recipe.prep_time = prep_time
        results << recipe
     end
     results
  end
end

# puts "What ingredient would you like to search for"
# ingredient = gets.chomp


#   def call
#     html = open("http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{@ingredient}").read
#     # 1. Parse HTML
#     doc = Nokogiri::HTML(html, nil, "utf-8")
#     # 2. For the first five results
#     results = []
#       # 3. Create recipe and store it in results
#       name = element.search('.m_titre_resultat a').text.strip
#       prep_time = element.search('.m_prep_time').first.parent.text.strip
#       results << Recipe.new(name: name, description: description, prep_time: prep_time)
#     end
#     return results
#   end
# end
