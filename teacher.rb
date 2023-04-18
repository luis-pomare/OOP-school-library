# frozen_string_literal: true

require_relative './person'

# Inherits from Person main class
class Teacher < Person

  attr_accessor :specialization, :age, :name

  def initialize(specialization, age, name = 'Unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
