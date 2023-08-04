require 'rails_helper'

RSpec.describe 'Recipe Index', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  scenario 'should display recipe details' do
    user = create(:user)
    recipe = create(:recipe, user: user)

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content("Preparation Time")
    expect(page).to have_content("Cooking Time")
    expect(page).to have_content("Public:")
  end

  scenario 'should redirect to add ingredient page' do
    login_as(user)
   
    recipe = user.recipes.create(name: 'Fried rice', preparation_time: 1.0, cooking_time: 1.0, description: 'Awesome rice')

    visit recipe_path(recipe)

    click_link 'Add Ingredient'
    sleep 3

    expect(current_path).to eq(new_recipe_recipe_food_path(recipe))
  end
end
