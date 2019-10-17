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

  def test_network_can_add_show
    @nbc.add_show(@parks_and_rec)
    @nbc.add_show(@knight_rider)

    assert_equal 2, @nbc.shows.length
    assert @nbc.shows.include?(@parks_and_rec)
    assert @nbc.shows.include?(@knight_rider)
  end

  def test_it_can_find_highest_paid_actor
    @nbc.add_show(@parks_and_rec)
    @nbc.add_show(@knight_rider)
    assert_equal "Amy Poehler", @nbc.highest_paid_actor
  end

  def test_it_can_report_payroll_payroll
    @nbc.add_show(@parks_and_rec)
    @nbc.add_show(@knight_rider)
    expected_value = {"David Hasselhoff" => 1600000, "William Daniels" => 1000000, "Amy Poehler" => 2000000, "Nick Offerman" => 1400000}

    assert_equal expected_value, @nbc.payroll
  end
end
