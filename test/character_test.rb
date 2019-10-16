require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require 'pry'

class CharacterTest < Minitest::Test

  def setup
    @kitt = kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
  end

  def test_it_exists
    assert_instance_of Character, @kitt
  end

  def test_it_has_a_name
    expected = "KITT"
    actual = @kitt.name
    assert_equal expected, actual
  end

  def test_it_has_an_actor
    expected = "William Daniels"
    actual = @kitt.actor
    assert_equal expected, actual
  end

  def test_it_has_a_salary
    expected = 1000000
    actual = @kitt.salary
    assert_equal expected, actual
  end
end
