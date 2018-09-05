require "minitest/autorun"
require "minitest/pride"
require './lib/boat.rb'

class BoatTest < Minitest::Test

  def test_boat_exists
    kayak = Boat.new(:kayak, 20)

    assert_instance_of Boat, kayak
  end

  def test_boat_has_attributes
    kayak = Boat.new(:kayak, 20)

    assert_equal :kayak, kayak.type

    assert_equal 20, kayak.price_per_hour
  end

  def test_boat_has_not_been_rented_yet
    kayak = Boat.new(:kayak, 20)

    assert_equal 0, kayak.hours_rented
  end

  def test_can_add_hours_to_rental
    kayak = Boat.new(:kayak, 20)

    kayak.add_hour
    assert_equal 1, kayak.hours_rented

    kayak.add_hour
    assert_equal 2, kayak.hours_rented

    kayak.add_hour
    assert_equal 3, kayak.hours_rented
  end

end
