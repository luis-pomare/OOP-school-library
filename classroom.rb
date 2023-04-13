# frozen_string_literal: true

# Classroom for students
class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student) if @students.include?(student) == false
    student.classroom = (self)
  end
end
