# frozen_string_literal: true
require_relative "./base"

class Capitalize < Base
  def correct_name
    @nameable_object.correct_name.capitalize()
  end
end
