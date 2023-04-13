# frozen_string_literal: true

# Date of rental for each book
class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date)
    @date = date
  end

  def book=(book)
    @book = book
    return unless book.rentals.include?(self) == false

    book.add_rental(self)
  end

  def person=(person)
    @person = person
    return unless person.rentals.include?(self) == false

    person.add_rental(self)
  end
end
