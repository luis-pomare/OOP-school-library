# frozen_string_literal: true

# Date of rental for each book
class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    person.rentals.push(self)
    book.rentals.push(self)
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
