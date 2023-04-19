require_relative './spec_helper.rb'

describe Teacher do
  
  before :each do
    @teacher = Teacher.new 'Programming', 47, 'Daniel Klien' 
  end
 
  describe '#new' do
    it 'Should return a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
  end

  describe '#specialization' do
    it 'Should return the correct specialization' do
      readed_specialization =  @teacher.specialization

      expect(readed_specialization).to eql 'Programming'
    end
  end

  describe '#age' do
    it 'Should return the correct age' do
      age =  @teacher.age

      expect(age).to eql 47
    end
  end

  describe '#name' do
    it 'Should return the correct name' do
      readed_name =  @teacher.name

      expect(readed_name).to eql 'Daniel Klien'
    end
  end

  describe '#can_use_services?' do
    it 'Should return always true' do
      readed_can_use_services = @teacher.can_use_services?
      expect(readed_can_use_services).to eql true
    end
  end
end
