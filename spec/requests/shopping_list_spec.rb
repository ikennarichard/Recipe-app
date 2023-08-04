require 'rails_helper'

RSpec.describe 'ShoppingList', type: :request do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  describe 'GET #index' do
    it 'should display the shopping list for the current user' do

      get '/general_shopping_list/'

      expect(response).to have_http_status(:success)

      expect(response.body).to include("Shopping List")
      expect(response.body).to include("Amount of food items to buy")
      expect(response.body).to include("Total value of food needed")
    end
  end
end
