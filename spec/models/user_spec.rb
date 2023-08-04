require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
  build(:user)
  end

  before { subject.save }

  it 'validates the presence of a subject' do
    expect(subject).to be_valid
  end

  it 'is expected to have many foods' do
    expect(subject.foods).to be_empty
    food = subject.foods.create!(name: 'Test Food', measurement_unit: 'grams', price: 3.99)
    expect(subject.foods).to include(food)
  end

  it 'is expected to have many recipes' do
    expect(subject.recipes).to be_empty
    recipe = subject.recipes.create!(name: 'Test Recipe', preparation_time: 3, cooking_time: 6,
                                     description: 'This is a test recipe')
    expect(subject.recipes).to include(recipe)
  end
end
