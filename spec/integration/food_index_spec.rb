# spec/integration/food_index_spec.rb
require 'rails_helper'

RSpec.describe 'Food Index Page', type: :feature do
  let(:user) { create(:user) }

  before do
    create_list(:food, 5, user: user)
    login_as(user)
  end

  scenario 'should display foods added by the current user' do
    visit foods_path

    user.foods.each do |food|
      expect(page).to have_content(food.name)
    end
  end

  scenario 'should have an "Add Food" link that leads to a form' do
    visit foods_path

    click_link 'Add Food'

    sleep 3

    expect(current_path).to eq(new_food_path)
    expect(page).to have_content('Add new food')
    expect(page).to have_field('Name')
    expect(page).to have_field('Measurement unit')
    expect(page).to have_field('Price')
  end

  scenario 'should have an "Add Food" link that leads to a form' do
    visit foods_path

    click_link 'Add Food'

    sleep 3

    expect(current_path).to eq(new_food_path)
    expect(page).to have_content('Add new food')
    expect(page).to have_field('Name')
    expect(page).to have_field('Measurement unit')
    expect(page).to have_field('Price')
  end

  scenario 'shouuld allow the user to add a new food' do
    visit foods_path

    click_link 'Add Food'

    fill_in 'Name', with: 'Tomato'
    fill_in 'Measurement unit', with: 'grams'
    fill_in 'Price', with: 10
    fill_in 'Quantity', with: 10

    click_button 'Create food'

    sleep 3
    expect(page).to have_content('Tomato') 
    expect(page).to have_content('grams')
    expect(page).to have_content('10')
    expect(page).to have_content('10')
  end
end
