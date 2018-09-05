require "minitest/autorun"
require "minitest/pride"
require './lib/boat.rb'
require './lib/renter'
require './lib/dock'

class RenterTest < Minitest::Test
  def test_dock_exists
    dock = Dock.new("The Rowing Dock", 3)

    assert_instance_of Dock, dock
  end

  def test_dock_has_attributes
    dock = Dock.new("The Rowing Dock", 3)   

    assert_equal "The Rowing Dock", dock.name

    assert_equal 3, dock.max_rental_time
  end

end
