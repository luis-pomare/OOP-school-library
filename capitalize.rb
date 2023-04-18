require_relative './base'

# Class to create capitalized strings
class CapitalizeDecorator < Base
  def correct_name
    @nameable.correct_name.capitalize
  end
end
