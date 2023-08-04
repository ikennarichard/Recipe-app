require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create!(name: 'John Doe', email: 'john@gmail.com', password: 'password') }
  let(:recipe) {
    Recipe.create!(
      user: user,
      name: 'Test Recipe', preparation_time: 3, cooking_time: 6,
      description: 'This is a test recipe'
    )
  }

  it 'ensures recipe is created for a user' do
    expect(recipe).to be_valid
  end

  it 'validates the presence of name' do
    expect(recipe.name).to eq('Test Recipe')
  end
end
