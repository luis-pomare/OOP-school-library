require_relative './base'

# Class to create trimmed strings
class TrimmerDecorator < Base
  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0...10].to_s : @nameable.correct_name
  end
end
