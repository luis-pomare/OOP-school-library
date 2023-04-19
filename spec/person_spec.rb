require_relative './spec_helper'

describe Person do
  before :each do
    @person = Person.new 45, 'Daniel Klien'
  end

  describe '#new' do
    it 'Should return a Person object' do
      expect(@person).to be_an_instance_of Person
    end
  end

  describe '#name' do
    it 'Should return the correct name' do
      name = @person.name

      expect(name).to eql 'Daniel Klien'
    end
  end
  describe '#age' do
    it 'Should return the correct age' do
      age = @person.age

      expect(age).to eql 45
    end
  end
  describe '#id' do
    it 'Should not null' do
      id = @person.id

      expect(id).to be_an_instance_of Integer
    end
  end

  describe '#correct_name' do
    it 'Should return the correct name' do
      name = @person.correct_name

      expect(name).to eql 'Daniel Klien'
    end
  end

  describe '#can_use_services?' do
    it 'Should return true' do
      if_can = @person.can_use_services?

      expect(if_can).to be true
    end
  end

  describe '#rental' do
    it 'Should return an empty array' do
      rentals = @person.rentals

      expect(rentals).to be_an_instance_of Array
      expect(rentals.length).to eql 0
    end
  end
  describe '#add_rental' do
    it 'Should return an empty array' do
      book = Book.new 'Lords of the rings', 'Daniel Klien'
      rental = Rental.new '2023-04-13', book, @person

      @person.add_rental(rental)
      rentals = @person.rentals

      expect(rentals).to be_an_instance_of Array
      expect(rentals.include?(rental)).to be true
    end
  end
end
