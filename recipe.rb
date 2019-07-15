class Recipe

  attr_reader :name, :description
  attr_accessor :prep_time, :done

  def initialize(name, description)
    @name = name
    @description = description
    @prep_time = nil
    @done = false
  end

  def mark_as_done!
    @done = true
  end

end
