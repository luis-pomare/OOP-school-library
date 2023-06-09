require_relative './nameable'

# Main class
class Person < Nameable
  attr_reader :rentals
  attr_accessor :name, :age, :id

  def initialize(age, name = 'Unknown', parent_permission = 'true')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental) if @rentals.include?(rental) == false

    rental.person = (self)
  end

  private

  def of_age?
    @age >= 18
  end
end
