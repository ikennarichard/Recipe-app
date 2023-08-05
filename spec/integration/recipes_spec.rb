require 'rails_helper'

RSpec.describe 'Recipe Index', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  scenario 'should only display user recipes' do
    create(:recipe)
    create(:recipe)

    visit recipes_path

    expect(page).to have_content('Recipes')
    expect(page).to have_link('Add Recipe', href: new_recipe_path)

    expect(page).not_to have_content('Recipe-1')
    expect(page).not_to have_content('Recipe-2')
    expect(page).not_to have_button('Remove')
  end

  scenario 'shows a message when there are no recipes' do
    Recipe.destroy_all

    visit recipes_path
    expect(page).not_to have_selector('.recipe_card')
    expect(page).to have_content('No recipes added yet, click Add Recipe to add a new recipe')
  end

  scenario 'displays the "Remove" button for recipes owned by the current user' do
    login_as(user)

    user.recipes.create(name: 'Jellof', preparation_time: 1.0,
                        cooking_time: 1.0, description: 'Awesome rice')

    visit recipes_path

    expect(page).to have_button('Remove')
  end

  scenario 'should remove recipe owned by current user' do
    login_as(user)

    recipe = user.recipes.create(name: 'Fried rice', preparation_time: 1.0,
                                 cooking_time: 1.0, description: 'Awesome rice')

    visit recipes_path

    click_button 'Remove'
    expect(current_path).to eq(recipes_path)
    expect(page).not_to have_content(recipe)
  end

  scenario 'should display recipe details' do
    user = create(:user)
    recipe = create(:recipe, user:)

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content('Preparation Time')
    expect(page).to have_content('Cooking Time')
    expect(page).to have_content('Public:')
  end

  scenario 'should redirect to add ingredient page' do
    login_as(user)

    recipe = user.recipes.create(name: 'Fried rice', preparation_time: 1.0, cooking_time: 1.0,
                                 description: 'Awesome rice')

    visit recipe_path(recipe)

    click_link 'Add Ingredient'
    sleep 3

    expect(current_path).to eq(new_recipe_recipe_food_path(recipe))
  end
end
