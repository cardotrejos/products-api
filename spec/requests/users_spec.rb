require 'rails_helper'
require 'support/auth_helpers'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  before do
    auth_with_user(user)
  end

  describe 'GET #index' do
    before do
      create_list(:user, 3)
      get users_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON with all users' do
      expect(JSON.parse(response.body).size).to eq(4)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_attributes) { { username: 'newuser', password: 'password123' } }

      it 'creates a new user' do
        expect do
          post users_path, params: valid_attributes
        end.to change(User, :count).by(1)
      end

      it 'returns the created user with status created' do
        post users_path, params: valid_attributes
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)["username"]).to eq('newuser')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { username: '', password: '' } }

      it 'does not create a new user' do
        expect do
          post users_path, params: invalid_attributes
        end.to_not change(User, :count)
      end

      it 'returns an error status' do
        post users_path, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
