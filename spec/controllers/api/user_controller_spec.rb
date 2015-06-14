require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  render_views

  context 'when valid user exists' do
    let(:user) { create(:user) }
    before do
      User.destroy_all
      http_login(user.user_name, user.password)
    end

    describe "Get 'index' " do

      before do
        create_users = create_list(:user, 9)
        get :index
      end

      it 'returns successful 200 response' do
        expect(response.status).to eq 200
      end

      it 'returns all users' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['users'].length).to eq(10)
        expect(response).to match_response_schema("user")
      end
    end

    describe "POST 'create' " do

      before do
        post :create, user: FactoryGirl.attributes_for(:user)
      end

      it 'returns successful 200 response' do
        expect(response.status).to eq 200
      end

      it 'returns created user' do
        expect(response).to match_response_schema("user")
      end
    end

    describe "DELETE 'delete' " do

      it 'returns no content 204 response' do
        delete :destroy, id: user.id
        expect(response.status).to eq 204
      end
    end
  end

  context 'with invalid user' do

    before do
      http_login("bill", "invalid")
    end

    describe "GET 'index' " do

      it 'returns unauthorized 401 response' do
        get :index
        expect(response.status).to eq 401
      end
    end

    describe "POST 'create' " do

      it 'returns unauthorized 401 response' do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response.status).to eq 401
      end
    end
  end
end
