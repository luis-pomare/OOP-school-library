require_relative './spec_helper'

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'Should capitalized the person name' do
      person = Person.new 22, 'viniciusjunior'
      capitalized_person = CapitalizeDecorator.new person

      capitalize = capitalized_person.correct_name

      expect(capitalize).to eql 'Viniciusjunior'
    end
  end
end
