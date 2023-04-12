require_relative "./nameable"

# Base decorator
class base < Nameable
  def initialize(nameable_object = Nameable.new)
    @nameable_object = nameable_object
  end

  def correct_name
    @nameable_object.correct_name
end
