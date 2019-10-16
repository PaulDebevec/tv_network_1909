require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'
require 'pry'

class NetworkTest < Minitest::Test

  def setup
    @nbc = Network.new("NBC")

    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})

    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_network_has_a_name
    expected = "NBC"
    actual = @nbc.name
  end

  def test_network_has_shows
    expected = []
    actual = @nbc.shows
    assert_equal expected, actual

  end

  def test_network_add_show
    expected = [@parks_and_rec]
    actual = @nbc.add_show(@parks_and_rec)
    assert_equal expected, actual

    @nbc.add_show(@knight_rider)
    assert_equal [@parks_and_rec, @knight_rider]
  end

end
