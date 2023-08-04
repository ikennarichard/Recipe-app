require 'rails_helper'

RSpec.describe 'PublicRecipies', type: :request do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  describe 'GET #index' do
    it 'should display list of public recipies' do

      get public_recipes_path

      expect(response).to have_http_status(:success)

      expect(response.body).to include("Public Recipes")
    end
  end
end
