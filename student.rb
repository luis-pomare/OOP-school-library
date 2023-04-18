# frozen_string_literal: true

require_relative './person'

# Inherits from Person main class
class Student < Person
  attr_reader :classroom
  attr_accessor :age, :name, :parent_permission
  
  def initialize(age, parent_permission, name = 'Unknown')
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    return unless classroom.students.include?(self) == false

    classroom.add_student(self)
  end
end
