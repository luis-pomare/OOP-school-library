# frozen_string_literal: true

# Date of rental for each book
class Rental
  attr_accessor :date
  attr_reader :book

  def initialize(date)
    @date = date
  end

  def book=(book)
    @book = book
    return unless book.rentals.include?(self) == false

    book.add_rental(self)
  end
end
