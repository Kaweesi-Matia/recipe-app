require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject { Inventory.create(name: 'Rhys', description: 'hello from the other side') }

  it 'User has to to be valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should not be too long' do
    subject.description = 'a' * 251
    expect(subject).to_not be_valid
  end
end
