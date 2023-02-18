require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.create(name: 'tom', measurment_unit: 'kg', price: 100) }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'measurement should be a sring' do
    subject.measurment_unit = 'kg'
    expect(subject).to be_valid
  end

  it 'price should be integer' do
    subject.price = 200
    expect(subject).to be_valid
  end
end
