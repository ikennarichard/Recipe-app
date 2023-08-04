require 'rails_helper'

describe Recipe, type: :model do
  subject do
    build(:recipe)
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'displays description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'displays cooking time and preparation time' do
    expect(subject.cooking_time).to eq(1.0)
    expect(subject.preparation_time).to eq(1.0)
  end
end
