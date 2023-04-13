# frozen_string_literal: true

# Books on the library
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def inicialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    if @rentals.include?(rental) == false
      @rentals.push(rental)
    end
    
    rental.book=(self)
  end
end