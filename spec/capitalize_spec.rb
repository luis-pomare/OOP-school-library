require_relative './spec_helper.rb'

describe CapitalizeDecorator do
  describe "#correct_name" do
    it 'Should capitalized the person name' do
      person = Person.new 22, 'viniciusjunior'
      capitalizedPerson = CapitalizeDecorator.new person

      capitalize = capitalizedPerson.correct_name

      expect(capitalize).to eql 'Viniciusjunior'
    end
  end
end