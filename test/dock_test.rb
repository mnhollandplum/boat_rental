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


  def test_dock_can_rent_a_boat_to_a_renter
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)

    patrick = Renter.new("Patrick Star", "4242424242424242")

    dock.rent(kayak_1, patrick)

    # dock.log_hour(kayak_1)

    # dock.return(kayak_1)

    assert_equal [kayak_1], dock.rented_boats
  end

  def test_can_log_hours_for_rented_boat
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)

    patrick = Renter.new("Patrick Star", "4242424242424242")

    dock.rent(kayak_1, patrick)


    dock.log_hour

    dock.rent(kayak_2, patrick)

    dock.log_hour

    assert_equal 2, kayak_1.hours_rented

    assert_equal 1, kayak_2.hours_rented
  end

  def test_boat_can_be_returned
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)

    patrick = Renter.new("Patrick Star", "4242424242424242")

    dock.rent(kayak_1, patrick)


    dock.log_hour

    dock.rent(kayak_2, patrick)

    dock.log_hour

    dock.return(kayak_1)

    assert_equal [kayak_2], dock.rented_boats

    assert_equal [kayak_1], dock.returned_boats
  end
#
  def test_can_calculate_total_revenue
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)

    patrick = Renter.new("Patrick Star", "4242424242424242")

    dock.rent(kayak_1, patrick)


    dock.log_hour

    dock.rent(kayak_2, patrick)

    dock.log_hour

    dock.return(kayak_1)

    assert_equal 40, dock.revenue
  end

  def test_revenue_with_multiple_boats_and_renters
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)

    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)

    dock.log_hour

    dock.rent(canoe, patrick)

    dock.log_hour

    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(canoe)

    assert_equal 105, dock.revenue

    dock.rent(sup_1, eugene)
    dock.rent(sup_2, eugene)

    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.return(sup_1)
    dock.return(sup_2)

    assert_equal 195, dock.revenue

  end
end
