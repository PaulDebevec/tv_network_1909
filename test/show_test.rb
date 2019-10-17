require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require 'pry'

class ShowTest < Minitest::Test

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  def test_it_exists
    assert_instance_of Show, @knight_rider
  end

  def test_show_has_a_name
    expected = "Knight Rider"
    actual = @knight_rider.name
    assert_equal expected, actual
  end

  def test_show_has_a_creator
    expected = "Glen Larson"
    actual = @knight_rider.creator
    assert_equal expected, actual
  end

  def test_show_has_characters
    expected = [@michael_knight, @kitt]
    actual = @knight_rider.characters
    assert_equal expected, actual
  end

  def test_the_show_can_calculate_total_salary
    expected = 2600000
    actual = @knight_rider.total_salary
    assert_equal expected, actual
  end

end
