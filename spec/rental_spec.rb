require_relative './spec_helper.rb'

describe Rental do
  
  before :each do
    person = Person.new 23,'Luis'
    book = Book.new 'Lords of the rings','Daniel Klien'
    @rental = Rental.new '2023-04-13',book,person
  end
 
  describe '#new' do
    it 'Should return a Rental object' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'Should return the rental date' do
      date =  @rental.date

      expect(date).to eql '2023-04-13'
    end

  end
  describe '#book' do
    it 'Should return the current book' do
      book =  @rental.book

      expect(book).to be_an_instance_of Book
      expect(book.title).to eql 'Lords of the rings'
    end

  end
  describe '#person' do
    it 'Should return the current person' do
      person =  @rental.person

      expect(person).to be_an_instance_of Person
      expect(person.name).to eql 'Luis'
    end

  end
  
end