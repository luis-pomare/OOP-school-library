require_relative './spec_helper.rb'

describe Book do
  
  before :each do
    @book = Book.new 'Lords of the rings','Daniel Klien'
  end
 
  describe '#new' do
    it 'Should return a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'Should return the correct title' do
      title =  @book.title

      expect(title).to eql 'Lords of the rings'
    end

  end
  describe '#author' do
    it 'Should return the correct author' do
      author =  @book.author

      expect(author).to eql 'Daniel Klien'
    end

  end

  describe '#rental' do
    it 'Should return an empty array' do
      rentals =  @book.rentals

      expect(rentals).to be_an_instance_of Array
      expect(rentals.length).to eql 0
    end

  end
  describe '#add_rental' do
    it 'Should return an empty array' do
      person = Person.new 23,'Luis'
      rental = Rental.new '2023-04-13',@book,person

      @book.add_rental(rental)
      rentals =  @book.rentals

      expect(rentals).to be_an_instance_of Array
      expect(rentals.include?(rental)).to be true 
    end

  end
  
end