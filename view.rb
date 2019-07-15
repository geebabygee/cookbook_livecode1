class View

  def ask_user_for(something)
    puts "What's the #{something} for your recipe?"
    gets.chomp
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      prep_time = recipe.prep_time.nil? ? " " : "(#{recipe.prep_time})"
      done = recipe.done ? "[x] " : "[ ]"
      puts "#{index + 1}. #{done} #{recipe.name} ~ #{recipe.description} #{prep_time}"
    end
  end
end
