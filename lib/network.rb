class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  # Helper method for both highest_paid_characters and payroll
  def all_network_characters
    @shows.flat_map { |show| show.characters }
  end

  def highest_paid_actor
    highest_paid = all_network_characters.max_by { |character| character.salary }
    highest_paid.actor
  end

  def payroll
    network_characters = all_network_characters
    all_network_characters.reduce({}) do |acc, character|
      acc[character.actor] = character.salary
      acc
    end
  end
end
