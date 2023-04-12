# frozen_string_literal: true
require_relative "./nameable"

# Base decorator
class Base < Nameable
  attr_accessor :nameable

  def initialize(nameable_object = nameable)
    @nameable_object = nameable_object
  end

  def correct_name
    @nameable_object.correct_name
end
