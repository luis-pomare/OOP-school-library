# frozen_string_literal: true

# Date of rental for each book
class Rental
  attr_accessor :date

  def inicialize(date)
    @date = date
  end
end
