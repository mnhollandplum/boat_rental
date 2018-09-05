require 'pry'
class Dock
    attr_reader :name, :max_rental_time, :rented_boats, :returned_boats
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @returned_boats = []
  end

  def rent(boat, renter)
    @rented_boats << boat
  end

  def log_hour
    @rented_boats.map do |boat|
      boat.hours_rented +=1
    end
  end

  def return(boat)
    @rented_boats.each do |b|
      if b == boat
        @returned_boats << b
        @rented_boats.delete(boat)
      end
    end

  end

  def revenue
    revenue = 0
    @returned_boats.each do |boat|
    revenue += boat.price_per_hour * boat.hours_rented
    end
    revenue
  end


end
